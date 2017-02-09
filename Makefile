PREFIX=/usr/local
BIN_PATH=$(PREFIX)/bin
SHARE_PATH=$(PREFIX)/share
LIB_PATH=$(PREFIX)/lib
GIT_THIS_DAY_PATH=$(LIB_PATH)/git-this-day


.PHONY: prepare install


all: install


prepare:
	mkdir -p $(GIT_THIS_DAY_PATH)


install: prepare
	cp ./get-commits-from-last-day.sh $(GIT_THIS_DAY_PATH)
	cp ./what-have-i-done-today.sh $(GIT_THIS_DAY_PATH)


uninstall:
	rm -r $(GIT_THIS_DAY_PATH)
