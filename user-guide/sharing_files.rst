Sharing Files
=============

There are shared folders for each of the sites to easily share data:

.. code-block:: bash

   /lustre/projects/bath
   /lustre/projects/bristol
   /lustre/projects/cardiff
   /lustre/projects/exeter
   /lustre/projects/external
   /lustre/projects/metoffice

You should be able to write to the relevant folder for you organisation.  
You can then modify the access to the folder, restricting it for most users and then giving access to specified user(s).

.. code-block:: bash

   setfacl -m g::0 /lustre/projects/<site>/<your_project>
   setfacl -m o::0 /lustre/projects/<site>/<your_project>
   setfacl -m u:XX-USERNAME:7 /lustre/projects/<site>/<your_project>

