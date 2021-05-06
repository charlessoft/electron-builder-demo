#!/bin/bash
node hash.js > /tmp/1.txt
stat -c "%s" SmartConnect.exe > /tmp/filesize.txt
export RES=`cat /tmp/1.txt`
export FILESIZE=`cat /tmp/filesize.txt`
sed -i -e 's|sha512:.*|sha512: '"${RES}"'|g' -e 's|size:.*|size: '"${FILESIZE}"'|g' -e 's|url:.*|url: SmartConnect.exe|g' -e 's|path:.*|path: SmartConnect.exe|g' ../dist_electron/latest.yml

