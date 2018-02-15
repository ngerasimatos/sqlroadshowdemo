#!/bin/bash
#
# Clean up any environment if required
(oc get projects | grep mssql) &&  oc delete project mssql && sleep 60

# Create a new project with the correct policy
oc new-project mssql 
oc adm policy add-scc-to-user anyuid -z default

# Create our mssql demo application
oc new-app https://github.com/ngerasimatos/sqlroadshowdemo

# Inject our environment details
oc env "dc/sqlroadshowdemo" -e ACCEPT_EULA=y -e SA_PASSWORD=RedHat123!

# and connect a persistent volume
oc volume "dc/sqlroadshowdemo" --add --mount-path=/var/opt/mssql --type=persistentVolumeClaim --claim-name=sqlroadshowdemo --claim-mode="ReadWriteOnce" --claim-size=1G

# Give the environent a chance to start before tailing the logs
sleep 20
oc logs -f bc/sqlroadshowdemo

