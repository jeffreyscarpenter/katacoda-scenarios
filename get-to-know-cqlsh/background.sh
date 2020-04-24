#!/bin/bash
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
wget http://www.apache.org/dyn/closer.lua/cassandra/4.0-alpha4/apache-cassandra-4.0-alpha4-bin.tar.gz
tar xzf apache-cassandra-4.0-alpha4-bin.tar.gz
apache-cassandra-4.0-alpha4/bin/cassandra -R
while [ `grep "Starting listening for CQL clients" apache-cassandra-4.0-alpha4/logs/system.log | wc -l` -lt 1 ]; do
   sleep 15
done
echo "done" >> /opt/katacoda-background-finished
