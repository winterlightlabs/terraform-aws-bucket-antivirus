#!/usr/bin/env bash
set -e

GIT_DIR=~/bucket-antivirus-function

rm -rf $GIT_DIR

git clone https://github.com/winterlightlabs/bucket-antivirus-function.git $GIT_DIR

cd $GIT_DIR
git checkout $REVISION

container_dir=/opt/app

rm -rf bin/
rm -rf build/

make archive
