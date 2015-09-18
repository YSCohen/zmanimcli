####### Compiler, tools and options
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
#######

install_jar:
	@$(CHK_DIR_EXISTS) $(DESTDIR)/usr/bin/ || $(MKDIR) $(DESTDIR)/usr/bin/ 
	-$(INSTALL_PROGRAM) `pwd`/ZmanimCLI.jar $(DESTDIR)/usr/bin/

uninstall_jar:
	-$(DEL_FILE) $(DESTDIR)/usr/bin/ZmanimCLI.jar

install_sh:
	@$(CHK_DIR_EXISTS) $(DESTDIR)/usr/bin/ || $(MKDIR) $(DESTDIR)/usr/bin/ 
	-$(INSTALL_PROGRAM) `pwd`/zmanimcli $(DESTDIR)/usr/bin/

uninstall_sh:
	-$(DEL_FILE) $(DESTDIR)/usr/bin/ZmanimCLI

install: install_jar install_sh

uninstall: uninstall_jar uninstall_sh

clean:

FORCE:

all: