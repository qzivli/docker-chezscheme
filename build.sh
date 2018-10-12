#!/bin/sh -

# It's difficult to finish git clone in China, :-(

git clone https://github.com/cisco/ChezScheme.git
cd ChezScheme
git checkout
git submodule init
git submodule update

cd ..
docker build -t "qzivli/chezscheme" .

