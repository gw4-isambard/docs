OpenFOAM
========

OpenFOAM is an open-source software for CFD.

Useful links
------------

- `OpenFOAM user documentation <https://www.openfoam.com/documentation/>`_

Licensing
---------

OpenFOAM is open source (see the `OpenFOAM License Agreement <https://www.openfoam.com/documentation/licencing.php>`_).

Version
-------

The following versions of OpenFOAM are currently available:

* ``v1906`` (ESI-OpenCFD)
* ``v1812`` (ESI-OpenCFD)
* ``7`` (OpenFOAM Foundation)

Running
-------

Example Job Submission Script
.............................

Arm
...

.. code-block:: bash

    #!/bin/bash
    
    #PBS -N openfoam_job                                                                                                                         

    # Select 1 nodes (maximum of 64 cores)                                                                                                       
    #PBS -l select=1:ncpus=64                                                                                                                    

    # Select wall time to 10 minutes                                                                                                                  
    #PBS -l walltime=0:10:0                                                                                                                      

    # Use the arm nodes                                                                                                                          
    #PBS -q arm                                                                                                                                  

    # Load modules for currently recommended OpenFOAM v1812 build                                                   
    module swap PrgEnv-cray PrgEnv-allinea

    # Change to directory that script was submitted from                                                                                           
    export PBS_O_WORKDIR=$(readlink -f $PBS_O_WORKDIR)
    export OMP_NUM_THREADS=1
    cd $PBS_O_WORKDIR

    # Load the environment variables for OpenFOAM v1812 build
    export OPENFOAM_DIR=/lustre/software/aarch64/apps/openfoam/v1812/OpenFOAM-v1812
    export PATH=$PATH:$OPENFOAM_DIR/bin/
    source $OPENFOAM_DIR/etc/bashrc
    
    # Launch OpenFoam solvers
    # aprun -n 64 ..
