# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rsyslog"
PKG_VERSION="8.21.0"
PKG_SHA256="bdb1fde87b75107b58d1cd5d00408822fb15b9f3efb8d9dbb93a1dee128339ab"
PKG_REV="103"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rsyslog"
PKG_URL="http://www.rsyslog.com/files/download/rsyslog/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain util-linux libestr libfastjson liblognorm librelp zlib libgcrypt liblogging"
PKG_SECTION="service"
PKG_SHORTDESC="Rsyslog: a rocket-fast system for log processing."
PKG_LONGDESC="Rsyslog ($PKG_VERSION) offers high-performance, great security features and a modular design."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Rsyslog"
PKG_ADDON_TYPE="xbmc.service"

PKG_CONFIGURE_OPTS_TARGET="--enable-imfile \
                           --enable-imjournal \
                           --enable-relp \
                           --enable-omjournal \
                           ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_realloc_0_nonnull=yes"

export LIBGCRYPT_CONFIG="$SYSROOT_PREFIX/usr/bin/libgcrypt-config"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp $PKG_BUILD/.$TARGET_NAME/tools/rsyslogd \
     $ADDON_BUILD/$PKG_ADDON_ID/bin/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/rsyslog
  for l in $(find $PKG_BUILD/.$TARGET_NAME -name *.so)
  do
    cp $l $ADDON_BUILD/$PKG_ADDON_ID/lib/rsyslog/
  done
}
