#!/bin/sh
set -e

INPUT_GLOBAL=${INPUT_GLOBAL:-false}
_GIT_GLOBAL_OPTION=''
if [ "$INPUT_GLOBAL" = true ] ; then
  _GIT_GLOBAL_OPTION='--global'
fi

INPUT_EMAIL="${INPUT_EMAIL:-'github-action@users.noreply.github.com'}"
INPUT_NAME="${INPUT_NAME:-'GitHub Action'}"
INPUT_ACTOR=${INPUT_ACTOR:-${GITHUB_ACTOR}}

git config $_GIT_GLOBAL_OPTION user.email "${INPUT_EMAIL}"
git config $_GIT_GLOBAL_OPTION user.name "${INPUT_NAME}"
git config $_GIT_GLOBAL_OPTION user.password ${INPUT_TOKEN}
echo "GIT_USER=${INPUT_ACTOR}:${INPUT_TOKEN}" >> $GITHUB_ENV
