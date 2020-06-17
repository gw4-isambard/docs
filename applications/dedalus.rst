Dedalus
========

Useful links
------------

- `Dedalus Project <http://dedalus-project.org>`_
- `Dedalus documentation <https://dedalus-project.readthedocs.io/en/latest/>`_

Licensing
---------

Dedalus is released under the GNU General Public License. See `Dedalus Project - About <http://dedalus-project.org/about/>`_

Building
--------

The following steps describe how to build Dedalus on Isambard.

1. Make a directory for your Dedalus build e.g.

::

  cd
  mkdir dedalus
  cd dedalus

2. Take a copy of the install script and run it

::

  cp /projects/exeter/dedalus/scripts/install_dedalus_isambard.sh  .
  ./install_dedalus_isambard.sh

The script will build a python distribution with the required packages installed
and then install Dedalus itself.

3. Test your installation with an example

::

  mkdir test
  cd test
  cp /projects/exeter/dedalus/scripts/dedalus_test.pbs .

If your Dedalus installation is in ``~/dedalus`` then you do not need to modify the job script.
If your Dedalus installation is somewhere else then edit the scipt so that the ``my_dedlus`` variable
points to your installation. You can now submit the test job to the queue

::

  qsub dedalus_test.pbs
