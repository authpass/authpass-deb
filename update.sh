#!/bin/bash

set -xeu

if ! test -d package ; then
  echo "Launched from wrong directory."
  exit 1
fi

artifacts='https://data.authpass.app/data/artifacts'

version=$(curl -s ${artifacts}/authpass-linux-latest.tar.gz.txt)
echo "version: $version"
debversion=$(echo ${version} | tr _ +)
debarchive="authpass_${debversion}.orig.tar.gz"

if test -f "${debarchive}" ; then
  echo "Using existing file: ${debarchive}"
else
  curl -o "${debarchive}" ${artifacts}/authpass-linux-${version}.tar.gz
fi

pushd package

dch -M -v ${debversion} -D bionic "Update deb package."
