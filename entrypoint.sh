#!/bin/bash

set -eo pipefail

git config --global user.email "rokibhasansagar2014@outlook.com"
git config --global user.name "rokibhasansagar"
git config --global color.ui true

git clone -q "https://${GitAllOAuth}@github.com/rokibhasansagar/google-git-cookies.git"
bash google-git-cookies/setup_cookies.sh && rm -rf google-git-cookies

mkdir $(pwd)/pbrp && cd pbrp/

repo init -q -u https://github.com/PitchBlackRecoveryProject/manifest_pb.git -b "twrp-6.0" --depth 1
time repo sync -c -q --force-sync --no-clone-bundle --no-tags -j32

rm -rf device/qcom/ && rm -rf hardware/qcom/ && rm -rf device/generic/

git clone https://github.com/PitchBlackRecoveryProject/android_device_WALTON_Primo_RX5 device/WALTON/Primo_RX5

export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch omni_Primo_RX5-userdebug

make -j32 recoveryimage

echo $(pwd)

mkdir release

ls out/target/product/Primo_RX5/
cp out/target/product/Primo_RX5/recovery.img release/
cp out/target/product/Primo_RX5/PitchBlack-Go-Primo_RX5-2.9.0-20191212-1142-UNOFFICIAL.zip release/

which ghr
ghr -t ${GitAllOAuth} -n "Test Release for Primo_RX5" -b "PBRP v2.9.0" -delete v1.0-test release/
