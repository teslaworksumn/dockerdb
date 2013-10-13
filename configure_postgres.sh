#!/bin/sh

set -e

/etc/init.d/postgresql start

# Change remote access settings
echo "listen_addresses='*'" >> /etc/postgresql/9.1/main/postgresql.conf
echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.1/main/pg_hba.conf

# Create new adminny user - TODO: change this password!
su postgres /bin/sh -c "psql -c \"CREATE ROLE dockerdb LOGIN PASSWORD 'edison' CREATEDB CREATEROLE;\""
su postgres /bin/sh -c "psql -c \"CREATE DATABASE dockerdb OWNER dockerdb ENCODING 'UTF8' TEMPLATE template0;\""

# Feel free to add any other database configuration here!

/etc/init.d/postgresql stop
