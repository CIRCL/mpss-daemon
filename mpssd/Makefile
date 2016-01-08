INSTALL = install
INSTALL_d = $(INSTALL) -d
INSTALL_x = $(INSTALL)
INSTALL_f = $(INSTALL) -m 644

prefix = /usr
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
sbindir = $(exec_prefix)/sbin
datarootdir = $(prefix)/share
sysconfdir = $(prefix)/etc

mpssconf = $(sysconfdir)/mpss
logrotate = $(sysconfdir)/logrotate.d
CFLAGS ?= -g
LDFLAGS ?= -g
LDLIBS = -pthread -L../libmpssconfig -lmpssconfig -lscif

ALL_CFLAGS = $(CFLAGS) -rdynamic -I../libmpssconfig -pthread
ALL_LDFLAGS = $(LDFLAGS) -rdynamic

# Makes it easy to inject "-Wall -Werror" from the environment
ALL_CFLAGS += $(USERWARNFLAGS)

FILES = mpssd_upstream_knc.c mpssd.c

HEADERS = ../libmpssconfig/libmpsscommon.h ../libmpssconfig/mpssconfig.h
PROGRAMS = mpssd

.PHONY: all install clean $(PROGRAMS)

all: $(PROGRAMS)

install: $(PROGRAMS)
	$(INSTALL_d) $(DESTDIR)$(sbindir)
	$(INSTALL_x) mpssd $(DESTDIR)$(sbindir)
	$(INSTALL_d) $(DESTDIR)$(mpssconf)/
	$(INSTALL_x) mpss.common $(DESTDIR)$(mpssconf)
	$(INSTALL_x) mpss.redhat $(DESTDIR)$(mpssconf)
	$(INSTALL_x) mpss.service $(DESTDIR)$(mpssconf)
	$(INSTALL_x) mpss.suse $(DESTDIR)$(mpssconf)
	$(INSTALL_x) mpss.ubuntu $(DESTDIR)$(mpssconf)
	$(INSTALL_x) mpss.suspend.service $(DESTDIR)$(mpssconf)
	$(INSTALL_x) mpss.suspend $(DESTDIR)$(mpssconf)
	$(INSTALL_x) mpss.resume $(DESTDIR)$(mpssconf)
	$(INSTALL_d) $(DESTDIR)$(logrotate)/
	$(INSTALL_f) mpssd.logrotate $(DESTDIR)$(logrotate)/mpssd

clean:
	rm -f $(PROGRAMS) $(FILES:%.c=%.o)

$(PROGRAMS): mpssd_upstream_knc.o mpssd.o
	$(CC) $(ALL_LDFLAGS) $^ $(LDLIBS) -o $@

$(FILES:%.c=%.o): %.o: %.c $(HEADERS)
	$(CC) $(ALL_CFLAGS) $< -c -o $@
