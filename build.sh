oc delete project mssql
sleep 30
oc new-project mssql
oc new-app https://github.com/glennswest/mssqlrhel 
oc volume "dc/mssqlrhel" --add --mount-path=/var/opt/mssql --type=persistentVolumeClaim --claim-name=mssqlrhel --claim-mode="ReadWriteOnce" --claim-size=1G
sleep 20
oc logs -f bc/mssqlrhel

