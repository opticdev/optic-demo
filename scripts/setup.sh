#!/bin/sh

apk add --update nodejs npm
apk add python make g++

# assure latest npm is installed with global update
npm install -g npm
