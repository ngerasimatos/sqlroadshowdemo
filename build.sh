oc delete project mssql
sleep 10
oc new-project mssql
oc new-app https://github.com/glennswest/mssqlrhel 
oc volume "dc/mssqlrhel" --add --mount-path=/var/opt/mssql --type=persistentVolumeClaim --claim-name=mssqlrhel --claim-node="ReadWriteOnce" --claim-size=1G
oc logs -f bc/mssqlrhel

