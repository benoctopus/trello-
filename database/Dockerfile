FROM mysql:8.0.16

ENV MYSQL_ROOT_PASSWORD secretPassword


COPY ./schema.sql /docker-entrypoint-initdb.d

CMD ["mysqld"]

