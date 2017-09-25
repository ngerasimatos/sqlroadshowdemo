
Must edit scc

Enabling Images to Run with USER in the Dockerfile

To relax the security in your cluster so that images are not forced to run as a pre-allocated UID, without granting everyone access to the privileged SCC:

Edit the restricted SCC:

Raw
$ oc edit scc restricted
Change the runAsUser.Type strategy to RunAsAny.

