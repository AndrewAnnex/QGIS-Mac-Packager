#!/bin/bash

function check_libffi() {
  env_var_exists VERSION_libffi
  env_var_exists LINK_libffi
}

function bundle_libffi() {
    try cp -av $DEPS_LIB_DIR/libffi.*dylib $BUNDLE_LIB_DIR
}

function postbundle_libffi() {
    install_name_id  @rpath/$LINK_libffi $BUNDLE_CONTENTS_DIR/MacOS/lib/$LINK_libffi

    install_name_change $DEPS_LIB_DIR/$LINK_libffi @rpath/$LINK_libffi $BUNDLE_CONTENTS_DIR/Resources/python/lib-dynload/_ctypes.cpython-${VERSION_major_python//./}m-darwin.so
    install_name_change $DEPS_LIB_DIR/$LINK_libffi @rpath/$LINK_libffi $BUNDLE_CONTENTS_DIR/Resources/python/site-packages/_cffi_backend.cpython-${VERSION_major_python//./}m-darwin.so
}
