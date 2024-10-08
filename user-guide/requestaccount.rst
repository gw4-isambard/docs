Request Account
===============

Before requesting an account on Isambard, please read the :ref:`Terms and Conditions of Access <terms>`.

Account requests for Isambard are managed via the `SAFE for EPSRC Tier2 system <https://safe.epcc.ed.ac.uk/>`_.

Create an account on SAFE
-------------------------

(If you already have an account on SAFE, you can skip this step.)

Navigate to the `SAFE login page <https://safe.epcc.ed.ac.uk/>`_.
At the bottom of the login screen, choose to create a new account:

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-create-account.png

Fill in the form with your details and click ``Register``.

Register institutional ID
-------------------------

(If you have already registered your institutional ID to your SAFE account, you can skip this step.)

Once logged in with your SAFE account, click ``Register institutional ID`` underneath ``Your details``:

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-register-id.png

After entering your institutional login details (if necessary), you should see a message stating ``Identity registered``.

Now logout of your SAFE account:

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-logout.png

Login to SAFE via institutional login
-------------------------------------

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-institutional-login.png

Register SSH key
----------------

If you haven't already registered an SSH key to your account, do so via ``Update personal details``:

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-update-details.png

Scroll down to the ``SSH Public Key`` section, and enter a public SSH key:

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-ssh-key.png

On Linux/macOS systems, your public SSH key will typically be found under ``.ssh/id_rsa.pub`` in your home directory.
If you do not have one yet, you can create one by running ``ssh-keygen -t rsa`` from a terminal.

For further examples, ARCHER2 provide `instructions <https://docs.archer2.ac.uk/user-guide/connecting/>`_ for various operating systems.

Request account on Isambard
---------------------------

Select ``Request login account`` under ``Login accounts``:

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-request-account.png

In the list of projects select the GW4 project that corresponds to your hosting institution.

.. note::
    GW4 Isambard projects
        - GW02: Bath
        - GW03: Bristol
        - GW04: Cardiff
        - GW05: Exeter
        - GW06: Met Office
        - GW07: External (i.e. None of the above)

On the next screen, select ``Isambard`` and click ``Select Machine``:

.. image:: https://raw.githubusercontent.com/UoB-HPC/GW4-Isambard/master/docs/images/safe-isambard-request.png

The next screen will invite you to request a username before clicking ``Request`` to submit your application.
Please note that usernames on Isambard follow a fixed format and we are unable to accomodate specific username requests.

Your account request will need to approved by the PI for your hosting institution.
You will receive your login details via email once your account has been approved and created.
This process may take 1-2 working weeks, depending on availability of the project PI to approve your account.
