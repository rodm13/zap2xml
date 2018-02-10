#!/bin/sh

#Set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config

#Update guide data (only if user created .conf file)
if [ -f "/config/zap2xml.conf" ]; then
	/zap2xml/scripts/zap2xml.pl -C /config/zap2xml.conf
fi

#Re-set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config
