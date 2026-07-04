#!/bin/sh
set -e

# clean up
rm -rf build
rm -rf ../robopods/META-INF/robovm/ios/libs/DeclaredAgeRangeRvm.xcframework

xcodebuild -configuration Release -sdk iphoneos -scheme DeclaredAgeRangeRvm build \
         STRIP_INSTALLED_PRODUCT=YES \
         DEPLOYMENT_POSTPROCESSING=YES \
         OTHER_SWIFT_FLAGS="-whole-module-optimization" \
         DEAD_CODE_STRIPPING=YES \
         ENABLE_BITCODE=NO \
         CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO \
         CONFIGURATION_BUILD_DIR=build/target-ios
xcodebuild -configuration Release -sdk iphonesimulator -scheme DeclaredAgeRangeRvm build \
         STRIP_INSTALLED_PRODUCT=YES \
         DEPLOYMENT_POSTPROCESSING=YES \
         OTHER_SWIFT_FLAGS="-whole-module-optimization" \
         DEAD_CODE_STRIPPING=YES \
         ENABLE_BITCODE=NO \
         CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO \
         CONFIGURATION_BUILD_DIR=build/target-ios-sim

if [ "$1" = '-strip' ]; then
   # remove modules folders (not required for robo
   rm -rf build/target-ios/DeclaredAgeRangeRvm.framework/Modules
   rm -rf build/target-ios/DeclaredAgeRangeRvm.framework/Headers
   rm -rf build/target-ios-sim/DeclaredAgeRangeRvm.framework/Modules
   rm -rf build/target-ios-sim/DeclaredAgeRangeRvm.framework/Headers
fi

xcodebuild -create-xcframework \
    -framework "build/target-ios-sim/DeclaredAgeRangeRvm.framework" \
    -framework "build/target-ios/DeclaredAgeRangeRvm.framework" \
    -output "../robopods/META-INF/robovm/ios/libs/DeclaredAgeRangeRvm.xcframework"


rm -rf build
