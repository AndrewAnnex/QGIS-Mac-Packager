#!/bin/bash

function check_expat() {
  env_var_exists VERSION_expat
  env_var_exists LINK_expat
}

function bundle_expat() {
  try cp -av $DEPS_LIB_DIR/libexpat.*dylib $BUNDLE_LIB_DIR
}

function postbundle_expat() {
 install_name_id  @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/MacOS/lib/$LINK_expat
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/MacOS/QGIS
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Frameworks/qgis_core.framework/Versions/$QGIS_VERSION/qgis_core
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Frameworks/qgis_3d.framework/Versions/$QGIS_VERSION/qgis_3d
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Frameworks/qgis_analysis.framework/Versions/$QGIS_VERSION/qgis_analysis
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Frameworks/qgis_gui.framework/Versions/$QGIS_VERSION/qgis_gui
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Frameworks/qgisgrass${VERSION_grass_major}.framework/Versions/$QGIS_VERSION/qgisgrass${VERSION_grass_major}
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libgeometrycheckerplugin.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libdb2provider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libidentcertauthmethod.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libtopolplugin.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libgpxprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libesritokenauthmethod.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libpostgresrasterprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libwcsprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libmdalprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libdelimitedtextprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libgpsimporterplugin.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libspatialiteprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libgeonodeprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libgrassrasterprovider${VERSION_grass_major}.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libwfsprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/liboauth2authmethod.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libbasicauthmethod.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libarcgisfeatureserverprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libowsprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libpkipathsauthmethod.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libwmsprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libofflineeditingplugin.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libpkcs12authmethod.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libgrassprovider${VERSION_grass_major}.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libmssqlprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libarcgismapserverprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libpostgresprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libgrassplugin${VERSION_grass_major}.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/qgis/libvirtuallayerprovider.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Resources/python/lib-dynload/pyexpat.cpython-37m-darwin.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Resources/python/lib-dynload/_elementtree.cpython-37m-darwin.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Resources/python/qgis/_core.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Resources/python/qgis/_3d.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Resources/python/qgis/_analysis.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/Resources/python/qgis/_gui.so
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/MacOS/lib/libqgis_app.$QGIS_VERSION.0.dylib
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/MacOS/lib/libexpat.1.6.11.dylib
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/MacOS/lib/libqgispython.$QGIS_VERSION.0.dylib
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_baseu_xml-${LINK_wxmac_version}.dylib
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_CONTENTS_DIR/PlugIns/designer/libqgis_customwidgets.$QGIS_VERSION.0.dylib
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_LIB_DIR/$LINK_fontconfig
 install_name_change $DEPS_LIB_DIR/$LINK_expat @rpath/$LINK_expat $BUNDLE_LIB_DIR/$LINK_exiv2
}

