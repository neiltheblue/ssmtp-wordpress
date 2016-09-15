#!/bin/bash

echo "Setup ssmtp"

CONF=/etc/ssmtp/ssmtp.conf
rm $CONF

for E in $(env)
do
  if [ "$(echo $E | sed -e '/^SSMTP_/!d' )" ]
  then
    echo $E | sed -e 's/^SSMTP_//' >> $CONF
  fi
done

echo 'sendmail_path = "/usr/sbin/ssmtp -t"' > /usr/local/etc/php/conf.d/mail.ini

exec "$@"
