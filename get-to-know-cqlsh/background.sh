#!/bin/bash

CASSANDRA_VERSION=3.11.6

echo "export CASSANDRA_VERSION=$CASSANDRA_VERSION" >>~/.bashrc

export PATH=$JAVA_HOME/bin:$PATH

url="http://archive.apache.org/dist/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz"
wget $url

filepath="apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz"
tar xzf $filepath

apache-cassandra-${CASSANDRA_VERSION}/bin/cassandra -R

logpath="apache-cassandra-${CASSANDRA_VERSION}/logs/system.log"
while [ `grep "Starting listening for CQL clients" $logpath | wc -l` -lt 1 ]; do
   sleep 15
done

#wget https://downloads.apache.org/cassandra/3.11.6/apache-cassandra-3.11.6-bin.tar.gz
#tar xzf apache-cassandra-3.11.6-bin.tar.gz
#apache-cassandra-3.11.6/bin/cassandra -R
#while [ `grep "Starting listening for CQL clients" apache-cassandra-3.11.6/logs/system.log | wc -l` -lt 1 ]; do
#   sleep 15
#done

echo "done" >> /opt/katacoda-background-finished
