#!/bin/bash

ARCH=""

if [ $# -eq 0 ]; then
    ARCH="x86_64"
    ARCH="arm64"
fi

echo "Building with arch: ${ARCH}"

set -o pipefail && arch -"${ARCH}" xcodebuild -workspace CodeEdit.xcworkspace \
           -scheme CodeEdit \
           -destination "platform=OS X,arch=${ARCH}" \
           clean test | xcpretty
