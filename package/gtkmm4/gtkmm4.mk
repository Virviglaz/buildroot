################################################################################
#
# gtkmm4
#
################################################################################

GTKMM4_VERSION_MAJOR = 4.21
GTKMM4_VERSION = $(GTKMM4_VERSION_MAJOR).3
GTKMM4_SOURCE = gtkmm-$(GTKMM4_VERSION).tar.xz
GTKMM4_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM4_VERSION_MAJOR)
GTKMM4_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
GTKMM4_LICENSE_FILES = COPYING COPYING.tools
GTKMM4_INSTALL_STAGING = YES
GTKMM4_DEPENDENCIES = atkmm cairomm glibmm libgtk4 libsigc3 pangomm host-pkgconf

GTKMM4_CONF_OPTS = \
	-Dbuild-demos=false \
	-Dbuild-tests=false

$(eval $(meson-package))
