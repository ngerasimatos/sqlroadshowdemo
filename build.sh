oc delete project mssql
sleep 10
oc new-project mssql
oc new-app https://github.com/glennswest/mssqlrhel
