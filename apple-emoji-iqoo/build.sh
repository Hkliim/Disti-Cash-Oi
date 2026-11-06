#!/bin/sh
# Construit le zip flashable : ./build.sh -> AppleEmoji-iQOO-Z9Turbo.zip
cd "$(dirname "$0")/module" && rm -f ../AppleEmoji-iQOO-Z9Turbo.zip && zip -r9 ../AppleEmoji-iQOO-Z9Turbo.zip . -x '.*'
