# Postgres
#
# VERSION 0.1

FROM ubuntu:12.04
MAINTAINER tylrtrmbl <taylor@thenewtricks.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -q -y upgrade

# Install Postgres
RUN apt-get -q -y install postgresql postgresql-contrib

# Configure a new Postgres server
ADD configure_postgres.sh /root/configure_postgres.sh
RUN chmod a+x /root/configure_postgres.sh
RUN /root/configure_postgres.sh

# Add run script
ADD run.sh /root/run.sh
RUN chmod a+x /root/run.sh

CMD ["/root/run.sh"]
