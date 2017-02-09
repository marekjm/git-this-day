#!/usr/bin/env bash

BRANCH=$1

GIT_THIS_DAY_BRANCH=$(git rev-parse --abbrev-ref HEAD)
GIT_THIS_DAY_CLEAR=$(echo -n "$GIT_THIS_DAY_BRANCH" | sed 's/\n//' | sed 's/./ /g')

echo -ne "analysing branch $GIT_THIS_DAY_WHITE$GIT_THIS_DAY_BRANCH$GIT_THIS_DAY_RESET"
GIT_THIS_DAY_BRANCH_REPORT=$(git log --oneline --author "$GIT_THIS_DAY_USER_EMAIL" --since 16hours)

if [[ $GIT_THIS_DAY_USER_EMAIL == '' ]]; then
    GIT_THIS_DAY_USER_EMAIL=$(git config --get user.email)
fi

git checkout $1 &> /dev/null

if [[ $GIT_THIS_DAY_BRANCH_REPORT != '' ]]; then
    echo '' >> /tmp/git-this-day.txt
    echo -e "[$GIT_THIS_DAY_LIGHT_GREEN""note$GIT_THIS_DAY_RESET] on branch '$GIT_THIS_DAY_WHITE$BRANCH$GIT_THIS_DAY_RESET'" >> /tmp/git-this-day.txt
    echo "$GIT_THIS_DAY_BRANCH_REPORT" >> /tmp/git-this-day.txt
fi

echo -ne "\033[1G\033[0K"
