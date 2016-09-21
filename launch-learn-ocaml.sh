#!/bin/sh

rm -rf www
mkdir www
if [ -d platform ]
then
    cd platform
    git pull
    source install-opam-deps.sh
else
    git clone https://github.com/OCamlPro/learn-ocaml.git platform
    cd platform
    source install-opam-deps.sh
fi
make DEST_DIR=../www REPO_DIR=../ PROCESSING_JOBS=1
