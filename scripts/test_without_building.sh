#!/bin/sh
xcodebuild test-without-building -xctestrun build/Build/Products/LoginUITests_iphonesimulator11.1-x86_64.xctestrun \
-destination "platform=iOS Simulator,name=iPhone 6,OS=11.1"
