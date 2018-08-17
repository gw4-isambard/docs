TEMPLATE
========

Useful links
------------

- `Based on Archer <http://archer.ac.uk/documentation/software/>`_
- `Google <https://www.google.com>`_
- `Documentation <https://lmgtfy.com>`_

Licensing
---------

TEMPLATE is open source. See `TEMPLATE License Agreement <https://opensource.org/licenses>`_

Access
------

Additional terms of use on Isambard

Version
--------

TEMPLATE-0.0.0a

Running
-------

To run TEMPLATE you need to load the correct module:

.. literalinclude:: application/modules.load

Example Job Submission Script
.............................

Arm
...

.. literalinclude:: application/jobscript_arm
   :language: bash

x86
...

.. literalinclude:: application/jobscript_x86
   :language: bash

Compilation
-----------

Arm
...

Instructions for building TEMPLATE on Arm:

Download :download:`makefile.arm <application/makefile.arm>` and copy it to `makefile` in the root of the source folder

.. literalinclude:: application/build_arm
   :language: bash

x86
...

Instructions for building TEMPLATE on x86:

Download :download:`makefile.x86 <application/makefile.x86>` and copy it to `makefile` in the root of the source folder.

.. literalinclude:: application/build_x86
   :language: bash

.. Previous Versions
   -----------------

   Documentation for building and running previous versions is available `here <application/versions/>`_
