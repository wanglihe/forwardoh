DESTDIR =  
PREFIX = /usr

all:

install: src/forwardoh
	install -m 0755 $^ $(DESTDIR)/$(PREFIX)/bin/

uninstall:
	rm -f $(DESTDIR)/$(PREFIX)/bin/forwardoh
