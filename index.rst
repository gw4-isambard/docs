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


System Status
-------------

=======
.. important::
    14 Sept 2020
    
    Dear users,
    
    We’re delighted to be able to announce that the long-awaited upgrade to Isambard will take place next week, starting on Monday September 21st. The upgrade is likely to take most of the week, and we anticipate that the system will be down for most of this time. 
    
    Once the system is back up as Isambard 2, it will have twice the capacity in its XC50 Arm partition (up from 164 to 328 compute nodes, or 20,992 cores), as well as a doubling of storage capacity to 1 PByte. At the same time, the 72 Fujitsu A64FX nodes will be installed as a new Apollo 80 system.
    
    We will keep you informed as to progress, but do keep in mind that Isambard is likely to be unavailable for most of the week of Sep 21st during these upgrades.

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
   user-guide/phase1.rst
   user-guide/phase2.rst
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
