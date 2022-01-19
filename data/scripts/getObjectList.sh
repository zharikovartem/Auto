#!/bin/bash
json=$1
object=$2

function myfunc {
    read -p "Enter a value: " value
    echo "adding value"
    return $(( $value + 10 ))
}