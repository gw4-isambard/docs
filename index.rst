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
    22 May 2020 
    
    Dear Isambard users,
    
    The security patches and updates to Isambard have now been applied, so we're reopening access to the main Arm system (phase 2) this afternoon. The x86 and GPU partition (phase 1) is still undergoing updates, so this currently remains unavailable.
    
    To log in to Isambard, you will need to create a new SSH key pair and update it on the Tier2 SAFE if you have not already done so.
    
    As you may be aware, there has been a recently discovered campaign of information security attacks agains HPC centres worldwide. We do not believe that Isambard has been affected; however, since the attackers have been targeting user credentials (SSH keys and passwords) and some Isambard users are also users of known affected systems, like all the Tier 2 services we are taking the precaution of revoking the credentials on Isambard and asking you to create fresh ones.
    
    If you are a user of ARCHER or another Tier 2 system you may already have created a new SSH key pair and updated it on SAFE. If so, this will already be sufficient, but if not, you will need to go through this process to re-enable access to Isambard.
    
    New Key Pair
    
    If you have not already done so for one of the other tier 2 systems, then create yourself a new SSH key with a passphrase.     Advice for creating SSH keys on various operating systems can be found at https://arclessons.github.io/security/01_security.html . For SAFE you must use the RSA type.
    
    Once created, update your public key in the Tier2 SAFE: https://gw4-isambard.github.io/docs/user-guide/requestaccount.html#register-ssh-key
    
    (This will generate an Isambard helpdesk ticket, we will notify you when the change has been made on Isambard's authentication servers).
    
    We will be in contact again when the phase 1 system is also available.
    
    Thank you for your understanding,
    
    The Isambard team.  
    
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
