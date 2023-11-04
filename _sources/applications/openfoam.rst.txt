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

Patch for waves2Foam `waves2Foam-cray.patch`.

.. code-block:: diff

    Index: ThirdParty/Allwmake
    ===================================================================
    --- ThirdParty/Allwmake (revision 2156)
    +++ ThirdParty/Allwmake (working copy)
    @@ -33,6 +33,8 @@
         compileFlag=1;
     fi

    +compileFlag=0
    +
     ## COMPILE LAPACK
     if [ "$compileFlag" == "1" ]
     then
    @@ -196,7 +198,7 @@
         echo "Compiling fenton4Foam"
         echo
         cd $fentonName
    -    gfortran -o $WAVES_APPBIN/$fentonName $fentonName.f fft.f
    +    ftn -o $WAVES_APPBIN/$fentonName $fentonName.f fft.f
         cd $OLDPWD
     else
         echo
    Index: ThirdParty/settings/oceanWave3DSettings/common.mk
    ===================================================================
    --- ThirdParty/settings/oceanWave3DSettings/common.mk   (revision 2156)
    +++ ThirdParty/settings/oceanWave3DSettings/common.mk   (working copy)
    @@ -16,9 +16,10 @@
     BUILDDIR = $(PWD)/../build


    -FC       = gfortran
    +FC       = ftn
     LIBDIRS  = -L$(PWD)/../lib
    -LINLIB   = -ltmglib_gfortran -llapack_gfortran  -lskit_gfortran -lblas
    +#LINLIB   = -ltmglib_gfortran -llapack_gfortran  -lskit_gfortran -lblas
    +LINLIB   = -lskit_gfortran
     DBFLAGS  = -pg -g -O0 -fPIC -fbounds-check -ffpe-trap=invalid,zero,overflow -ffree-line-length-none
     OPTFLAGS = -O3 -fPIC -ffpe-trap=invalid,zero,overflow -ffree-line-length-none -fstack-protector-all
     SHLIBFLAGS  = -shared -O2 -fPIC -fbounds-check -ffpe-trap=invalid,zero,overflow -ffree-line-length-none -fstack-protector-all
    Index: ThirdParty/settings/sparseSettings/makefile
    ===================================================================
    --- ThirdParty/settings/sparseSettings/makefile (revision 2156)
    +++ ThirdParty/settings/sparseSettings/makefile (working copy)
    @@ -20,7 +20,7 @@
     # Last Updated:  May 9, 1994.

     SHELL = /bin/sh
    -F77 = gfortran
    +F77 = ftn
     # F77 = f77
     # AR = ar rcv
     AR = ar -rcv
    ca-tgreen@xcil00:~/OpenFOAM/ca-tgreen-v2012/applications/utilities/waves2Foam> clear
    ca-tgreen@xcil00:~/OpenFOAM/ca-tgreen-v2012/applications/utilities/waves2Foam> svn diff
    Index: ThirdParty/Allwmake
    ===================================================================
    --- ThirdParty/Allwmake (revision 2156)
    +++ ThirdParty/Allwmake (working copy)
    @@ -33,6 +33,8 @@
         compileFlag=1;
     fi

    +compileFlag=0
    +
     ## COMPILE LAPACK
     if [ "$compileFlag" == "1" ]
     then
    @@ -196,7 +198,7 @@
         echo "Compiling fenton4Foam"
         echo
         cd $fentonName
    -    gfortran -o $WAVES_APPBIN/$fentonName $fentonName.f fft.f
    +    ftn -o $WAVES_APPBIN/$fentonName $fentonName.f fft.f
         cd $OLDPWD
     else
         echo
    Index: ThirdParty/settings/oceanWave3DSettings/common.mk
    ===================================================================
    --- ThirdParty/settings/oceanWave3DSettings/common.mk   (revision 2156)
    +++ ThirdParty/settings/oceanWave3DSettings/common.mk   (working copy)
    @@ -16,9 +16,10 @@
     BUILDDIR = $(PWD)/../build


    -FC       = gfortran
    +FC       = ftn
     LIBDIRS  = -L$(PWD)/../lib
    -LINLIB   = -ltmglib_gfortran -llapack_gfortran  -lskit_gfortran -lblas
    +#LINLIB   = -ltmglib_gfortran -llapack_gfortran  -lskit_gfortran -lblas
    +LINLIB   = -lskit_gfortran
     DBFLAGS  = -pg -g -O0 -fPIC -fbounds-check -ffpe-trap=invalid,zero,overflow -ffree-line-length-none
     OPTFLAGS = -O3 -fPIC -ffpe-trap=invalid,zero,overflow -ffree-line-length-none -fstack-protector-all
     SHLIBFLAGS  = -shared -O2 -fPIC -fbounds-check -ffpe-trap=invalid,zero,overflow -ffree-line-length-none -fstack-protector-all
    Index: ThirdParty/settings/sparseSettings/makefile
    ===================================================================
    --- ThirdParty/settings/sparseSettings/makefile (revision 2156)
    +++ ThirdParty/settings/sparseSettings/makefile (working copy)
    @@ -20,7 +20,7 @@
     # Last Updated:  May 9, 1994.

     SHELL = /bin/sh
    -F77 = gfortran
    +F77 = ftn
     # F77 = f77
     # AR = ar rcv
     AR = ar -rcv

Patch for OpenFOAM v2012 `openfoam-v2012-cray.patch`

.. code-block:: diff

    diff -ruN ./wmake/rules/General/mplibCRAY-MPICH ../../OpenFOAM-v2012/wmake/rules/General/mplibCRAY-MPICH
    --- ./wmake/rules/General/mplibCRAY-MPICH       2020-12-22 14:30:37.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/General/mplibCRAY-MPICH    2023-10-31 09:26:02.000000000 +0000
    @@ -1,6 +1,7 @@
     #------------------------------------------------------------------------------
    -# Cray MPICH is MPICH

    -include $(GENERAL_RULES)/mplibMPICH
    +PFLAGS     = -DMPICH_SKIP_MPICXX -DOMPI_SKIP_MPICXX
    +PINC       =
    +PLIBS      =

     #------------------------------------------------------------------------------
    diff -ruN ./wmake/rules/linuxARM64Cray/c ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c
    --- ./wmake/rules/linuxARM64Cray/c      1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c   2023-10-31 09:19:04.000000000 +0000
    @@ -0,0 +1,15 @@
    +# Cray compiler - a gcc variant/wrapper
    +include $(GENERAL_RULES)/Gcc/c
    +
    +cc          = cc
    +
    +cARCH       =
    +
    +# Compile option is non-mandatory, but must be non-empty
    +sinclude $(DEFAULT_RULES)/c$(WM_COMPILE_OPTION)
    +
    +cFLAGS      = $(cARCH) $(GFLAGS) $(cWARN) $(cOPT) $(cDBUG) $(LIB_HEADER_DIRS) -fPIC
    +
    +ctoo        = $(WM_SCHEDULER) $(cc) $(cFLAGS) -c $< -o $@
    +
    +include $(GENERAL_RULES)/Gcc/link-c
    diff -ruN ./wmake/rules/linuxARM64Cray/c++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++
    --- ./wmake/rules/linuxARM64Cray/c++    1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++ 2023-10-31 09:19:35.000000000 +0000
    @@ -0,0 +1,17 @@
    +# Cray compiler - a gcc variant/wrapper
    +include $(GENERAL_RULES)/Gcc/c++
    +
    +CC          = CC -std=c++11
    +
    +c++ARCH     = -pthread
    +
    +include $(DEFAULT_RULES)/c++$(WM_COMPILE_OPTION)
    +
    +c++FLAGS    = $(c++ARCH) $(GFLAGS) $(c++WARN) $(c++OPT) $(c++DBUG) $(ptFLAGS) $(LIB_HEADER_DIRS) -fPIC
    +
    +Ctoo        = $(WM_SCHEDULER) $(CC) $(c++FLAGS) -c $< -o $@
    +cxxtoo      = $(Ctoo)
    +cctoo       = $(Ctoo)
    +cpptoo      = $(Ctoo)
    +
    +include $(GENERAL_RULES)/Gcc/link-c++
    diff -ruN ./wmake/rules/linuxARM64Cray/cDebug ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/cDebug
    --- ./wmake/rules/linuxARM64Cray/cDebug 1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/cDebug      2023-10-31 09:15:07.000000000 +0000
    @@ -0,0 +1,2 @@
    +cDBUG       = -ggdb -DFULLDEBUG
    +cOPT        = -O1 -fdefault-inline -finline-functions
    diff -ruN ./wmake/rules/linuxARM64Cray/c++Debug ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++Debug
    --- ./wmake/rules/linuxARM64Cray/c++Debug       1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++Debug    2023-10-31 09:15:07.000000000 +0000
    @@ -0,0 +1,2 @@
    +c++DBUG     = -ggdb3 -DFULLDEBUG
    +c++OPT      = -O0 -fdefault-inline
    diff -ruN ./wmake/rules/linuxARM64Cray/cOpt ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/cOpt
    --- ./wmake/rules/linuxARM64Cray/cOpt   1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/cOpt        2023-10-31 09:15:07.000000000 +0000
    @@ -0,0 +1,2 @@
    +cDBUG       =
    +cOPT        = -O3
    diff -ruN ./wmake/rules/linuxARM64Cray/c++Opt ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++Opt
    --- ./wmake/rules/linuxARM64Cray/c++Opt 1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++Opt      2023-10-31 09:15:07.000000000 +0000
    @@ -0,0 +1,4 @@
    +c++DBUG     =
    +c++OPT      = -O3
    +
    +ROUNDING_MATH = -frounding-math
    diff -ruN ./wmake/rules/linuxARM64Cray/cProf ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/cProf
    --- ./wmake/rules/linuxARM64Cray/cProf  1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/cProf       2023-10-31 09:15:07.000000000 +0000
    @@ -0,0 +1,2 @@
    +cDBUG       = -pg
    +cOPT        = -O2
    diff -ruN ./wmake/rules/linuxARM64Cray/c++Prof ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++Prof
    --- ./wmake/rules/linuxARM64Cray/c++Prof        1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/c++Prof     2023-10-31 09:15:07.000000000 +0000
    @@ -0,0 +1,2 @@
    +c++DBUG    = -pg
    +c++OPT     = -O2
    diff -ruN ./wmake/rules/linuxARM64Cray/general ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/general
    --- ./wmake/rules/linuxARM64Cray/general        1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/general     2023-10-31 09:15:07.000000000 +0000
    @@ -0,0 +1,13 @@
    +CPP        = cpp -traditional-cpp $(GFLAGS)
    +
    +include $(GENERAL_RULES)/standard
    +## include $(GENERAL_RULES)/Gcc/openmp
    +
    +ifneq (,$(findstring ~openmp,$(WM_COMPILE_CONTROL)))
    +    include $(GENERAL_RULES)/no-openmp
    +endif
    +
    +include $(DEFAULT_RULES)/c
    +include $(DEFAULT_RULES)/c++
    +
    +# -----------------------------------------------------------------------------
    diff -ruN ./wmake/rules/linuxARM64Cray/mplibCRAY-MPICH ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/mplibCRAY-MPICH
    --- ./wmake/rules/linuxARM64Cray/mplibCRAY-MPICH        1970-01-01 00:00:00.000000000 +0000
    +++ ../../OpenFOAM-v2012/wmake/rules/linuxARM64Cray/mplibCRAY-MPICH     2023-10-31 09:17:39.000000000 +0000
    @@ -0,0 +1 @@
    +include $(GENERAL_RULES)/mplibCRAY-MPICH

.. code-block:: bash

    #!/bin/bash
    module swap PrgEnv-cray PrgEnv-gnu
    mkdir ~/openfoam_build && cd ~/openfoam_build

    wget "https://dl.openfoam.com/source/v2012/OpenFOAM-v2012.tgz"
    tar zxvf OpenFOAM-v2012.tgz
    cd OpenFOAM-v2012
    patch -p0 < openfoam-v2012-cray.patch
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
    patch -p0 < waves2Foam-cray.patch
    export WAVES_GSL_INCLUDE=$HOME/gsl/include
    export WAVES_GSL_LIB=$HOME/gsl/lib
    ./Allwmake

This should now be built.
    
