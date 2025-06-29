#!/bin/bash

mkdir -p /var/mail/imapsieve_copy
mkdir -p /var/mail/imapsieve_copy/spam
mkdir -p /var/mail/imapsieve_copy/ham
mkdir -p /var/mail/imapsieve_copy/processing

sed -i 's/^CRON=.*/CRON=1/' /etc/default/spamassassin

cp -r ./mail/. /var/mail/
cp -r ./conf.d/20-spamham.conf /etc/dovecot/conf.d/20-spamham.conf
cp -r ./sieve/imapsieve_copy /etc/dovecot/sieve/imapsieve_copy
cp -r ./cron.daily/spamham /etc/cron.daily/spamham

chown -R mail:mail /var/mail
chown root:root /etc/cron.daily/spamham

chmod -R 0775 /var/mail/imapsieve_copy
chmod 0755 /etc/dovecot/sieve/*
chmod 0775 /var/mail/sieve/
chmod 0644 /var/mail/sieve/*
chmod 755 /etc/cron.daily/spamham

service dovecot restart
service spamassassin restart