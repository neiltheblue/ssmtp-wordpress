## ssmtp-wordpress

Wordpress with added SSMTP support.

This container wraps [wordpress:4.5.2](https://hub.docker.com/_/wordpress/), with added ssmtp. SSMTP adds a simple smtp proxy so that you can recieve emails from the container without a full MTA install.

# Run the container

You can run the container as documented for wordpress, but with the addition of ssmtp settings. Any environment settings starting with `SSMTP_` wil be added to the `ssmtp.conf` file. This exmple sends emails for ids<1000 to a gmail account:

```
docker run -d \
-e SSMTP_root=me@gmail.com \
-e SSMTP_mailhub=smtp.gmail.com:587 \
-e SSMTP_hostname=thishost \
-e SSMTP_FromLineOverride=NO \
-e SSMTP_AuthUser=me@gmail.com \
-e SSMTP_AuthPass=mypass \
-e SSMTP_UseSTARTTLS=YES \
--name wordpress neiltheblue/ssmtp-wordpress
```

You can test this in a runing container with:

```
docker exec -ti wordpress /bin/bash
```

Then enter:

```
sendmail root
test
.

```

This will send a test email to your specified gmail account.
