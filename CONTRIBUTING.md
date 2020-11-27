# Contributing to Intro to CPP

The following is a set of guidelines for contributing to the GW4 Isambard documentation: https://github.com/gw4-isambard/docs.
These are not rules but will help to avoid conflict and help to ensure the smooth development of the material.

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

Isambard docs provides user documentation for the GW4 Tier-2 HPC, Isambard.
The project is funded by EPSRC and operated by the Universities of Bath, Bristol, Cardiff and Exeter, hosted at the MetOffice and supported by HPE Cray, Arm and Marvell.
It is built using [sphinx](http://www.sphinx-doc.org/en/master/) with pages written using the [reStructuredText format](http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html).
You will need to install `sphinx` to build the documentation locally (available from most package managers or via `pip install sphinx`.
Run `make html` to build the HTML documentation, which is generated into the `_build/html/` directory.
Content is written in Ipthon notebooks allowing the intermixing of `md` and code.
To facilitate the initial development we will not be making full use of nbfancy's capability will principally be using `md` and not the ability to render IO from code.
Wherever possible you should avoid use md rather than html to simplify contributions.

## How to Contribute

If you have questions about the Isambard documentation you should contact one of the team or raise a ticket by emailing `isambard-support@gw4.ac.uk`.
Issues identifying bugs and suggesting new features should be used to improve the documentation.

### Reporting Bugs

If you find a bug in the material please check existing issues to confirm whether this has already been reported.

If it is a new bug raise an issue:

* Use a clear and descriptive title
* Describe in more detail if necessary
* Add a :bug: label to the issue

### Suggesting Enhancements

If you feel that the material culd be improved, or important content is missing please check whether it has already been suggested in the issues.

If it is a new enhancement raise an issue:

* Use a clear and descriptive title
* Describe in more detail if necessary
* *Optionally* add a :sparkles: label to the issue

### Pull Requests

If you wish to fix a bug or develop a new feature then these will be gratefully received.
You're encouraged to follow the [branching guide](https://gist.github.com/digitaljhelms/4287848#file-gistfile1-md)
Master is our  `stable` branch.

* First fork the repository
* Branches from `master` should be of the form:
  * `topic-#<issue id>[- optional brief description]`
* Verify that sphinx materials the docs correctly
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

When adding to documentation, use reStructuredText format `rst`.

## Notes

### Labels

Issues should use the following labels:

| Label name | Description |
| ----- | ------|
| `Enhancement` | New feature request |
| `Bug` | A bug: error/type/render issue |
