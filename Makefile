init:
	rm -rf ./Makefile
	git clone https://github.com/zharikovartem/Auto.git .

clean:
	rm -rf ./Bash
	rm -rf ./Dockerfiles

push: 
	git add .
	read -p "Укажите имя коммита:   > " isfront
	git commit -m "first commit"
	git push

pull:
	git pull

new:
	bash bash/folder/choiseFolder.sh 
	# bash ./bash/new/run.sh