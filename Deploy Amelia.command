#!/bin/bash
# Deploy Amelia — commits everything in this folder and pushes it live.
# Reads the GitHub token from the git-ignored .token file (never committed).

cd "$(dirname "$0")" || exit 1

if [ ! -f .token ]; then
  echo "No .token file found. Create it with:"
  echo '  echo "github_pat_XXXX" > ~/Desktop/amelia/.token'
  read -n 1 -s -r -p "Press any key to close"; exit 1
fi
PAT="$(cat .token | tr -d '[:space:]')"
REMOTE="https://x-access-token:${PAT}@github.com/meyeze/amelia.git"

echo "=== AMELIA DEPLOY ==="
echo "Pulling latest from GitHub..."
git pull --rebase "$REMOTE" main

echo "Committing local changes..."
git add -A
git -c user.name="Nathan Mize" -c user.email="mize.nathan@gmail.com" \
    commit -m "Amelia update $(date '+%Y-%m-%d %H:%M')" || echo "(nothing new to commit)"

echo "Pushing to GitHub..."
if git push "$REMOTE" HEAD:main; then
  echo ""
  echo "=== DEPLOYED — site refreshes in about a minute ==="
else
  echo ""
  echo "=== PUSH FAILED — check the message above, or ask Claude ==="
fi
echo ""
read -n 1 -s -r -p "Press any key to close this window"
