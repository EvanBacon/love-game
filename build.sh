!#/bin/bash
rm -rf dist/*
mkdir dist
zip -9 -r dist/superlove.love . -x "tiled-linux-64bit-snapshot/*" "dist/*" ".git/*"

