#!/usr/bin/env bash

# Well, build tools are available only on MacOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Building QGIS for MacOS platform"
else
  echo "Unable to build QGIS binaries on $OSTYPE"
  exit 1;
fi

# Internals
CRED="\x1b[31;01m"
CBLUE="\x1b[34;01m"
CGRAY="\x1b[30;01m"
CRESET="\x1b[39;49;00m"

function try () {
    "$@" || exit -1
}

function info() {
  echo -e "$CBLUE"$@"$CRESET";
}

function error() {
  MSG="$CRED"$@"$CRESET"
  echo -e $MSG;
  exit -1
}

function debug() {
  echo -e "$CGRAY"$@"$CRESET";
}

source `dirname $0`/../qgis_deps/config.conf
if [ -d $ROOT_OUT_PATH/stage ]; then
       info "Using qgis_deps: $ROOT_OUT_PATH/stage"
else
       error "Missing qgis_deps directory '$ROOT_OUT_PATH/stage' not found."
fi

source $ROOT_OUT_PATH/stage/qgis-deps.config

CORES=$(sysctl -n hw.ncpu)


# TODO replace with something configurable
# TODO use MACOSX_DEPLOYMENT_TARGET
export QGIS_VERSION=3.13
export QGIS_SOURCE_DIR=~/Projects/mesh/QGIS
export QGIS_BUILD_DIR=$ROOT_OUT_PATH/../qgis-${QGIS_VERSION}-deps-${RELEASE_VERSION}/build
export QGIS_INSTALL_DIR=$ROOT_OUT_PATH/../qgis-${QGIS_VERSION}-deps-${RELEASE_VERSION}/install

OLD_PATH=$PATH

try mkdir -p $QGIS_BUILD_DIR
try mkdir -p $QGIS_INSTALL_DIR

try cd $QGIS_BUILD_DIR

PATH=$ROOT_OUT_PATH/stage/bin:$PATH \
cmake -DQGIS_MAC_DEPS_DIR=$ROOT_OUT_PATH/stage \
      -DCMAKE_PREFIX_PATH=$QT_BASE/clang_64 \
      -DQGIS_MACAPP_BUNDLE=-1 \
      -DWITH_3D=TRUE \
      -DWITH_BINDINGS=TRUE \
      -DENABLE_TESTS=FALSE \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=$MACOSX_DEPLOYMENT_TARGET \
      -DCMAKE_INSTALL_PREFIX:PATH=$QGIS_INSTALL_DIR\
      $QGIS_SOURCE_DIR > cmake.configure 2>&1

cat cmake.configure

targets=(
    libgdal.dylib
    libgeos_c.dylib
    libproj.dylib
)
for i in ${targets[*]}
do
    if grep -q /usr/local/lib/$i cmake.configure
    then
      error "CMake configured QGIS build with /usr/local/lib/$i.dylib string -- we should be using qgis_deps version of this library"
    fi
done

targets=(
    libz
    libssl
    libcrypto
    libpq
    libxml2
    libsqlite3
)
for i in ${targets[*]}
do
    if grep -q /usr/lib/$i cmake.configure
    then
      error "CMake configured QGIS build with /usr/lib/$i.dylib string -- we should be using qgis_deps version of this library"
    fi
done

try cd $QGIS_BUILD_DIR
try make -j ${CORES}
try make install