.PHONY: install

INSTALL      := ./install-sh
BINDIR       := /usr/local/bin

ETCBINDDIR   := /etc/bind
VARBINDDIR   := /var/lib/bind

default:
	@echo "No build needed. Assumes debian BIND9 style paths."
	@echo "\"make install\" to install."

install:
	$(INSTALL) -m 2755 -o root -g bind -d $(ETCBINDDIR)/dnstool
	$(INSTALL) -m 6775 -o bind -g bind -d $(VARBINDDIR)/dnstool
	$(INSTALL) -m 6775 -o bind -g bind -d $(VARBINDDIR)/dnstool-rev
	$(INSTALL) -m 0755 bin/dnstool $(BINDIR)/
	$(INSTALL) -m 0755 bin/dnstool-admin $(BINDIR)/
	$(INSTALL) -m 0755 bin/dnstool-zonesync $(BINDIR)/
	$(INSTALL) -m 0644 -o root -g bind conf/etc/bind/named.conf.dnstool $(ETCBINDDIR)/
	$(INSTALL) -m 0644 -o root -g bind conf/etc/bind/named.conf.example $(ETCBINDDIR)/
	$(INSTALL) -m 0644 -o root -g bind conf/etc/bind/dnstool/policy $(ETCBINDDIR)/dnstool/
	$(INSTALL) -m 0644 -o root -g bind conf/etc/bind/dnstool/empty-zone $(ETCBINDDIR)/dnstool/
	$(INSTALL) -m 0664 -o bind -g bind conf/var/lib/bind/dnstool/example.example $(VARBINDDIR)/dnstool/
	$(INSTALL) -m 0664 -o bind -g bind conf/var/lib/bind/dnstool/networks $(VARBINDDIR)/dnstool/
	$(INSTALL) -m 0664 -o bind -g bind conf/var/lib/bind/dnstool-rev/192.0.2 $(VARBINDDIR)/dnstool-rev/
	$(INSTALL) -m 0664 -o bind -g bind conf/var/lib/bind/dnstool-rev/198.51.100 $(VARBINDDIR)/dnstool-rev/
	$(INSTALL) -m 0664 -o bind -g bind conf/var/lib/bind/dnstool-rev/201.0.113 $(VARBINDDIR)/dnstool-rev/
	$(INSTALL) -m 0664 -o bind -g bind conf/var/lib/bind/dnstool-rev/zones.conf $(VARBINDDIR)/dnstool-rev/
	@echo "dnstool: Install complete. Now please review your $(ETCBINDDIR)."

