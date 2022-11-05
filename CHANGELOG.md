# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
No changes planned

## [v2.1.1] - 2022-11-05
### Changed
- Configure action to use NodeJS v16 instead of v12.
  [Reason](https://github.blog/changelog/2022-09-22-github-actions-all-actions-will-begin-running-on-node16-instead-of-node12/)

## [v2.1.0] - 2021-02-09
### Added
- Add `global` option to configure global git user, name and password.
  Default value is `false` for backward compatibility

## [v2] - 2020-11-14
### Changed
- Replace deprecated `set-env` command with setting env variables via $GITHUB_ENV file

## [v1] - 2020-03-06
### Added
- Add configurable git user name, email and password for commits created in a course of a workflow
- Add configurable actor and token to push updates from a workflow
