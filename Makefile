init:
	# rm -rf ./Makefile
	# git clone https://github.com/zharikovartem/Auto.git .
	bash bash/init/constant.sh

clean:
	rm -rf ./Bash
	rm -rf ./Dockerfiles

push: 
	bash bash/git/push.sh 

pull:
	git pull

new:
	bash bash/folder/choiseFolder.sh 
	# bash ./bash/new/run.sh

help:
	echo "123"