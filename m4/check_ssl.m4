dnl Available from the GNU Autoconf Macro Archive at:
dnl http://www.gnu.org/software/ac-archive/htmldoc/check_ssl.html
dnl rewritten by netustad author
AC_DEFUN([AC_CHECK_SSL],
	[AC_MSG_CHECKING(if ssl is wanted)
	AC_ARG_WITH(ssl,
	[  --without-ssl disable ssl],
	[
		if test "x$with_ssl"="xno"; then
			AC_MSG_RESULT(no)
			AC_DEFINE(WITHOUT_SSL, YES, [do not use openssl] )
			without_ssl=yes
		fi
	],
	[   AC_MSG_RESULT(yes)
	    for dir in $withval /usr/local/ssl /usr/lib/ssl /usr/ssl /usr/pkg /usr/local /usr; do
	        ssldir="$dir"
	        if test -f "$dir/include/openssl/ssl.h"; then
	            found_ssl="yes";
	            CFLAGS="$CFLAGS -I$ssldir/include/openssl -DHAVE_SSL";
	            CXXFLAGS="$CXXFLAGS -I$ssldir/include/openssl -DHAVE_SSL";
	            break;
	        fi
	        if test -f "$dir/include/ssl.h"; then
	            found_ssl="yes";
	            CFLAGS="$CFLAGS -I$ssldir/include/ -DHAVE_SSL";
	            CXXFLAGS="$CXXFLAGS -I$ssldir/include/ -DHAVE_SSL";
	            break
	        fi
	    done
	    if test x_$found_ssl != x_yes; then
	        AC_MSG_ERROR(Cannot find ssl libraries)
	    else
	        printf "OpenSSL found in $ssldir\n";
	        LIBS="$LIBS -lssl -lcrypto";
	        LDFLAGS="$LDFLAGS -L$ssldir/lib";
	        HAVE_SSL=yes
	    fi
	    AC_SUBST(HAVE_SSL)
	])
])dnl
