FROM ubuntu:20.04
ENV USER1 monica
ENV USER2 weiss
ENV GROUP cit384
# bc newer ubuntu asks for timezone info
ENV TZ=US/Pacific
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y apache2 apache2-utils curl vim
WORKDIR /etc/apache2

RUN a2enmod userdir
RUN a2enmod autoindex
RUN a2enmod alias
RUN a2enmod ssl
RUN a2enmod cgid
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_balancer
RUN a2enmod proxy_hcheck
RUN a2enmod lbmethod_byrequests
RUN a2enmod headers

# create dir for each site, copy htmls and images in
RUN mkdir /var/www/html/mywebsite.cit384
RUN mkdir /var/www/html/special.cit384
RUN mkdir -p /var/www/html/final.cit384/submission
RUN mkdir /var/www/html/newsite.cit384
COPY html/mywebsite.html /var/www/html/mywebsite.cit384/index.html
COPY html/special.html /var/www/html/special.cit384/index.html

# vhosts and apache files
COPY vhosts/final.cit384.conf /etc/apache2/sites-available
COPY vhosts/mywebsite.cit384.conf /etc/apache2/sites-available
COPY vhosts/special.cit384.conf /etc/apache2/sites-available
COPY vhosts/newsite.cit384.conf /etc/apache2/sites-available

# certs
COPY certs/mywebsite.cit384.cert /etc/ssl/certs
COPY certs/mywebsite.cit384.key /etc/ssl/private
COPY certs/special.cit384.cert /etc/ssl/certs
COPY certs/special.cit384.key /etc/ssl/private
COPY certs/final.cit384.cert /etc/ssl/certs
COPY certs/final.cit384.key /etc/ssl/private

# create users, group and add to group
RUN useradd -ms /bin/bash ${USER1}
RUN useradd -ms /bin/bash ${USER2}
RUN groupadd ${GROUP}
RUN usermod -aG ${GROUP} ${USER1}
RUN usermod -aG ${GROUP} ${USER2}

# create public_html dirs, copy files
RUN mkdir -p /home/${USER1}/public_html/cgi-bin
COPY html/user1.html /home/${USER1}/public_html/index.html
COPY images /home/${USER1}/public_html/images
COPY cat.cgi /home/${USER1}/public_html/cgi-bin
RUN chmod a+x /home/${USER1}/public_html/cgi-bin
RUN chown -R ${USER1}.${USER1} /home/${USER1}

RUN mkdir /home/${USER2}/public_html
COPY html/user2.html /home/${USER2}/public_html/index.html
COPY images /home/${USER2}/public_html/images
RUN chown -R ${USER2}.${USER2} /home/${USER2}

# password protect
COPY submission.md /var/www/html/final.cit384/submission
COPY .htaccess /var/www/html/final.cit384/submission
COPY submission.txt /home
COPY submission /home
# how to create .htpasswd #
#htpasswd -cb /home/${USER1}/.htpasswd ${USER1} "password"

# enable the sites
RUN a2ensite final.cit384.conf
RUN a2ensite special.cit384.conf
RUN a2ensite mywebsite.cit384.conf
RUN a2ensite newsite.cit384.conf
RUN a2dissite 000-default.conf

LABEL maintainer="monica.luong.234@my.csun.edu"
EXPOSE 80 443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
