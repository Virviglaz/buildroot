################################################################################
#
# libsigc3
#
################################################################################

LIBSIGC3_VERSION_MAJOR = 3.6
LIBSIGC3_VERSION = $(LIBSIGC3_VERSION_MAJOR).0
LIBSIGC3_SOURCE = libsigc++-$(LIBSIGC3_VERSION).tar.xz
LIBSIGC3_SITE = https://download.gnome.org/sources/libsigc++/$(LIBSIGC3_VERSION_MAJOR)
LIBSIGC3_INSTALL_STAGING = YES
LIBSIGC3_LICENSE = LGPL-2.1+
LIBSIGC3_LICENSE_FILES = COPYING
LIBSIGC3_CONF_OPTS = \
	-Dbuild-examples=false \
	-Dbuild-tests=false \
	-Dvalidation=false

$(eval $(meson-package))
