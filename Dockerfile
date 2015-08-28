FROM timhaak/base:latest
MAINTAINER tim@haak.co.uk

RUN apt-get -q update && \
    apt-get install -qy --force-yes python-pip build-essential python-dev libffi-dev libssl-dev && \
    pip install --upgrade cryptography pyopenssl ndg-httpsclient pyasn1 && \
    git clone https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer && \
    apt-get autoremove &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

RUN apt-get -q update && apt-get install -y python-lxml python3-lxml

VOLUME ["/config", "/data"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050



CMD ["/start.sh"]
