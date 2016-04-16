## Makefile.am -- Process this file with automake to produce Makefile.in

######################################################################
# COMMON
######################################################################

## Common flags
include $(top_srcdir)/common.am

BUILT_SOURCES =

######################################################################
# SUBDIRS
######################################################################

include $(srcdir)/postgres/backend/Makefile.am
include $(srcdir)/postgres/common/Makefile.am
include $(srcdir)/postgres/port/Makefile.am
include $(srcdir)/postgres/timezone/Makefile.am
include $(srcdir)/postgres/parser/Makefile.am

bin_PROGRAMS = parser

lib_LTLIBRARIES = libparser.la

DEFAULT_INCLUDES =

######################################################################
# LIBPARSER
######################################################################

libparser_la_SOURCES = \
			$(postgres_backend_FILES) \
			$(postgres_common_FILES) \
			$(postgres_port_FILES) \
			$(postgres_timezone_FILES) \
			$(postgres_parser_FILES)		

libparser_la_CPPFLAGS = $(AM_CPPFLAGS) \
						 -I$(srcdir)/postgres/include \
						 -I$(srcdir)/postgres/backend \
						 -I$(srcdir)/ \
						 -I. -I$(top_srcdir)/src -I..

libparser_la_CXXFLAGS = $(AM_CXXFLAGS) \
			  -Wno-unused-variable -Wno-unused-but-set-variable \
			  -Wno-unused-parameter -Wno-missing-field-initializers \
			  -Wno-array-bounds -Wno-clobbered -Wno-strict-overflow \
			  -Wno-sign-compare -Wno-write-strings \
			  -msse4.2
			  
libparser_la_LDFLAGS = -lprotobuf

######################################################################
# PARSER
######################################################################

parser_SOURCES = main.cpp
parser_LDFLAGS = 
parser_CPPFLAGS = -I. -I$(top_srcdir)/src -I.. $(postgres_common_INCLUDES) $(AM_CPPFLAGS)

parser_LDADD = libparser.la


