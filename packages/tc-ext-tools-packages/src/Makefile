PREFIX := /usr/local/share
DATADIR := $(DESTDIR)$(PREFIX)/tc-ext-tools/
export

.PHONY: all
all:
	echo "just `make install`"

install:
	test -d $(DATADIR)/packages/ || install -m 755 -d $(DATADIR)/packages/;
	cp -ap packages/* $(DATADIR)/packages/
	
