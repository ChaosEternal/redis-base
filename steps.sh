#!/bin/bash -e

mkdir -p ~/workspace/redis2-release
cd ~/workspace/redis2-release
~/workspace/bosh-generator/init-release.sh ./ 1 redis
cp -r ~/workspace/redis-base/* ./
~/workspace/bosh-generator/init-package.sh ./ 
~/workspace/bosh-generator/init-job.sh ./ 
~/workspace/bosh-generator/init-manifest.sh ./ 
~/workspace/bosh-generator/tile.sh ./
~/workspace/bosh-generator/init-manifest.sh ./ odb
~/workspace/bosh-generator/tile.sh ./
