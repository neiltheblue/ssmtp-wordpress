FROM wordpress:4.5.2

RUN apt-get update
RUN apt-get install -y ssmtp
RUN ls 

COPY prep_ssmtp.sh /prep_ssmtp.sh

CMD ["/bin/bash", "/prep_ssmtp.sh", "apache2-foreground"]
