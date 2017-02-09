#!/usr/bin/env bash

BRANCH=$1

GIT_THIS_DAY_BRANCH=$(git rev-parse --abbrev-ref HEAD)
GIT_THIS_DAY_CLEAR=$(echo -n "$GIT_THIS_DAY_BRANCH" | sed 's/\n//' | sed 's/./ /g')

WHITE="\033[1;37m"
LIGHT_GREEN="\033[1;32m"
RESET="\033[0m"
echo -ne "analysing branch $WHITE$GIT_THIS_DAY_BRANCH$RESET"
GIT_THIS_DAY_BRANCH_REPORT=$(git log --oneline --author "$GIT_THIS_DAY_USER_EMAIL" --since 16hours)

if [[ $GIT_THIS_DAY_USER_EMAIL == '' ]]; then
    GIT_THIS_DAY_USER_EMAIL=$(git config --get user.email)
fi

git checkout $1 &> /dev/null

if [[ $GIT_THIS_DAY_BRANCH_REPORT != '' ]]; then
    echo '' >> /tmp/git-this-day.txt
    echo -e "[$LIGHT_GREEN""note$RESET] on branch '$WHITE$BRANCH$RESET'" >> /tmp/git-this-day.txt
    echo "$GIT_THIS_DAY_BRANCH_REPORT" >> /tmp/git-this-day.txt
fi

echo -ne "\033[1G\033[0K"
