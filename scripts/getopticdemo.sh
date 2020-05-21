#!/bin/sh

npm config set unsafe-perm true
npm install @useoptic/cli@^8 -g

# git clone https://github.com/typicode/json-server.git
# just install json-server instead of building from scratch 
npm install json-server -g
