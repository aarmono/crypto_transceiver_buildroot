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
	$(INSTALL) -m 0755 $(@D)/buildroot-build/keypad_reader $(TARGET_DIR)/usr/bin/keypad_reader

	$(INSTALL) -m 0644 $(@D)/shell_functions.sh $(TARGET_DIR)/etc/profile.d/shell_functions.sh

	$(INSTALL) -m 0755 $(@D)/configure.sh $(TARGET_DIR)/usr/bin/configure.sh
	$(INSTALL) -m 0755 $(@D)/restore.sh $(TARGET_DIR)/usr/bin/restore.sh
	$(INSTALL) -m 0755 $(@D)/initialize.sh $(TARGET_DIR)/usr/bin/initialize.sh
	$(INSTALL) -m 0755 $(@D)/keypad_updater_radio.sh $(TARGET_DIR)/usr/bin/keypad_updater_radio.sh
	$(INSTALL) -m 0755 $(@D)/keypad_updater_keyfill.sh $(TARGET_DIR)/usr/bin/keypad_updater_keyfill.sh
	$(INSTALL) -m 0755 $(@D)/keypad_reader.sh $(TARGET_DIR)/usr/bin/keypad_reader.sh

	$(INSTALL) -m 0755 $(@D)/start_pppoe_server.sh $(TARGET_DIR)/usr/bin/start_pppoe_server.sh
	$(INSTALL) -m 0755 $(@D)/start_pppoe_client.sh $(TARGET_DIR)/usr/bin/start_pppoe_client.sh
	$(INSTALL) -m 0755 $(@D)/start_keyfill_led.sh $(TARGET_DIR)/usr/bin/start_keyfill_led.sh

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/keys

	$(INSTALL) -m 0755 $(@D)/start_jackd_tx.sh $(TARGET_DIR)/usr/bin/start_jackd_tx.sh
	$(INSTALL) -m 0755 $(@D)/start_jackd_rx.sh $(TARGET_DIR)/usr/bin/start_jackd_rx.sh
	$(INSTALL) -m 0755 $(@D)/start_jack_crypto_tx.sh $(TARGET_DIR)/usr/bin/start_jack_crypto_tx.sh
	$(INSTALL) -m 0755 $(@D)/start_jack_crypto_rx.sh $(TARGET_DIR)/usr/bin/start_jack_crypto_rx.sh

	$(INSTALL) -m 0644 $(@D)/crypto.ini $(TARGET_DIR)/etc/crypto.ini

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/share/help
	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/share/help $(@D)/help/*.txt

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/equalizers
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc/equalizers $(@D)/equalizers/*.txt

	$(INSTALL) -m 0644 $(@D)/secure.wav $(TARGET_DIR)/usr/share/sounds/secure.wav
	$(INSTALL) -m 0644 $(@D)/insecure.wav $(TARGET_DIR)/usr/share/sounds/insecure.wav
	$(INSTALL) -m 0644 $(@D)/beep.wav $(TARGET_DIR)/usr/share/sounds/beep.wav
endef

define CRYPTO_TRANSCEIVER_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 $(@D)/S27configure $(TARGET_DIR)/etc/init.d/S27configure
	$(INSTALL) -m 0755 $(@D)/S28jackd_tx $(TARGET_DIR)/etc/init.d/S28jackd_tx
	$(INSTALL) -m 0755 $(@D)/S29jackd_rx $(TARGET_DIR)/etc/init.d/S29jackd_rx
	$(INSTALL) -m 0755 $(@D)/S30jack_crypto_tx $(TARGET_DIR)/etc/init.d/S30jack_crypto_tx
	$(INSTALL) -m 0755 $(@D)/S31jack_crypto_rx $(TARGET_DIR)/etc/init.d/S31jack_crypto_rx
	$(INSTALL) -m 0755 $(@D)/S32keypad_control $(TARGET_DIR)/etc/init.d/S32keypad_control

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d/manual
	$(INSTALL) -m 0755 $(@D)/S10pppoe_server $(TARGET_DIR)/etc/init.d/manual/S10pppoe_server
	$(INSTALL) -m 0755 $(@D)/S10pppoe_client $(TARGET_DIR)/etc/init.d/manual/S10pppoe_client
	$(INSTALL) -m 0755 $(@D)/S60keyfill_led $(TARGET_DIR)/etc/init.d/manual/S60keyfill_led
endef

define CRYPTO_TRANSCEIVER_USERS
	keyfill -1 keyfill -1 - /var/empty /usr/bin/nologin - For key fill
endef


$(eval $(cmake-package))
