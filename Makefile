init:
	rm -rf ./Makefile
	git clone https://github.com/zharikovartem/Auto.git .

pull: 
	git add .
	git commit -m "first commit"
	git pull