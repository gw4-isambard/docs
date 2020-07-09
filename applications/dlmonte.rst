DL\_MONTE 2
===========

Useful links
------------

- `DL\_MONTE 2 <https://www.ccp5.ac.uk/DL_MONTE>`_
- `User-hub <https://gitlab.com/dl_monte/user-hub>`_
- `Tutorials <https://dl_monte.gitlab.io/dl_monte-tutorials-pages/>`_

Licensing
---------

The `current release <https://gitlab.com/dl_monte/dl_monte-releases>`_ of DL\_MONTE 2 can be obtained free of charge.

Access
------

DL\_MONTE is not currently available on Isambard.

Versions
--------

The use and build instructions are for release 2.07.

Running
-------

To run DL\_MONTE 2 on Isambard you will need to provide your source code.  Instructions for compiling on Isambard are provided below.

Example Job Submission Scripts
..............................

Arm
...

.. literalinclude:: dlmonte/jobscript_arm
   :language: bash

Cray XC machines only allow one `aprun` job per node.  In order to run fully populated nodes, you will need to use a taskfarmer such as:

- `Taskfarmer <https://github.com/lohedges/taskfarmer>`_ by Lester Hedges
- `Simple taskfarmer <https://github.com/wrs20/simple_taskfarm>`_ by William Saunders

x86
...

.. literalinclude:: dlmonte/jobscript_x86
   :language: bash

Compilation
-----------

Arm
...

As of 9th July 2020 the latest version of DL\_MONTE 2 can be downloaded directly with:

::

  wget https://gitlab.com/dl_monte/dl_monte-releases/-/raw/master/dl_monte_release_v2.07.tar.gz



Instructions for building DL\_MONTE 2 on Arm:

.. literalinclude:: dlmonte/build_arm
   :language: bash

x86
...

Instructions for building DL\_MONTE 2 on x86:

.. literalinclude:: dlmonte/build_x86
   :language: bash

.. Previous Versions
   -----------------

   Documentation for building and running previous versions is available `here <dlmonte/versions/>`_
