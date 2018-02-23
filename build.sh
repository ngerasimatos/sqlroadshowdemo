#uncomment the following to cleanup the demobefore deployment
#oc delete project ilovenewyork
#sleep 60
oc new-project ilovenewyork 
oc adm policy add-scc-to-user anyuid -z default
oc new-app https://github.com/ngerasimatos/sqlroadshowdemo
oc env "dc/sqlroadshowdemo" -e ACCEPT_EULA=y -e SA_PASSWORD=RedHat123!
oc volume "dc/sqlroadshowdemo" --add --mount-path=/var/opt/mssql --type=persistentVolumeClaim --claim-name=sqlroadshowdemo --claim-mode="ReadWriteOnce" --claim-size=1G
sleep 20
oc logs -f bc/sqlroadshowdemo

