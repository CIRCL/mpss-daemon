INSTALL = install
INSTALL_d = $(INSTALL) -d
INSTALL_x = $(INSTALL) -m 755
INSTALL_s = $(INSTALL) -m 4755
INSTALL_f = $(INSTALL) -m 644

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
sbindir = $(exec_prefix)/sbin
sysconfdir = $(prefix)/etc

mpssconf = $(sysconfdir)/mpss

CFLAGS ?= -g
LDFLAGS ?= -g
LDLIBS = -lcrypt -L../libmpssconfig -lmpssconfig -lscif #-lncurses

ALL_CFLAGS = $(CFLAGS) -rdynamic -I../libmpssconfig -pthread
ALL_LDFLAGS = $(LDFLAGS) -rdynamic

# Makes it easy to inject "-Wall -Werror" from the environment
ALL_CFLAGS += $(USERWARNFLAGS)

FILES = micctrl.c init.c network.c rootdev.c state.c user.c power.c dirs.c misc.c \
	config.c utilfuncs.c help.c mpsscookie.c
OBJS = micctrl.o init.o network.o rootdev.o state.o user.o power.o dirs.o misc.o \
	config.o utilfuncs.o help.o mpsscookie.o

HEADERS = ../libmpssconfig/libmpsscommon.h ../libmpssconfig/mpssconfig.h micctrl.h help.h
PROGRAMS = micctrl micctrl_passwd

.PHONY: all install clean $(PROGRAMS)

all: $(PROGRAMS)

install: $(PROGRAMS)
	$(INSTALL_d) $(DESTDIR)$(mpssconf)/conf.d
	$(INSTALL_d) $(DESTDIR)$(sbindir)
	$(INSTALL_x) micctrl $(DESTDIR)$(sbindir)
	$(INSTALL_s) micctrl_passwd $(DESTDIR)$(sbindir)

clean:
	rm -f $(PROGRAMS) $(FILES:%.c=%.o) micctrl_passwd.o

micctrl: $(OBJS)
micctrl_passwd: micctrl_passwd.o utilfuncs.o mpsscookie.o

$(PROGRAMS): 
	$(CC) $(ALL_LDFLAGS) $^ $(LDLIBS) -o $@

$(FILES:%.c=%.o) micctrl_passwd.o: %.o: %.c $(HEADERS)
	$(CC) $(ALL_CFLAGS) $< -c -o $@
