#!/bin/bash

# This is the command I run on my server to refresh the data/codebase.
# my.cnf is a file that looks like this:
#     [client]
#     user=issa
#     password=secret

git pull && make -B access-portal/head_date.txt && make read MYSQL_ARGS="--defaults-extra-file=my.cnf"
