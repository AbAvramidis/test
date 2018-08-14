.PHONY: mode scp git

BUILD_FILE = allzip.zip
FILES = *.py
REMOTE = ab@10.0.10.11

mode:
	zip -r9T $(BUILD_FILE) $(FILES)
scp: mode
	scp $(BUILD_FILE) $(REMOTE):. 
	ssh ${REMOTE} "unzip $(BUILD_FILE) && ./test.py && ./file1.py"

git: scp
	git add *
	git commit -m "Makefile commit"
	git push -u origin master
	
