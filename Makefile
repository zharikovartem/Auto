init:
	bash bash/init/constant.sh

clean:
	rm -rf ./Bash
	rm -rf ./Dockerfiles

# add somesing
a:
	clear
	bash ./add/add.sh

push: 
	bash bash/git/push.sh 

pull:
	git pull

new:
	bash bash/folder/choiseFolder.sh 

help:
	clear
	bash help.sh

serv:
	bash ./server/run.sh 