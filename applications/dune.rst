Dune
====

Useful links
------------

- `Dune homepage <https://dune-project.org>`_

Licensing
---------

The DUNE library and headers are licensed under version 2 of the GNU General Public License 
(see the `Dune licence <https://dune-project.org/about/license/>`_).

Version
-------

2.7.1

Building
--------
We used Spack centrally along with the `dune-spack project <https://gitlab.dune-project.org/spack/dune-spack>`_

.. code-block:: bash

   spack repo add --scope=site dune-spack
   spack install dune+parmetis+uggrid+typetree ^cray-libsci@20.09.1 ^cmake@3.13

                                                                                             
To build your own module (following `Dune Book <https://dune-project.org/doc/book/>`_)

.. code-block:: bash

   module swap PrgEnv-cray PrgEnv-gnu
   . /software/arm64/spack/share/spack/setup-env.sh
   spack load dune/azja5nw
   duneproject
   cd dune-foo
   export CC=cc
   export CXX=CC
   export FC=ftn
   dunecontrol all
   ls build-cmake/src/dune-foo

                                                                                             
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

    # Swap programming environment
    module swap PrgEnv-cray PrgEnv-gnu

    # Load Spack
    . /software/arm64/spack/share/spack/setup-env.sh

    # Load exact version of module
    spack load dune/azja5nw

    # Add to LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`spack location -i dune/azja5nw`/lib64
    
    # Change to the directory the script was submitted from
    cd $PBS_O_WORKDIR

    # Launch 8192 MPI ranks (64 per node, 1 per core)
    # Launch 1 OpenMP threads per rank (NOT using 4-way hyperthreading)
    export OMP_NUM_THREADS=1
    aprun -n 64 -d 1 -j 1 dune-mpi
      

Notes
.....

For maximum performance, you may wish to tune the MPI/OpenMP decomposition.
At large scale, you may find that reducing the number of MPI ranks and increasing the number of OpenMP threads yields better performance.
