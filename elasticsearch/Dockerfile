FROM docker.elastic.co/elasticsearch/elasticsearch:7.6.2

COPY --chown=elasticsearch:elasticsearch ./config/elasticsearch.yml /usr/share/elasticsearch/config/

CMD ["elasticsearch", "-Elogger.level=INFO"]