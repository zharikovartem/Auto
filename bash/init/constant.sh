#!/bin/bash

# echo # source ~/.bashrc >> ~/.bashrc
# alias m='bash ~/Desktop/Auto/run.sh'
# alias ms='bash ~/Desktop/Auto/start.sh $(pwd)'

echo alias m="bash ~/Desktop/Auto/run.sh" >> ~/.bashrc
echo alias ms='bash ~/Desktop/Auto/start.sh $(pwd)' >> ~/.bashrc
source ~/.bashrc