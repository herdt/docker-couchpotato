#! /bin/sh

while true; do sleep 1 && ping -c1 www.google.com > /dev/null && break; done

cd /CouchPotatoServer
touch /config/CouchPotato.cfg

/usr/bin/python /CouchPotatoServer/CouchPotato.py --data_dir /data/ --config_file /config/CouchPotato.cfg --console_log
