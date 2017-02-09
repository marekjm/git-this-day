#!/usr/bin/env bash

BRANCH=$1

if [[ $GIT_THIS_DAY_USER_EMAIL == '' ]]; then
    GIT_THIS_DAY_USER_EMAIL=$(git config --get user.email)
fi

git checkout $1 &> /dev/null
if [[ $VERBOSE == 'true' ]]; then
    echo "checking branch $(git rev-parse --abbrev-ref HEAD)"
fi
git log --oneline --author "$GIT_THIS_DAY_USER_EMAIL" --since 16hours
