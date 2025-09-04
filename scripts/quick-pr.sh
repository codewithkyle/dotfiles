#!/usr/bin/env bash

set -euo pipefail

# gh-flow.sh
# Usage:
#   ./bin/gh-flow.sh "Commit message (required)" [branch-name] [base-branch]
#
# Steps:
#  1) Create a new branch with a unique name (or use arg2)
#  2) Commit all changes with message from arg1
#  3) Push the branch
#  4) Open a PR and merge it into base branch (default auto-detected; falls back to master/main)
#  5) Checkout the base branch
#  6) Pull changes

# --- prerequisites ---
command -v git >/dev/null 2>&1 || { echo "git not found"; exit 1; }
command -v gh  >/dev/null 2>&1 || { echo "gh (GitHub CLI) not found"; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "gh not authenticated. Run: gh auth login"; exit 1; }

# --- args ---
if [[ $# -lt 1 || -z "${1// }" ]]; then
  echo "Usage: $0 \"Commit message\" [branch-name] [base-branch]"
  exit 1
fi

COMMIT_MSG="$1"
BRANCH_NAME="${2:-"auto/$(whoami 2>/dev/null || echo user)-$(date +%Y%m%d-%H%M%S)"}"

# Detect base branch:
detect_base_branch() {
  # Try to read origin/HEAD -> origin/<branch>
  if origin_head_ref=$(git symbolic-ref -q --short refs/remotes/origin/HEAD 2>/dev/null); then
    echo "${origin_head_ref#origin/}"
    return
  fi
  # Fallbacks:
  if git rev-parse --verify -q master >/dev/null; then echo "master"; return; fi
  if git rev-parse --verify -q main   >/dev/null; then echo "main";   return; fi
  # Last resort: whatever current branch tracks
  git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null | awk -F/ '{print $2}' || echo "master"
}

BASE_BRANCH="${3:-"$(detect_base_branch)"}"

echo "Base branch: $BASE_BRANCH"
echo "Working branch: $BRANCH_NAME"

# Ensure weΓÇÖre on latest base before branching
git fetch origin --prune
git checkout "$BASE_BRANCH"
git pull --ff-only || true

# 1) Create branch
git checkout -b "$BRANCH_NAME"

# 2) Commit all changes
git add -A
if git diff --cached --quiet; then
  echo "No staged changes to commit. Exiting."
  exit 0
fi
git commit -m "$COMMIT_MSG"

# 3) Push branch
git push -u origin "$BRANCH_NAME"

# 4) Open PR and merge
# If a PR already exists, gh will just reuse it for merge.
if ! gh pr view "$BRANCH_NAME" >/dev/null 2>&1; then
  gh pr create \
    --base "$BASE_BRANCH" \
    --head "$BRANCH_NAME" \
    --title "$COMMIT_MSG" \
    --body ""
fi

# Merge with a regular merge commit; adjust to --squash or --rebase if preferred
gh pr merge "$BRANCH_NAME" --merge --delete-branch --admin || gh pr merge "$BRANCH_NAME" --merge --delete-branch

# 5) Checkout base branch
git checkout "$BASE_BRANCH"

# 6) Pull latest
git pull --ff-only

echo "Done. Branch '$BRANCH_NAME' merged into '$BASE_BRANCH' and pulled locally."

