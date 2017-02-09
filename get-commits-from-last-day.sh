#!/usr/bin/env bash

BRANCH=$1

if [[ $GIT_THIS_DAY_USER_EMAIL == '' ]]; then
    GIT_THIS_DAY_USER_EMAIL=$(git config --get user.email)
fi

git checkout $1 &> /dev/null
if [[ $VERBOSE == 'true' ]]; then
    echo "checking branch $(git rev-parse --abbrev-ref HEAD)"
fi

GIT_THIS_DAY_BRANCH_REPORT=$(git log --oneline --author "$GIT_THIS_DAY_USER_EMAIL" --since 16hours)

if [[ $GIT_THIS_DAY_BRANCH_REPORT != '' ]]; then
    WHITE="\033[1;37m"
    LIGHT_GREEN="\033[1;32m"
    RESET="\033[0m"
    echo -e "[$LIGHT_GREEN""note$RESET] on branch '$WHITE$BRANCH$RESET'" >> /tmp/git-this-day.txt
    echo "$GIT_THIS_DAY_BRANCH_REPORT" >> /tmp/git-this-day.txt
    echo '' >> /tmp/git-this-day.txt
fi
