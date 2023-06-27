################################################################################
#
# crypto_transceiver
#
################################################################################

CRYPTO_TRANSCEIVER_VERSION = HEAD
CRYPTO_TRANSCEIVER_SOURCE = master.tar.gz
CRYPTO_TRANSCEIVER_SITE = https://github.com/aarmono/crypto_transceiver/archive/refs/heads
CRYPTO_TRANSCEIVER_LICENSE = GPL-2.1
CRYPTO_TRANSCEIVER_INSTALL_STAGING = NO
CRYPTO_TRANSCEIVER_SUPPORTS_IN_SOURCE_BUILD = NO
CRYPTO_TRANSCEIVER_DEPENDENCIES = libcodec2 libsamplerate jack2 libgpiod

define CRYPTO_TRANSCEIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buildroot-build/iniget $(TARGET_DIR)/usr/bin/iniget
	$(INSTALL) -m 0755 $(@D)/buildroot-build/iniset $(TARGET_DIR)/usr/bin/iniset
	$(INSTALL) -m 0755 $(@D)/buildroot-build/jack_crypto_tx $(TARGET_DIR)/usr/bin/jack_crypto_tx
	$(INSTALL) -m 0755 $(@D)/buildroot-build/jack_crypto_rx $(TARGET_DIR)/usr/bin/jack_crypto_rx

	$(INSTALL) -m 0755 $(@D)/configure.sh $(TARGET_DIR)/usr/bin/configure.sh
	$(INSTALL) -m 0755 $(@D)/restore.sh $(TARGET_DIR)/usr/bin/restore.sh

	$(INSTALL) -m 0755 $(@D)/start_jackd_tx.sh $(TARGET_DIR)/usr/bin/start_jackd_tx.sh
	$(INSTALL) -m 0755 $(@D)/start_jackd_rx.sh $(TARGET_DIR)/usr/bin/start_jackd_rx.sh
	$(INSTALL) -m 0755 $(@D)/start_jack_crypto_tx.sh $(TARGET_DIR)/usr/bin/start_jack_crypto_tx.sh
	$(INSTALL) -m 0755 $(@D)/start_jack_crypto_rx.sh $(TARGET_DIR)/usr/bin/start_jack_crypto_rx.sh

	$(INSTALL) -m 0644 $(@D)/crypto.ini $(TARGET_DIR)/etc/crypto.ini

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/equalizers
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc/equalizers $(@D)/equalizers/*.txt

	$(INSTALL) -m 0644 $(@D)/secure.wav $(TARGET_DIR)/usr/share/sounds/secure.wav
	$(INSTALL) -m 0644 $(@D)/insecure.wav $(TARGET_DIR)/usr/share/sounds/insecure.wav
endef

define CRYPTO_TRANSCEIVER_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 $(@D)/S27configure $(TARGET_DIR)/etc/init.d/S27configure
	$(INSTALL) -m 0755 $(@D)/S28jackd_tx $(TARGET_DIR)/etc/init.d/S28jackd_tx
	$(INSTALL) -m 0755 $(@D)/S29jackd_rx $(TARGET_DIR)/etc/init.d/S29jackd_rx
	$(INSTALL) -m 0755 $(@D)/S30jack_crypto_tx $(TARGET_DIR)/etc/init.d/S30jack_crypto_tx
	$(INSTALL) -m 0755 $(@D)/S31jack_crypto_rx $(TARGET_DIR)/etc/init.d/S31jack_crypto_rx
endef

$(eval $(cmake-package))
