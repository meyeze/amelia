#!/bin/bash
# Deploy Amelia — commits everything in this folder and pushes it live.
# Double-click me after Claude updates the files.

cd "$(dirname "$0")" || exit 1
PAT="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"
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
