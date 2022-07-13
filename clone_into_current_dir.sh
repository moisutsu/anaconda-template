#!/bin/bash -eu

git clone https://github.com/moisutsu/anaconda-template
mv anaconda-template/{scripts,Makefile} .
rm -rf anaconda-template
