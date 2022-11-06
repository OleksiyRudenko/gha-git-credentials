#!/bin/sh
set -e

__warning_title="Not the latest version of oleksiyrudenko/gha-git-credentials action in use"
__warning="
This workflow uses oleksiyrudenko/gha-git-credentials@v2.1

It is recommended to use oleksiyrudenko/gha-git-credentials@v2-latest to have the latest backward compatible version of the action within the scope of v2.

See https://github.com/OleksiyRudenko/gha-git-credentials/blob/master/CHANGELOG.md for the most recent updates.
"

echo "::warning title=$__warning_title::$__warning"

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
