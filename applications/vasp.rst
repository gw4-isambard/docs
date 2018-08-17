VASP
====

Useful links
------------

- `Vasp <http://www.vasp.at/>`_
- `Documentation <http://www.vasp.at/index.php/documentation>`_

Licensing
---------

Vasp is licensed software and is not currently provided on Isambard.  If you hold a license you can build Vasp using the instructions below.  For further details about the license and to purchase one please visit the `Vasp website <http://www.vasp.at/>`_.

Access
------

Vasp is not currently available on Isambard.

Versions
--------

The use and build instructions are for Vasp 5.4.4.

Running
-------

To run Vasp on Isambard you will need to provide your source code.  Instructions for compiling on Isambard are provided below.

Example Job Submission Scripts
..............................

Arm
...

.. literalinclude:: vasp/jobscript_arm
   :language: bash

x86
...

.. literalinclude:: vasp/jobscript_x86
   :language: bash

Compilation
-----------

Arm
...

Instructions for building Vasp on Arm:

Download :download:`makefile.include.arm <vasp/makefile.include.arm>` and copy it to `makefile.include` in the root of the source folder

.. literalinclude:: vasp/build_arm
   :language: bash

x86
...

Instructions for building Vasp on x86:

Download :download:`makefile.include.x86 <vasp/makefile.include.x86>` and copy it to `makefile.include` in the root of the source folder.  Alternatively copy makefile.include.linux_intel from the `arch` folder as these files are identical.

.. literalinclude:: vasp/build_x86
   :language: bash

.. Previous Versions
   -----------------

   Documentation for building and running previous versions is available `here <vasp/versions/>`_
