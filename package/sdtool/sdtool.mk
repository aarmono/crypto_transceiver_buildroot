################################################################################
#
# sdtool
#
################################################################################

SDTOOL_VERSION = HEAD
SDTOOL_SOURCE = master.tar.gz
SDTOOL_SITE = https://github.com/BertoldVdb/sdtool/archive/refs/heads
SDTOOL_LICENSE = BSD
SDTOOL_INSTALL_STAGING = NO

define SDTOOL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define SDTOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/sdtool* $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
