.. GW4-Isambard documentation master file, created by
   sphinx-quickstart on Wed Jul 18 20:03:44 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Isambard User Documentation
===========================

Isambard is a HPC service provided by `GW4 <http://gw4.ac.uk>`_ and the `UK Met Office <https://www.metoffice.gov.uk>`_.
The system is funded by `EPSRC <http://www.epsrc.ac.uk>`_ and is one of a number of `Tier-2 HPC facilities <http://www.hpc-uk.ac.uk/facilities/>`_ in the UK.

.. warning::
    The Isambard 2 service was retired on 30th September 2024 and these pages are also retired.

    Isambard 3 information available at `Bristol Centre for Supercomputing Documentation <https://docs.isambard.ac.uk>`_

Isambard is a Cray XC50 system which comprises 20,992 cores, and is one of the world's first production Arm-based supercomputers. While Isambard is not based on the more common x86 processors from Intel and AMD, most software compiles and runs on Isambard with no or minimal changes.

Each of the 329 compute nodes contain two 32-core Marvell ThunderX2 processors running at 2.5 GHz. 160 nodes have 256 GB and 169 have 512 GB of memory, both at DDR4-2666MHz.
The nodes are connected via Cray Aries interconnect in a Dragonfly topology.
A Cray Sonexion 3000 storage cabinet provides 900 terabytes of Lustre storage.

Service Status
--------------------

.. warning::
    Since 18 Aug. 2024

    No known issues.

.. important::
    The Isambard 2 service will **shutdown at 9am on Monday 30th September 2024** and be replaced with an entirely new Isambard 3 service.  Data management is the *responsibility of the user* therefore we require all important data moved off Isambard 2 before it is shutdown.  Support will only be provided for operational issues until the shutdown. Further information will be provided on Isambard 3 in September.

    On Tuesday June 4th 2024 at 9am the "PHASE 3" was switched OFF and was moved to Bristol to be part of Isambard 3.
    
System Status
-------------

.. important::
    29 Jul. 2024
    
    - Login bastion: Available.
    - XCI (ARM ThunderX2): Available.
    - MACS: Available.
    - A64fx: Available.
    - Phase 3: Switched off - see announcement above.

Mailing list
------------

An anouncement mailing list is availale to be kept informed of important news regarding the service.  Archives and managing your subscription is available at `JiscMail GW4-ISAMBARD-COMMUNITY <https://www.jiscmail.ac.uk/cgi-bin/webadmin?A0=GW4-ISAMBARD-COMMUNITY>`_

Acknowledging Isambard
----------------------

Research outputs that have made use of Isambard should acknowledge the facility by using the following phrase:

    *This work used the Isambard 2 UK National Tier-2 HPC Service (http://gw4.ac.uk/isambard/) operated by GW4 and the UK Met Office, and funded by EPSRC (EP/T022078/1)*



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
   user-guide/PHASE3.rst
   user-guide/software.md
   user-guide/spack.md
   user-guide/debugging.rst
   user-guide/end_project.rst
   user-guide/support.rst
   user-guide/gpus.rst

.. TODO
   user-guide/profiling.rst


.. toctree::
   :maxdepth: 2
   :caption: Development Tools

   tools/ddt
   tools/gdb4hpc

.. TODO
   tools/map
   tools/perftools


.. toctree::
   :maxdepth: 1
   :caption: Applications

   applications/arepo
   applications/covidsim
   applications/dune
   applications/dedalus
   applications/dlmonte
   applications/firedrake
   applications/gromacs
   applications/openfoam
   applications/orca
   applications/vasp

.. TODO
  applications/castep
   applications/cp2k
   applications/hydro3d
   applications/molpro
   applications/namd
   applications/nemo
   applications/opensbli
   applications/um

.. toctree::
   :maxdepth: 1
   :caption: Service Policies

   policies/terms.rst
   policies/privacy.rst
   policies/applications.rst


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
