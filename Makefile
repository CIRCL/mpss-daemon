prefix = /usr
exec_prefix = $(prefix)
includedir = $(prefix)/include/mic
libdir = $(prefix)/lib64
sysconfdir = /etc

all:
	cd libmpssconfig; make prefix=$(prefix) exec_prefix=$(exec_prefix) sysconfdir=$(sysconfdir) \
		includedir=$(includedir) libdir=$(libdir) \
		CC="$(CC)" CFLAGS="$(CFLAGS)" DESTDIR=$(DESTDIR)
	cd mpssd; make prefix=$(prefix) exec_prefix=$(exec_prefix) sysconfdir=$(sysconfdir) \
		includedir=$(includedir) libdir=$(libdir) \
		CC="$(CC)" CFLAGS="$(CFLAGS)" DESTDIR=$(DESTDIR)
	cd micctrl; make prefix=$(prefix) exec_prefix=$(exec_prefix) sysconfdir=$(sysconfdir) \
		includedir=$(includedir) libdir=$(libdir) \
		CC="$(CC)" CFLAGS="$(CFLAGS)" DESTDIR=$(DESTDIR)

install:
	cd libmpssconfig; make prefix=$(prefix) exec_prefix=$(exec_prefix) sysconfdir=$(sysconfdir) \
		includedir=$(includedir) libdir=$(libdir) \
		CC="$(CC)" CFLAGS="$(CFLAGS)" DESTDIR=$(DESTDIR) install
	cd mpssd; make prefix=$(prefix) exec_prefix=$(exec_prefix) sysconfdir=$(sysconfdir) \
		includedir=$(includedir) libdir=$(libdir) \
		CC="$(CC)" CFLAGS="$(CFLAGS)" DESTDIR=$(DESTDIR) install
	cd micctrl; make prefix=$(prefix) exec_prefix=$(exec_prefix) sysconfdir=$(sysconfdir) \
		includedir=$(includedir) libdir=$(libdir) \
		CC="$(CC)" CFLAGS="$(CFLAGS)" DESTDIR=$(DESTDIR) install

clean:
	cd libmpssconfig; make clean
	cd mpssd; make clean
	cd micctrl; make clean

