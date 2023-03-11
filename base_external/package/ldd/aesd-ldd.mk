
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
LDD_VERSION = 718cbdf07e082486e008537660e6b9fb4fb07a45
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-ajaykandagal.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = $(@D)/misc-module
LDD_MODULE_SUBDIRS += $(@D)/scull


# TODO add your ldd modules build steps below
define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-module all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull all
endef

# TODO add your ldd modules and startup script installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-module/faulty.ko  $(TARGET_DIR)/usr/bin/ldd/
	$(INSTALL) -m 0755 $(@D)/misc-module/hello.ko  $(TARGET_DIR)/usr/bin/ldd/
	$(INSTALL) -m 0755 $(@D)/misc-module/module_load  $(TARGET_DIR)/usr/bin/ldd/
	$(INSTALL) -m 0755 $(@D)/misc-module/module_unload  $(TARGET_DIR)/usr/bin/ldd/
	$(INSTALL) -m 0755 $(@D)/scull/scull.ko  $(TARGET_DIR)/usr/bin/ldd/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load  $(TARGET_DIR)/usr/bin/ldd/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload  $(TARGET_DIR)/usr/bin/ldd/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
