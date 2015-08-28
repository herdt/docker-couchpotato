FROM timhaak/base:latest
MAINTAINER tim@haak.co.uk

RUN apt-get -q update && \
    apt-get install -qy --force-yes python-pip build-essential python-dev python-lxml supervisor libffi-dev libssl-dev && \
    pip install --upgrade cryptography pyopenssl ndg-httpsclient pyasn1 && \
    git clone https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer && \
    apt-get autoremove &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

VOLUME ["/config", "/data"]

ADD ./start.sh /start.sh
COPY ./start.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod u+x  /start.sh && mkdir -p /var/log/supervisor

EXPOSE 5050

CMD ["/usr/bin/supervisord"]
