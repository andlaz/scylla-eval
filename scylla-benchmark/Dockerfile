FROM ubuntu:14.04
MAINTAINER andras.szerdahelyi@gmail.com

RUN sudo apt-get update && \
	sudo apt-get install -y wget software-properties-common && \
	sudo wget -O /etc/apt/sources.list.d/scylla.list http://downloads.scylladb.com/deb/ubuntu/scylla-1.3-trusty.list && \
	sudo add-apt-repository ppa:webupd8team/java && \
	sudo apt-get update && \
	echo debconf shared/accepted-oracle-license-v1-1 select true | \
  	sudo debconf-set-selections && \
	echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  	sudo debconf-set-selections && \
	sudo apt-get install -y --force-yes scylla-tools oracle-java8-installer gnuplot git && \
	wget http://archive.apache.org/dist/cassandra/3.0.6/apache-cassandra-3.0.6-bin.tar.gz && \
	tar xfv apache-cassandra-3.0.6-bin.tar.gz && \
	git clone https://github.com/andlaz/scylla-eval.git /scylla-eval
