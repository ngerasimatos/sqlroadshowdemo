FROM registry.access.redhat.com/rhel7

LABEL name="microsoft/mssql-server-linux" \
      vendor="Microsoft" \
      version="14.0" \
      release="1" \
      summary="MS SQL Server Developer Edition" \
      description="MS SQL Server is ....." \
### Required labels above - recommended below
      url="https://www.microsoft.com/en-us/sql-server/" \
      io.k8s.description="MS SQL Server is ....." \
      io.k8s.display-name="MS SQL Server Developer Edition"

RUN yum install --disablerepo "*" --enablerepo rhel-7-server-rpms,rhel-7-server-optional-rpms -y sudo
# Install latest mssql-server package
RUN REPOLIST=rhel-7-server-rpms,packages-microsoft-com-mssql-server-2017,packages-microsoft-com-prod && \
    curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo && \
    curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/7/prod.repo && \
    ACCEPT_EULA=Y yum -y install --disablerepo "*" --enablerepo ${REPOLIST} --setopt=tsflags=nodocs \
      mssql-server mssql-tools unixODBC-devel && \
    yum clean all

ENV PATH=${PATH}:/opt/mssql/bin:/opt/mssql-tools/bin

# Default SQL Server TCP/Port
EXPOSE 1433

VOLUME /var/opt/mssql

COPY demo ./demo

#RUN ACCEPT_EULA=Y /opt/mssql/bin/mssql-conf setup
# Run SQL Server process
#cmd tail -f /dev/null
CMD ACCEPT_EULA=Y MSSQL_PID=Developer sqlservr 


