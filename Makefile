prefix  ?= /usr/local
bindir  ?= $(prefix)/bin
datadir ?= $(prefix)/share

palettes ?= $(datadir)/paleta

install: install-paleta install-palettes

install-paleta:
	install -d $(DESTDIR)$(bindir)
	install -m 0755 paleta $(DESTDIR)$(bindir)/paleta

install-palettes:
	install -d $(DESTDIR)$(palettes)
	cd palettes && for p in *; do \
	    install -m 0644 "$${p}" $(DESTDIR)$(palettes)/$${p}; \
	done

FRC: install install-paleta install-palettes
