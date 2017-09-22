# mssql-server-linux
# Maintainers: Microsoft Corporation (LuisBosquez and twright-msft on GitHub)
# GitRepo: https://github.com/Microsoft/mssql-docker

FROM registry.access.redhat.com/rhel7-atomic
RUN curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server.repo
RUN \
#microdnf --enablerepo rhel-7-server-rpms install libicu ;\
#microdnf --enablerepo rhel-7-server-rpms install http-parser ;\
#microdnf --enablerepo rhel-7-server-extras-rpms --enablerepo rhel-7-server-optional-rpms --enablerepo epel install nodejs ;\
#microdnf clean all
RUN microdnf --enablerepo mssql-server install mssql-server

# Default SQL Server TCP/Port.
EXPOSE 1433

# Copy all SQL Server runtime files from build drop into image.
COPY ./install /

# Run SQL Server process.
CMD /opt/mssql/bin/sqlservr

