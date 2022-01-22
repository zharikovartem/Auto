#!/bin/bash
# echo "run project: ${1}"

. ./libs/projects.sh

result=$(getProjectByName ${1})

echo "The result is: $result"