#!/usr/bin/env bash

if [[ $GIT_THIS_DAY_DEPTH == '' ]]; then
    GIT_THIS_DAY_DEPTH=40
fi
if [[ $GIT_THIS_DAY_DEPTH == 'all' ]]; then
    GIT_THIS_DAY_DEPTH=$(git branch | wc -l)
fi

GIT_THIS_DAY_PATH=/usr/local/lib/git-this-day

GIT_THIS_DAY_WHITE="\033[1;37m"
GIT_THIS_DAY_LIGHT_GREEN="\033[1;32m"
GIT_THIS_DAY_RESET="\033[0m"
export GIT_THIS_DAY_WHITE
export GIT_THIS_DAY_LIGHT_GREEN
export GIT_THIS_DAY_RESET

STARTING_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo -e "[$GIT_THIS_DAY_LIGHT_GREEN""note$GIT_THIS_DAY_RESET] starting branch: '$GIT_THIS_DAY_WHITE$STARTING_BRANCH$GIT_THIS_DAY_RESET'"

echo -n '' > /tmp/git-this-day.txt

git branch --sort=-committerdate --verbose | head -n "$GIT_THIS_DAY_DEPTH" | sed 's/^\*/ /' | awk '{ print $1 }' | sort | uniq | xargs -n 1 $GIT_THIS_DAY_PATH/get-commits-from-last-day.sh
git checkout "$STARTING_BRANCH" &> /dev/null

cat /tmp/git-this-day.txt
