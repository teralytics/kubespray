#!/bin/bash
set -e

BINDIR="/opt/bin"

mkdir -p $BINDIR

cd $BINDIR

if [[ -e $BINDIR/.bootstrapped ]]; then
  exit 0
fi

PY_VERSION=3.6
PYPY_VERSION=7.2.0

wget -O - https://github.com/squeaky-pl/portable-pypy/releases/download/pypy${PY_VERSION}-${PYPY_VERSION}/pypy${PY_VERSION}-${PYPY_VERSION}-linux_x86_64-portable.tar.bz2 | tar -xjf -
mv -n pypy${PY_VERSION}-${PYPY_VERSION}-linux_x86_64-portable pypy3

ln -s ./pypy3/bin/pypy3 python
$BINDIR/python --version

touch $BINDIR/.bootstrapped
