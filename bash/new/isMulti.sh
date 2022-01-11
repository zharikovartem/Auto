#!/bin/bash

read -p "Будет ли несколько проектов в одном? y/n   > " isfront

if [[ ${isfront} == "y" ]]
then
    bash ~/Desktop/Auto/bash/new/runMulti.sh
else
    bash ~/Desktop/Auto/bash/new/run.sh
fi