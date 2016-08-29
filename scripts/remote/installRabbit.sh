#!/bin/bash -x

sudo apt-get update
sudo apt-get -y -q install wget logrotate

wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc

# Install
sudo echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y --force-yes install rabbitmq-server

# Create config and enable admin
sudo echo -e "[ \n {rabbit, [ \n {loopback_users, []}, \n {heartbeat, 3600} \n ]} \n ]." >> /etc/rabbitmq/rabbitmq.config

sudo /usr/sbin/rabbitmq-plugins enable rabbitmq_management

# Start
sudo chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/mnesia
sudo chown -R rabbitmq:rabbitmq /var/log/rabbitmq
ulimit -n 65536
sudo rabbitmqctl stop || true
sudo /usr/sbin/rabbitmq-server &
