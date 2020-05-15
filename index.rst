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

.. warning::
    15 May 2020 
    
    Dear Isambard users,
    
    As many of you know there’s an ongoing security incident affecting several of the Tier-1 and Tier-2 systems in the UK, and several major sites in Europe and beyond. We disabled ssh access to Isambard on Tuesday as soon as we were made aware of the situation, and have been conducting a coordinated assessment of the Isambard systems since then. As far as we can tell Isambard has not been affected by this incident, and wasn’t susceptible to the exploits used elsewhere. We’re taking nothing for granted though, and so we’re going to make sure that all the latest security patches are applied before we reopen the service. We’re also going to follow the approach being advised for the other Tier-1 and Tier-2 services, which will require all users to generate new SSH keys and passwords in order to log back in.
    
    Instructions on how to do this will be sent out early next week. In the meantime the queue remains up and the system is actively processing jobs (Isambard is currently running at near 100% utilisation). Any jobs you had already submitted to the queue will continue even while login access is disabled.
    
    We’ll be in touch early next week with an update, and with the steps you’ll need to take in order to be able to log back in to Isambard.
    
    With best wishes,
    
    Prof. Simon McIntosh-Smith  
    Isambard PI  
    GW4 / University of Bristol  
    
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
