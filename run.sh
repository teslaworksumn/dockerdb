#!/bin/sh

set -e

/etc/init.d/postgresql start

/bin/bash

/etc/init.d/postgresql stop
