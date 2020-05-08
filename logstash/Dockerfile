FROM docker.elastic.co/logstash/logstash:7.6.2

ENV LAST_RUN_METADATA_PATH /mnt/data
ENV DRIVER_PATH /var/opt/drivers

USER root

RUN yum -y install wget

#Driver Path
RUN mkdir "$DRIVER_PATH" && \
    chown -R logstash "$DRIVER_PATH" && \
    rm -rf /tmp/*


#Install PostgreSQL driver
RUN ls "$DRIVER_PATH" && \
    wget "https://jdbc.postgresql.org/download/postgresql-42.2.2.jar" -P "$DRIVER_PATH" && \
    rm -rf /tmp/*

#Last run data path
RUN mkdir "$LAST_RUN_METADATA_PATH" && \
    chown -R logstash "$LAST_RUN_METADATA_PATH"

#Map last run path to keep track of runs
VOLUME $LAST_RUN_METADATA_PATH

USER logstash