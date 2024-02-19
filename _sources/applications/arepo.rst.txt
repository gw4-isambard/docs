Arepo
=====

Useful links
------------

- `Arepo homepage <https://arepo-code.org>`_

Licensing
---------

Arepo is released under GPLv3 (see the `Arepo licence <https://gitlab.mpcdf.mpg.de/vrs/arepo/-/blob/master/LICENSE>`_).

Version
-------

Latest version on Arepo

Building
--------
We should load the Cray hdf5 module

.. code-block:: bash

    module load cray-hdf5

So on XCI system you can:

Install GSL with:

.. code-block:: bash

    wget https://ftp.gnu.org/gnu/gsl/gsl-latest.tar.gz

    tar xxvf gsl-latest.tar.gz

    cd gsl-*

    ./configure --prefix=$HOME/gsl CC=cc

    make -j

    make install

 

Then in Arepo specify in Makefile.systype

 
.. code-block:: bash
                               
    SYSTYPE="XCI"

 

And in Makefile

 
.. code-block:: bash

    # Isambard XCI

    ifeq ($(SYSTYPE),"XCI")
    CC=cc

    # compiler and its optimization options
    OPTIMIZE  =
                               
    # overwrite default:

    MPICH_INCL=
    MPICH_LIB =
    GSL_INCL  = -I$(HOME)/gsl/include
    GSL_LIB   = -L$(HOME)/gsl/lib -lgsl -lgslcblas
    HWLOC_LIB =

    # libraries that are included on demand, depending on Config.sh options

    FFTW_INCL =
    FFTW_LIBS =
    HDF5_INCL = -DH5_USE_16_API
    HDF5_LIB  =
    HWLOC_INCL=

    endif

 

Then:

.. code-block:: bash

    module load cray-hdf5

    module load cray-fftw

    make

 

Then it should compile an Arepo executable.

To use and build examples a venv is required:

.. code-block:: bash

    module load cray-python

    python -m venv venv

    . venv/bin/activate

    pip install “numpy<1.20”

    pip install h5py


(numpy<1.20 needed due to broken code using np.int)

 

Then followed docs on using examples.

Running
-------

Example Job Submission Script
.............................

Arm
...

.. code-block:: bash

    #!/bin/bash

    # Select 1 nodes (maximum of 64 cores)
    #PBS -l select=1

    # Set maximum job walltime
    #PBS -l walltime=00:30:00

    # Change to the directory the script was submitted from
    cd $PBS_O_WORKDIR

    # Load required GSL
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/gsl/lib

    # Launch 8192 MPI ranks (64 per node, 1 per core)
    # Launch 1 OpenMP threads per rank (NOT using 4-way hyperthreading)
    export OMP_NUM_THREADS=1
    aprun -n 64 -d 1 -j 1 Arepo
      

Notes
.....

For maximum performance, you may wish to tune the MPI/OpenMP decomposition.
At large scale, you may find that reducing the number of MPI ranks and increasing the number of OpenMP threads yields better performance.
