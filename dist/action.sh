#!/bin/sh
set -e

INPUT_EMAIL=${INPUT_EMAIL:-'github-action@users.noreply.github.com'}
INPUT_NAME=${INPUT_NAME:-'GitHub Action'}
INPUT_ACTOR=${INPUT_ACTOR:-${GITHUB_ACTOR}}
INPUT_TOKEN=${INPUT_TOKEN:-"${{ secrets.GITHUB_TOKEN }}"}

git config user.email ${INPUT_EMAIL}
git config user.name ${INPUT_NAME}
git config user.password ${INPUT_TOKEN}
echo "::set-env name=GIT_USER::${INPUT_ACTOR}:${INPUT_TOKEN}"
