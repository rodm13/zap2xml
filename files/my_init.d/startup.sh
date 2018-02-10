#!/bin/sh

#Set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config

#Copy zap2xml.conf template to /config/templates
if [ ! -d "/config/templates/" ]; then
	mkdir -p /config/templates
  	cp /zap2xml/templates/zap2xml.conf /config/templates/zap2xml.conf
else
	cp /zap2xml/templates/zap2xml.conf /config/templates/zap2xml.conf
fi

#Add cron job to update guide data
if [ ! -f "/config/mycron" ]; then
	cp /zap2xml/cron/mycron /config/mycron
fi
sleep 10
crontab -u nobody /config/mycron

#Update guide data (only if user created .conf file)
if [ -f "/config/zap2xml.conf" ]; then
	/zap2xml/scripts/zap2xml.pl -C /config/zap2xml.conf
fi

#Re-set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config
