NULL = 

AM_CPPFLAGS = \
	$(LEDBORG_CLIENT_CFLAGS) \
	-include $(CONFIG_HEADER) \
	$(NULL)


AM_VALAFLAGS = \
	--vapidir=../vapi \
	--thread \
	--pkg Config \
	--pkg glib-2.0 \
	--pkg gio-2.0 \
	--pkg libsoup-2.4 \
	--pkg posix \
	--pkg LedBorg \
	$(NULL)


bin_PROGRAMS = ledborg_client

ledborg_client_SOURCES = \
	main.vala \
	$(NULL)

ledborg_client_LDADD = \
	$(LEDBORG_CLIENT_LIBS) \
	$(NULL)

EXTRA_DIST = \
	$(NULL)

DISTCLEANFILES = \
	*.c \
	*.o \
	$(NULL)

