#!/bin/bash

set -xeu

dist=bionic
#dist=focal

if ! test -d package ; then
  echo "Launched from wrong directory."
  exit 1
fi

artifacts='https://data.authpass.app/data/artifacts'

version=$(curl -s ${artifacts}/authpass-linux-latest.tar.gz.txt)
echo "version: $version"
origversion=$(echo ${version} | tr _ +)
debversion="${origversion}-1ubuntu1"
origarchive="authpass_${origversion}.orig.tar.gz"

if test -f "${origarchive}" ; then
  echo "Using existing file: ${origarchive}"
else
  curl -o "${origarchive}" ${artifacts}/authpass-linux-${version}.tar.gz
fi

pushd package

if grep -q -F "${debversion}" debian/changelog ; then
  echo "Version ${debversion} already exists. creating new one."
  dch -i -M -D ${dist} "Update deb package."
  debversion=$(dpkg-parsechangelog | grep Version | sed "s/.*: //")
else
  dch -M -v ${debversion} -D ${dist} "Update deb package."
fi


debuild -S

dput ppa:codeux.design/authpass "../authpass_${debversion}_source.changes"
