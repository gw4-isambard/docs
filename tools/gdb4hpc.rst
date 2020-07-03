gdb4hpc
=======

gdb4hpc is a parallel debugger for C, C++ and Fortran programs and is available on both phase 1 and phase 2 as part of the Cray Programming Environment.
It is a command line tool (based on gdb) and it can be used either to launch an application or attach to application which is already running.

Modules
---------

To use gdb4hpc you will need to load the gdb4hpc module by running the command
::

  module load gdb4hpc

When you have loaded the module you can see gdb4hpc documentation by running the command ``man gdb4hpc``. 

Example session
----------------

This example shows how to use gdb4hpc to attach to a program which is already running. In this example we have a C program parallelised with MPI but there is a bug causing a deadlock and we want to find out where in the program this is happening.

Start by building the program using a ``-g`` flag so that we can see line numbers in the debugger::

  cc -g -o deadlock deadlock.c

where the source code is in a file called ``deadlock.c`` and the executable is called ``deadlock``.  Now submit the program to queue as usual::

  qsub debug.pbs

where ``debug.pbs`` is the job script. The application will deadlock and sit in the queue so we can now attach the debugger. We need to find a ID number for the application which we will obtain with the ``apstat`` command as follows::

  xx-user@xcil00:~> apstat -u $USER
  Compute node summary
      arch config     up   resv    use  avail   down rebootq
        XT    163    160    155    142      5      3       0

  No pending applications are present

  Total (filtered) placed applications: 1
     Apid  ResId    User PEs Nodes   Age State Command        
  1324249 492947 xx-user   2     1 0h00m   run deadlock

  No applications or reservations are being cleaned up
  xx-user@xcil00:~> 

The application ID is 1324249 (shown underneath Apid) and we will use this ID number to attach to the application.  Next load the gdb4hpc module and start the debugger::

  module load gdb4hpc
  xx-user@xcil00:~> gdb4hpc
  gdb4hpc 3.0 - Cray Line Mode Parallel Debugger
  With Cray Comparative Debugging Technology.
  Copyright 2007-2018 Cray Inc. All Rights Reserved.
  Copyright 1996-2016 University of Queensland. All Rights Reserved.

  Type "help" for a list of commands.
  Type "help <cmd>" for detailed help about a command.

To attach to the application we use the ``attach`` command followed by a handle (we will call this ``prog1``) and the applicaton ID (1324249) which we obtained from from ``apstat``::

  dbg all> attach $prog1 1324249 
  Attaching to application, please wait...
  Creating MRNet communication network...
  Waiting for debug servers to attach to MRNet communications network...
  Timeout in 400 seconds. Please wait for the attach to complete.
  Number of dbgsrvs connected: [1];  Timeout Counter: [0]
  Number of dbgsrvs connected: [1];  Timeout Counter: [1]
  Number of dbgsrvs connected: [2];  Timeout Counter: [0]
  Finalizing setup...
  Attach complete.
  Current rank location:
  prog1{1}: #0  0x00004000002a2dc0 in MPIDI_CH3I_Progress
  prog1{1}: #1  0x00004000001b2e74 in PMPI_Recv
  prog1{1}: #2  0x0000000000400c28 in main at /lustre/home/xx-user/deadlock.c:20
  prog1{0}: #0  0x000040000029ef2c in poll_active_fboxes
  prog1{0}: #1  0x00004000002a2d94 in MPIDI_CH3I_Progress
  prog1{0}: #2  0x00004000001fa9d4 in MPIC_Wait
  prog1{0}: #3  0x00004000001fb134 in MPIC_Sendrecv
  prog1{0}: #4  0x00004000001333a8 in MPIR_Barrier_intra
  prog1{0}: #5  0x000040000013395c in MPIR_Barrier
  prog1{0}: #6  0x000040000020e7f4 in MPIDI_Cray_shared_mem_coll_opt_cleanup
  prog1{0}: #7  0x000040000020bf4c in MPIDI_Cray_coll_finalize
  prog1{0}: #8  0x000040000028f374 in MPID_Finalize
  prog1{0}: #9  0x00004000001a9a8c in PMPI_Finalize
  prog1{0}: #10 0x0000000000400c48 in main at /lustre/home/xx-user/deadlock.c:24

The debugger shows us that the rank 0 process is at a ``PMPI_Finalise`` call on line 24 and the rank 1 process is at a ``PMPI_Recv`` call on line 20. 

To exit the debugging session use the `quit` command ::

  dbg all> quit
  Shutting down debugger and resuming application for 'prog1'.
  xx-user@xcil00:~> 
