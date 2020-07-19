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
	$(INSTALL) -m 0755 $(@D)/buildroot-build/crypto_rx $(TARGET_DIR)/usr/bin/crypto_rx

	$(INSTALL) -m 0755 $(@D)/transmit.sh  $(TARGET_DIR)/usr/bin/transmit.sh
	$(INSTALL) -m 0755 $(@D)/receive.sh $(TARGET_DIR)/usr/bin/receive.sh
	$(INSTALL) -m 0755 $(@D)/configure.sh $(TARGET_DIR)/usr/bin/configure.sh
	$(INSTALL) -m 0755 $(@D)/restore.sh $(TARGET_DIR)/usr/bin/restore.sh

	$(INSTALL) -m 0644 $(@D)/crypto_tx.ini $(TARGET_DIR)/etc/crypto_tx.ini
	$(INSTALL) -m 0644 $(@D)/crypto_rx.ini $(TARGET_DIR)/etc/crypto_rx.ini

	$(INSTALL) -m 0644 $(@D)/startup.wav $(TARGET_DIR)/usr/share/sounds/startup.wav
endef

define CRYPTO_TRANSCEIVER_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 $(@D)/S29configure $(TARGET_DIR)/etc/init.d/S29configure
	$(INSTALL) -m 0755 $(@D)/S30transmit $(TARGET_DIR)/etc/init.d/S30transmit
	$(INSTALL) -m 0755 $(@D)/S31receive $(TARGET_DIR)/etc/init.d/S31receive
endef

$(eval $(cmake-package))
