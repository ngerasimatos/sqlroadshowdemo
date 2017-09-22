# mssql-server-linux
# Maintainers: Microsoft Corporation (LuisBosquez and twright-msft on GitHub)
# GitRepo: https://github.com/Microsoft/mssql-docker

FROM registry.access.redhat.com/rhel7
COPY mssql-server.repo /etc/yum.repos.d/mssql-server.repo
RUN yum install -y mssql-server

# Default SQL Server TCP/Port.
EXPOSE 1433

# Copy all SQL Server runtime files from build drop into image.
COPY ./install /

# Run SQL Server process.
CMD /opt/mssql/bin/sqlservr

