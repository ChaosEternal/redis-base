#!/bin/bash -e

mkdir -p ~/workspace/redis2-release
cd ~/workspace/redis2-release
~/workspace/bosh-generator/init-release.sh ./ 1 redis
cp -r ~/workspace/redis-base/* ./
~/workspace/bosh-generator/init-package.sh ./ 
~/workspace/bosh-generator/init-job.sh ./ 
./update-release.sh
~/workspace/bosh-generator/init-manifest.sh ./ 
bosh2 -e vbox update-cloud-config ./manifests/bosh_lite_cloud_config.yml
bosh2 -e vbox -d redis-deployment deploy ./manifests/bosh_lite_manifest.yml

#~/workspace/bosh-generator/tile.sh ./
#~/workspace/bosh-generator/init-manifest.sh ./ odb
#~/workspace/bosh-generator/tile.sh ./
