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

Building
--------

Example Build with waves2Foam
.............................

Arm
...

Patch for waves2Foam :download:`waves2Foam-cray.patch <openfoam/waves2Foam-cray.patch>`.

Patch for OpenFOAM v2012 :download:`openfoam-v2012-cray.patch <openfoam/openfoam-v2012-cray.patch>`.

.. code-block:: bash

    #!/bin/bash
    module swap PrgEnv-cray PrgEnv-gnu
    mkdir ~/openfoam_build && cd ~/openfoam_build

    wget "https://dl.openfoam.com/source/v2012/OpenFOAM-v2012.tgz"
    tar zxvf OpenFOAM-v2012.tgz
    cd OpenFOAM-v2012
    patch -p1 < openfoam-v2012-cray.patch
    cat > etc/prefs.h <<EOF
    export WM_COMPILER=Cray
    export WM_MPLIB=CRAY-MPICH
    EOF
    . etc/bashrc
    ./Allwmake -s -j 8 -l

    cd ~/openfoam_build
    wget https://mirror.ibcp.fr/pub/gnu/gsl/gsl-latest.tar.gz
    tar zxvf gsl-latest.tar.gz
    cd gsl-*/
    ./configure --prefix=$HOME/gsl CC=cc
    make
    make install

    mkdir -p $FOAM_RUN/../applications/utilities
    cd $FOAM_RUN/../applications/utilities
    svn co http://svn.code.sf.net/p/openfoam-extend/svn/trunk/Breeder_1.6/other/waves2Foam
    cd waves2Foam
    patch -p1 < waves2Foam-cray.patch
    export WAVES_GSL_INCLUDE=$HOME/gsl/include
    export WAVES_GSL_LIB=$HOME/gsl/lib
    ./Allwmake

This should now be built.
    
