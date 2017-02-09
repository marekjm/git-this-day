#!/usr/bin/env bash

set -e

if [[ $GIT_THIS_DAY_DEPTH == '' ]]; then
    GIT_THIS_DAY_DEPTH=40
fi
if [[ $GIT_THIS_DAY_DEPTH == 'all' ]]; then
    GIT_THIS_DAY_DEPTH=$(git branch | wc -l)
fi

GIT_THIS_DAY_PATH=/usr/local/lib/git-this-day

STARTING_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "[note] starting branch: $STARTING_BRANCH"

git branch --sort=-committerdate --verbose | head -n "$GIT_THIS_DAY_DEPTH" | sed 's/^\*/ /' | awk '{ print $1 }' | sort | uniq | xargs -n 1 $GIT_THIS_DAY_PATH/get-commits-from-last-day.sh
git checkout "$STARTING_BRANCH" &> /dev/null
