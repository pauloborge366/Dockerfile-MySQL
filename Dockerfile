FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD="password"
COPY ./db/code-dbase.sql /docker-entrypoint-initdb.d/

# ENTRYPOINT ["mysql","--user=root","-p"]