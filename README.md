# Git Credentials

[GitHub Action](https://github.com/features/actions) for setting up
git credentials.

This project deployment workflow uses this action.

This can be useful when workflow provides for creating commits
(e.g. when publishing content) and/or pushing commits to remote repos.

Default values would work for the most cases.
However **token** parameter must be passed to the action explicitly.

GitHub requires the use of
a [Personal Access Token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line)
assigned to the calling workflow
[secrets](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables)
for pushing to repositories other than the repo the workflow is triggered for.

Pushing to the current repository should work
with the always-available GitHub Token `{{ secrets.GITHUB_TOKEN }}`.

You may also want to override default git user name and email.

Actor would also be overridden when pushing to a repo cloud other than GitHub.

## Inputs

- `name`: value for git config user.name (default: `GitHub Action`)
- `email`: value for git config user.email (default: `github-action@users.noreply.github.com`)
- `actor`: value used to construct GIT_USER (default: **github.actor**)
- `token`: value for git config user.password and GIT_USER

## Outputs

No outputs produced.

## Usage Example

```yaml
name: Deployment
on:
  push:
    branches:
      - master
jobs:
  publish:
    - uses: actions/checkout@v2
    # publish to a branch in current repo using GITHUB_TOKEN and other default settings
    - uses: oleksiyrudenko/gha-git-credentials@v1
      with:
        token: '${{ secrets.GITHUB_TOKEN }}'
    - run: |
        yarn run build
        yarn run deploy
    # publish to a branch in different repo using a PAT generated on that other repo
    - uses: oleksiyrudenko/gha-git-credentials@v2
      with:
        name: 'Oleksiy Rudenko'
        email: 'oleksiy.rudenko@domain.com'
        actor: 'OleksiyRudenko'
        token: '${{ secrets.GH_PAT_WEB_CENTRAL }}'
    - run: |
        git remote add web-central https://github.com/some-organization/website.git
        yarn run deploy web-central/master
```

## License

Scripts and documentation in this project are released under the [MIT license](LICENSE).

## No affiliation with GitHub Inc.

GitHub are registered trademarks of GitHub, Inc.
GitHub name used in this project are for identification purposes only.
The project is not associated in any way with GitHub Inc.
and is not an official solution of GitHub Inc.
It was made available in order to facilitate the use of the site GitHub.
