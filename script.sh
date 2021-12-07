#!/bin/bash
sudo dnf update
sudo dnf upgrade
sudo dnf install mariadb-server
sudo systemctl status mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb

