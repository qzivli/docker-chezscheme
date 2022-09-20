#!/usr/bin/env bash

git clone https://github.com/cisco/ChezScheme.git
cd ChezScheme
git checkout
git pull
git submodule init
git submodule update

cd ..

# Ignore .git without delete it.
rm -rf ChezScheme.docker
mkdir -p ChezScheme.docker
cp -r ChezScheme/* ChezScheme.docker/

time docker build -t "qzivli/chezscheme" .

