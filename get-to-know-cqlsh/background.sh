#!/bin/bash

#echo "export PATH=$JAVA_HOME/bin:$PATH" >>~/.bashrc

#export PATH=$JAVA_HOME/bin:$PATH

wget http://archive.apache.org/dist/cassandra/4.0-alpha3/apache-cassandra-4.0-alpha3-bin.tar.gz
tar xzf apache-cassandra-4.0-alpha3-bin.tar.gz
apache-cassandra-4.0-alpha3/bin/cassandra -R
while [ `grep "Starting listening for CQL clients" apache-cassandra-4.0-alpha3/logs/system.log | wc -l` -lt 1 ]; do
   sleep 15
done

#wget https://downloads.apache.org/cassandra/3.11.6/apache-cassandra-3.11.6-bin.tar.gz
#tar xzf apache-cassandra-3.11.6-bin.tar.gz
#apache-cassandra-3.11.6/bin/cassandra -R
#while [ `grep "Starting listening for CQL clients" apache-cassandra-3.11.6/logs/system.log | wc -l` -lt 1 ]; do
#   sleep 15
#done

echo "done" >> /opt/katacoda-background-finished
