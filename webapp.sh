#!/usr/bin/env bash
# Original Script: https://github.com/mrolli/webappstack/blob/main/provision_webserver.sh

dnf -y install epel-release
dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
dnf -y install httpd
dnf -y module reset php
dnf -y module install php:remi-8.0
dnf -y install
    php \
    php-cli \
    php-common \
    php-fpm \
    php-mbstring \
    php-xml \
    php-mysqlnd



[ ! -f "${phpinfo_file}" ] && echo "<?php phpinfo();" > "${phpinfo_file}"

systemctl is-enabled httpd &>/dev/null || (systemctl enable httpd &>/dev/null && echo "httpd enabled")
systemctl status httpd &>/dev/null || (systemctl start httpd && echo "httpd started")

sudo systemctl enable php-fpm
sudo systemctl start php-fpm
sudo dnf install telnet
telnet localhost 80
sudo systemctl restart httpd

