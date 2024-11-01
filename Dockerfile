# Use the official MySQL image as a base
FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=welcome
ENV MYSQL_USER=mysqluser
ENV MYSQL_PASSWORD=welcome

ADD ./sql-script/mysql_init.sql /docker-entrypoint-initdb.d

# Expose port 3306 to allow connections to the database
EXPOSE 3306
