NULL = 

ACLOCAL_AMFLAGS = -I m4

#Build in these directories:

SUBDIRS = \
	src \
	po \
	$(NULL)

ledborg_clientdocdir = ${prefix}/doc/ledborg_client
ledborg_clientdoc_DATA = \
	ChangeLog \
	README \
	COPYING \
	AUTHORS \
	INSTALL \
	NEWS\
	$(NULL)

EXTRA_DIST = \
	$(ledborg_clientdoc_DATA) \
	intltool-extract.in \
	intltool-merge.in \
	intltool-update.in\
	$(NULL)

DISTCLEANFILES = \
	intltool-extract \
	intltool-merge \
	intltool-update \
	po/.intltool-merge-cache \
	$(NULL)

