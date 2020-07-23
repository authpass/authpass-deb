#!/bin/bash

set -xeu

version=$(curl -s https://data.authpass.app/data/artifacts/authpass-linux-latest.tar.gz.txt)
echo "version: $version"

echo dch -v ${version}
