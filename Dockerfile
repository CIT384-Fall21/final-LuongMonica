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
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod headers

# create dir for each site, copy htmls and images in
RUN mkdir /var/www/html/mywebsite.cit384
RUN mkdir /var/www/html/special.cit384
RUN mkdir -p /var/www/html/final.cit384/private
COPY assets /var/www/html/assets
COPY mywebsite.cit384.html /var/www/html/mywebsite.cit384/index.html
COPY special.cit384.html /var/www/html/special.cit384/index.html

# vhosts and apache files
COPY vhosts/final.cit384.conf /etc/apache2/sites-available
COPY vhosts/mywebsite.cit384.conf /etc/apache2/sites-available
COPY vhosts/special.cit384.conf /etc/apache2/sites-available
COPY ports.conf /etc/apache2

# certs
COPY certs/mywebsite.cit384.internal.cert /etc/ssl/certs
COPY certs/mywebsite.cit384.internal.key /etc/ssl/private
COPY certs/special.cit384.internal.cert /etc/ssl/certs
COPY certs/special.cit384.internal.key /etc/ssl/private
COPY certs/final.cit384.internal.cert /etc/ssl/certs
COPY certs/final.cit384.internal.key /etc/ssl/private

# create users, group and add to group
RUN useradd -ms /bin/bash ${USER1}
RUN useradd -ms /bin/bash ${USER2}
RUN groupadd ${GROUP}
RUN usermod -aG ${GROUP} ${USER1}
RUN usermod -aG ${GROUP} ${USER2}

# create public_html dirs, copy files
RUN mkdir -p /home/${USER1}/public_html/cgi-bin
COPY ${USER1}/public_html/index.html /home/${USER1}/public_html
COPY images /home/${USER1}/public_html
COPY cat.cgi /home/${USER1}/public_html/cgi-bin
RUN chown -R ${USER1}.${USER1} /home/${USER1}

RUN mkdir /home/${USER2}/public_html
COPY ${USER2}/public_html/index.html /home/${USER2}/public_html
COPY images /home/${USER2}/public_html
RUN chown -R ${USER2}.${USER2} /home/${USER2}

# password protect
COPY submission.md /var/www/html/final.cit384/private
COPY .htaccess /var/www/html/final.cit384/private
COPY submission.txt /home
#RUN htpasswd -cb /home/${USER1}/.htpasswd ${USER1} "passwd"

# enable the sites
RUN a2ensite final.cit384.conf
RUN a2ensite special.cit384.conf
RUN a2ensite mywebsite.cit384.conf
RUN a2disite 000-default.conf

LABEL maintainer="monica.luong.234@my.csun.edu"
EXPOSE 80 443 8443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
