#!/bin/bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export QGIS_PREFIX_PATH=$THISDIR/..

$THISDIR/_qgis_mapserv.fcgi "$@"
