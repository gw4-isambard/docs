Arm DDT
=======

DDT is a tool for debugging C, C++ and Fortran parallel programs. It is available on both phase 1 and phase 2 as part of the Forge suite.

Useful links
-------------

A User Guide and Getting Started guide are available from https://developer.arm.com/tools-and-software/server-and-hpc/debug-and-profile/arm-forge/arm-ddt 

Modules
---------

To use DDT you will need to load the Forge module. On phase 1 the command is
::

  module load allinea/forge

and on phase 2 the command is
::

  module load tools/arm-forge

When you have loaded the module you can start the DDT graphical interface by running the command ``ddt &``. 

Example session
----------------

This example uses an interactive job running in the ``arm-dev`` queue to debug a parallel program. 

Start by compiling your program with a ``-g`` flag to retain extra debugging information. For example to compile a C program called ``myprog.c`` run
::
  cc -g -o myprog myprog.c
which will produce an executable file called ``myprog``.

Next start an interactive job by running the command
::
  qsub -I -X -q arm-dev -l select=1 -l walltime=1:00:00
This starts an interactive job (``-I``) with X11 graphics forwarding (``-X``) using 1 compute node for up to 1 hour. 

When the job starts load the Forge module
::
  module load tools/arm-forge
We can now run ``ddt`` and tell it to start our program
::
  ddt aprun -n 2 ./myprog
This example runs ``myprog`` with with 2 MPI processes. The ``ddt`` graphical interface will open and from here you can launch and debug your program.



