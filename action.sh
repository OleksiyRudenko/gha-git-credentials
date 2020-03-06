#!/bin/sh
set -e

INPUT_EMAIL=${INPUT_EMAIL:-'github-action@users.noreply.github.com'}
INPUT_NAME=${INPUT_NAME:-'GitHub Action'}
INPUT_ACTOR=${INPUT_ACTOR:-${GITHUB_ACTOR}}
# INPUT_TOKEN=${INPUT_TOKEN:-"${{ secrets.GITHUB_TOKEN }}"}
INPUT_GLOBAL=${INPUT_GLOBAL:-false}
_GIT_GLOBAL_OPTION=''

IF ${INPUT_GLOBAL}; then
  _GIT_GLOBAL_OPTION='--global'
fi

git config $_GIT_GLOBAL_OPTION user.email ${INPUT_EMAIL}
git config $_GIT_GLOBAL_OPTION user.name ${INPUT_NAME}
git config $_GIT_GLOBAL_OPTION user.password ${INPUT_TOKEN}
echo "::set-env name=GIT_USER::${INPUT_ACTOR}:${INPUT_TOKEN}"
