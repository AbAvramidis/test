.PHONY: mode scp git2 run

BUILD_FILE = allzip.zip
FILES = *.py
REMOTE = ab@10.0.10.11
ARG = " "

mode:
	zip -r9T $(BUILD_FILE) $(FILES)
scp: mode
	scp $(BUILD_FILE) $(REMOTE):. 
	ssh ${REMOTE} "unzip $(BUILD_FILE)"
	ssh ${REMOTE} /bin/bash 'ls; pwd; python test.py'
run: scp
	./test.py ${ARG} >> log.txt
	
git2: run
	git status
	git add .
	git commit -m ${ARG}
	git push -u origin master
	
