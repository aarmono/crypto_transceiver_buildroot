################################################################################
#
# crypto_transceiver
#
################################################################################

CRYPTO_TRANSCEIVER_VERSION = HEAD
CRYPTO_TRANSCEIVER_SITE = git://github.com/aarmono/crypto_transceiver
CRYPTO_TRANSCEIVER_LICENSE = LGPL-2.1
CRYPTO_TRANSCEIVER_INSTALL_STAGING = NO
CRYPTO_TRANSCEIVER_SUPPORTS_IN_SOURCE_BUILD = NO
CRYPTO_TRANSCEIVER_DEPENDENCIES = libcodec2

define CRYPTO_TRANSCEIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buildroot-build/crypto_tx $(TARGET_DIR)/usr/bin/crypto_tx
	$(INSTALL) -m 0755 $(@D)/buildroot-build/crypto_tx $(TARGET_DIR)/usr/bin/crypto_tx
	$(INSTALL) -m 0755 $(@D)/buildroot-build/crypto_tx $(TARGET_DIR)/usr/bin/crypto_tx
	$(INSTALL) -m 0644 $(@D)/crypto_tx.ini $(TARGET_DIR)/etc/crypto_tx.ini
	$(INSTALL) -m 0644 $(@D)/crypto_rx.ini $(TARGET_DIR)/etc/crypto_rx.ini
endef

$(eval $(cmake-package))
