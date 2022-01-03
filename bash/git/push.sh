#!/bin/bash


read -p "Укажите имя коммита:   > " commit
git add .
git commit -m "${commit}"
git push