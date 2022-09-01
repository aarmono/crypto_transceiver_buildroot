################################################################################
#
# libcodec2
#
################################################################################

LIBCODEC2_VERSION = HEAD
LIBCODEC2_SOURCE = master.tar.gz
LIBCODEC2_SITE = https://github.com/aarmono/codec2/archive/refs/heads
LIBCODEC2_LICENSE = LGPL-2.1
LIBCODEC2_LICENSE_FILES = COPYING
LIBCODEC2_INSTALL_STAGING = YES
LIBCODEC2_SUPPORTS_IN_SOURCE_BUILD = NO
LIBCODEC2_CONF_OPTS = -DUNITTEST=OFF

ifeq ($(BR2_PACKAGE_LIBCODEC2_EXAMPLES),y)
LIBCODEC2_CONF_OPTS += -DINSTALL_EXAMPLES=ON
endif

$(eval $(cmake-package))
