#!/bin/sh
xcodebuild -project Login.xcodeproj -scheme LoginUITests -sdk iphonesimulator -destination \
"platform=iOS Simulator,name=iPhone 6,OS=11.1" build-for-testing -derivedDataPath "build"
