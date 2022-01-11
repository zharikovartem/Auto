init:
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

help:
	echo "123"