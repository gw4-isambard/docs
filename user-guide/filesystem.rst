Filesystem
----------

A Cray Sonexion 3000 storage cabinet provides 480 terabytes of Lustre storage.

Each organisation is allocated 75TB of high performance Lustre storage, by default each user has a quota of 50GB which can be increased on-request by your local GW4 admin. There is currently only one user quota which applies across all directories.
Your current quota and usage can be viewed with the following command:

.. code-block:: bash

   lfs quota -hu $USER /lustre

The /scratch directory is where files exist during a job run, they are immediately deleted upon completion or failure of the job. Any results should be saved elsewhere before the job ends.

The Lustre filesystem is mounted at the following points:

.. code-block:: text

 /home
 /projects ← Per-institution directories for shared project work
 /projects/bath
 /projects/bristol
 /projects/cardiff
 /projects/exeter
 /projects/metoffice
 /scratch ← Default working directory for jobs
 /software ← Common path for custom software installation
 /software/x86
 /software/aarch64

Please note that no backups are performed on the user data areas of the system and you are responsible for ensuring all data stored can be recovered from your own backup or regenerated in the event of a failure.
