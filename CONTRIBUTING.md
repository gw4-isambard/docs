# Contributing to Intro to CPP

The following is a set of guidelines for contributing to the training material: Introduction to Cloud Pilot Project.
These are not rules but will help to avoid conflict and help to ensure the smooth development of the project and adoption of Pull Requests.

Table of Contents

[What you need to know](#what-you-need-to-know)

[How to contribute](#how-to-contribute)

* [Reporting Bugs](#reporting-bugs)
* [Suggesting Enhancements](#suggesting-enhance)
* [Pull Requests](#pull-requests)

[Stlyeguide](#styleguide)

* [Git commit messages](#git-commit-messages)
* [Documenting](#documenting)

[Notes](#notes)

* [Labels](#labels)

## What you need to know

Introductiuon to Cloud Pilot Project contains tutorials onborading users of the University of Bath cloud pilot project to use the cloud for HPC and HTC workloads.
It is built using [nbfancy](https://github.com/JDBetteridge/nbfancy) which allows the ready use of Jupyter notebooks to produce the rendered content.
Content is written in Ipthon notebooks allowing the intermixing of `md` and code.
To facilitate the initial development we will not be making full use of nbfancy's capability will principally be using `md` and not the ability to render IO from code.
Wherever possible you should avoid use md rather than html to simplify contributions.

## How to Contribute

If you have questions about the Cloud Pilot Project you should contact one of the team or raise a ticket.
Issues identifying bugs and suggesting new features should be used to improve the documentation.

### Reporting Bugs

If you find a bug in the material please check existing issues to confirm whether this has already been reported.

If it is a new bug raise an issue:

* Use a clear and descriptive title
* Describe in more detail if necessary
* Add a :bug: label to the issue

### Suggesting Enhancements

If you feel that the material culd be improved, or important content is missing please check whether it has already been siggesting in the issues.

If it is a new enhancement raise an issue:

* Use a clear and descriptive title
* Describe in more detail if necessary
* Add a :sparkles: label to the issue

### Pull Requests

If you wish to fix a bug or develop a new feature then these will be gratefull received.
This project follows the [branching guide](https://gist.github.com/digitaljhelms/4287848#file-gistfile1-md)
We do not currently have a `stable` branch which will be created once a first release of the tutorial is ready.

* First fork the repository
* Branches from `master` should be of the form:
  * `topic-#<issue id>[- optional brief description]`
* Verify that nbfancy renders the tutorial correctly
* Create a pull request from the branch to upstream/master
  * Reference the `#<issue id>`
  * Provide an additional description if necessary
  * Add a reviewer to the PR
  * Unless unavoidable contributors should not merge their own PRs (and if necessary should be noted in the PR)

## Styleguide

### Git Commit Messages

* Title should briefly describe changes - use multi-line where necessary
* Should be imperative
* Typically use past tense
* Do not need to issue self-reference as this is in the branch
* Reference other issues/PR in multi-line

### Documenting

When adding to documentation, including content in Jupyter notebooks, use plain `md` (+`nbfancy` decorators) as far as possible.
This avoids contributors having to write in html.

## Notes

### Labels

Issues should use the following labels:

| Label name | Description |
| ----- | ------|
| `Enhancement` | New feature request |
| `Bug` | A bug: error/type/render issue |
