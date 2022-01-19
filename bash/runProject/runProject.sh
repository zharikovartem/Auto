#!/bin/bash
echo "run project: ${1}"

. ./libs/files.sh

result=$(myfunc 10 20)
echo "The result is: $result"