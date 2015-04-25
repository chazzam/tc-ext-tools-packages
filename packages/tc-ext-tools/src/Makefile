PREFIX := /usr/local
INSTALL := install -Dm 0755 -o tc -g staff
BINDIR := $(DESTDIR)$(PREFIX)/bin
SYSCONFDIR := $(DESTDIR)$(PREFIX)/etc
DATADIR := $(DESTDIR)$(PREFIX)/share
export

.PHONY: all
all:
	echo "just `make install`"

install:
	test -d $(BINDIR) || install -m 755 -d $(BINDIR);
	install -m 755 tools/* $(BINDIR)
	
	test -d $(DATADIR)/tet || install -m 755 -d $(DATADIR)/tet;
	$(INSTALL) common/build $(DATADIR)/tet/build.sample
	$(INSTALL) common/functions $(DATADIR)/tet/functions.sh
	$(INSTALL) config.sample $(DATADIR)/tet/config.sample
	$(INSTALL) install.sh $(DATADIR)/tet/install.sh
	$(INSTALL) [ACIR]* $(DATADIR)/tet/
	
	test -d $(SYSCONFDIR)/init.d || install -m 755 -d $(SYSCONFDIR)/init.d;
	$(INSTALL) common/tet-functions $(SYSCONFDIR)/init.d/tet-functions
	$(INSTALL) common/config $(SYSCONFDIR)/tet.conf
	
	test -d $(DESTDIR)/etc/init.d || install -m 755 -d $(DESTDIR)/etc/init.d;
	#$(INSTALL) common/tet-functions $(DESTDIR)/etc/init.d/tet-functions
	ln -sf $(PREFIX)/etc/init.d/tet-functions $(DESTDIR)/etc/init.d/tet-functions
	
