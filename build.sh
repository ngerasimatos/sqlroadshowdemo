oc delete project mssql
sleep 60
oc new-project mssql 
oc adm add-scc-to-user anyuid -z default
oc new-app https://github.com/glennswest/mssqlrhel 
oc env "dc/mssqlrhel" -e ACCEPT_EULA=y -e SA_PASSWORD=RedHat123!
oc volume "dc/mssqlrhel" --add --mount-path=/var/opt/mssql --type=persistentVolumeClaim --claim-name=mssqlrhel --claim-mode="ReadWriteOnce" --claim-size=1G
sleep 20
oc logs -f bc/mssqlrhel

