#!/bin/bash

sysctl vm.overcommit_memory=1 > /dev/null
exec /usr/sbin/php5-fpm -F
