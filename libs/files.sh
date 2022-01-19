#!/bin/bash

function myfunc () {
    # read -p "Enter a value: " value
    # echo "adding value"
    # return $(( $value + 10 ))
    echo $(( $1 + $2 ))
}