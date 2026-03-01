################################################################################
#
# eBikeGTK
#
################################################################################

EBIKEGTK_NAME = eBikeGTK
EBIKEGTK_SITE = https://github.com/Virviglaz/eBikeGTK.git
EBIKEGTK_VERSION = $(shell git ls-remote $(EBIKEGTK_SITE) master | cut -f1)
EBIKEGTK_SITE_METHOD = git
EBIKEGTK_GIT_SUBMODULES = YES
EBIKEGTK_GTKMM_VERSION = 3
EBIKEGTK_DEPENDENCIES = gtkmm$(EBIKEGTK_GTKMM_VERSION) host-pkgconf

define EBIKEGTK_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" BUILDDIR=$(@D) GTKMM_VERSION=$(EBIKEGTK_GTKMM_VERSION) -C $(DL_DIR)/$(EBIKEGTK_NAME)/git all
    $(TARGET_STRIP) $(@D)/eBikeGTK
endef

define EBIKEGTK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/eBikeGTK $(TARGET_DIR)/usr/bin
    mkdir -p $(TARGET_DIR)/usr/share/$(EBIKEGTK_NAME)/Resources
    mkdir -p $(TARGET_DIR)/usr/share/$(EBIKEGTK_NAME)/Theme
    $(INSTALL) -D -m 0644 $(DL_DIR)/$(EBIKEGTK_NAME)/git/Resources/* $(TARGET_DIR)/usr/share/$(EBIKEGTK_NAME)/Resources
    $(INSTALL) -D -m 0644 $(DL_DIR)/$(EBIKEGTK_NAME)/git/Theme/*     $(TARGET_DIR)/usr/share/$(EBIKEGTK_NAME)/Theme
endef

$(eval $(generic-package))
