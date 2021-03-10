.. GW4-Isambard documentation master file, created by
   sphinx-quickstart on Wed Jul 18 20:03:44 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Isambard User Documentation
===========================

Isambard is a HPC service provided by `GW4 <http://gw4.ac.uk>`_ and the `UK Met Office <https://www.metoffice.gov.uk>`_.
The system is funded by `EPSRC <http://www.epsrc.ac.uk>`_ and is one of a number of `Tier-2 HPC facilities http://www.hpc-uk.ac.uk/facilities/` in the UK.

Isambard is a Cray XC50 system which comprises 20,992 cores, and is one of the worlds first production Arm-based supercomputers. While Isambard is not based on the more common x86 processors from Intel and AMD, most software compiles and runs on Isambard with no or minimal changes.

Each of the 329 compute nodes contain two 32-core Marvell ThunderX2 processors running at 2.5 GHz. 160 nodes have 256 GB and 169 have 512 GB of memory, both at DDR4-2666MHz.
The nodes are connected via Cray Aries interconnect in a Dragonfly topology.
A Cray Sonexion 3000 storage cabinet provides 900 terabytes of Lustre storage.


System Status
-------------

.. important::
    18 Jan. 2021
    
    - XCI (ARM ThunderX2): Available
    - MACS: Available
    - A64fx: In testing

Acknowledging Isambard
----------------------

Research outputs that have made use of Isambard should acknowledge the facility by using the following phrase:

    *This work used the Isambard UK National Tier-2 HPC Service (http://gw4.ac.uk/isambard/) operated by GW4 and the UK Met Office, and funded by EPSRC (EP/P020224/1)*


.. toctree::
   :maxdepth: 2
   :caption: Isambard User Guide

   user-guide/requestaccount.rst
   user-guide/connecting.rst
   user-guide/filesystem.rst
   user-guide/jobs.rst
   user-guide/MACS.rst
   user-guide/XCI.rst
   user-guide/A64FX.rst
   user-guide/software.md
   user-guide/debugging.rst
   user-guide/profiling.rst
   user-guide/end_project.rst
   user-guide/support.rst


.. toctree::
   :maxdepth: 2
   :caption: Development Tools

   tools/ddt
   tools/gdb4hpc
   tools/map
   tools/perftools


.. toctree::
   :maxdepth: 1
   :caption: Applications

   applications/castep
   applications/covidsim
   applications/cp2k
   applications/dedalus
   applications/dlmonte
   applications/firedrake
   applications/gromacs
   applications/hydro3d
   applications/molpro
   applications/namd
   applications/nemo
   applications/openfoam
   applications/opensbli
   applications/um
   applications/vasp


.. toctree::
   :maxdepth: 1
   :caption: Service Policies

   policies/terms.rst
   policies/privacy.rst


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
