include buildconf.mk

all: syndicatefs

.PHONY: syndicatefs
syndicatefs:
	$(MAKE) -C syndicatefs

.PHONY: install
install:
	$(MAKE) -C syndicatefs install

.PHONY: uninstall
uninstall:
	$(MAKE) -C syndicatefs uninstall

.PHONY: clean
clean:
	$(MAKE) -C syndicatefs clean

