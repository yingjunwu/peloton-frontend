## Makefile.am -- Process this file with automake to produce Makefile.in

######################################################################
# POSTGRES_PARSER
######################################################################

postgres_parser_FILES = \
						postgres/parser/pg_query_fingerprint.cpp \
						postgres/parser/pg_query_parse.cpp \
						postgres/parser/pg_query_json.cpp \
						postgres/parser/pg_polyfills.cpp \
						postgres/parser/pg_query.cpp \
						postgres/parser/pg_query_normalize.cpp \
						postgres/parser/sha1.cpp

postgres_parser_INCLUDES = \
							 -I$(srcdir)/postgres/include \
							 -I$(srcdir)/postgres/backend
