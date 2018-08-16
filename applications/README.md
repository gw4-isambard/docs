# GW4 Isambard Application Documentation

This folder contains the application documentation for the Isambard Tier-2 HPC facility.
The documentation broadly follows the format of [Archer's scientific software packages] (http://archer.ac.uk/documentation/software/).

## Format

There is a template file `templates/application.rst` and currently a partial example for vasp, `applications/vasp.rst`.  
This includes included/linked files in the folder `applications/vasp/`.
These files are duplicated in `_static/application/vasp/` which are where the links need to be pointed to ensure that files are available in the html build of the documentation`.

## Contributing

Anyone is welcome to contribute to this documentation via GitHub's pull request feature.
Start by [forking the repository](https://help.github.com/articles/fork-a-repo/) and cloning it to your local machine.

The documentation is generated using [sphinx](http://www.sphinx-doc.org/en/master/), with pages written using the [reStructuredText format](http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html).
You will need to install `sphinx` to build the documentation locally (available from most package managers or via `pip install sphinx`.
Run `make html` to build the HTML documentation, which is generated into the `_build/html/` directory.

After you have pushed your changes to your fork on GitHub, [open a pull request](https://help.github.com/articles/using-pull-requests/) to submit your contributions.
