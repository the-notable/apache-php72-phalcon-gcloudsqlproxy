FROM thenotable/stretch-apache-php72-phalcon

RUN apt-get update && apt-get install -y \
    wget \
    supervisor \
    && wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /cloud_sql_proxy \
    && chmod +x /cloud_sql_proxy \
    && mkdir /cloudsql \
    && chmod 777 /cloudsql \

    && apt-get remove -y --purge wget \
    && apt-get clean

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY apache2-foreground /usr/local/bin/apache2-foreground

CMD ["/usr/bin/supervisord"]