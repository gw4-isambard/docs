.. GW4-Isambard documentation master file, created by
   sphinx-quickstart on Wed Jul 18 20:03:44 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Isambard User Documentation
===========================

Isambard is a HPC service provided by `GW4 <http://gw4.ac.uk>`_ and the `UK Met Office <https://www.metoffice.gov.uk>`_.
The system is funded by `EPSRC <http://www.epsrc.ac.uk>`_ and is one of six Tier-2 HPC facilities in the UK.

Isambard is a Cray XC50 system which comprises 10,496 cores, and is one of the worlds first production Arm-based supercomputers.
Each of the 164 compute nodes contains two 32-core Cavium ThunderX2 processors running at 2.1 GHz, and has 256 GB of DDR4-2666 memory.
The nodes are connected via Cray Aries interconnect with a Dragonfly topology.
A Cray Sonexion 3000 storage cabinet provides 480 terabytes of Lustre storage.


Acknowledging Isambard
----------------------

Research outputs that have made use of Isambard should acknowledge the facility by using the following phrase:

*TODO*


.. toctree::
   :maxdepth: 2
   :caption: Isambard User Guide

   user-guide/connecting.rst
   user-guide/filesystem.rst
   user-guide/jobs.rst
   user-guide/nodes.rst
   user-guide/debugging.rst
   user-guide/profiling.rst


.. toctree::
   :maxdepth: 2
   :caption: Development Tools

   tools/ddt
   tools/gdb4hpc
   tools/map
   tools/perftools


.. toctree::
   :maxdepth: 2
   :caption: Applications

   applications/castep
   applications/cp2k
   applications/gromacs
   applications/hydro3d
   applications/molpro
   applications/namd
   applications/nemo
   applications/openfoam
   applications/opensbli
   applications/um
   applications/vasp


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
