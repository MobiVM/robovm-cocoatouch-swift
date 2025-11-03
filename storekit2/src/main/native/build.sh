#!/bin/sh
set -e

# clean up
rm -rf build
rm -rf ../robopods/META-INF/robovm/ios/libs/StoreKitRvm.xcframework

xcodebuild -configuration Release -sdk iphoneos -scheme StoreKitRvm build \
         STRIP_INSTALLED_PRODUCT=YES \
         DEPLOYMENT_POSTPROCESSING=YES \
         OTHER_SWIFT_FLAGS="-whole-module-optimization" \
         DEAD_CODE_STRIPPING=YES \
         ENABLE_BITCODE=NO \
         CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO \
         CONFIGURATION_BUILD_DIR=build/target-ios
xcodebuild -configuration Release -sdk iphonesimulator -scheme StoreKitRvm build \
         STRIP_INSTALLED_PRODUCT=YES \
         DEPLOYMENT_POSTPROCESSING=YES \
         OTHER_SWIFT_FLAGS="-whole-module-optimization" \
         DEAD_CODE_STRIPPING=YES \
         ENABLE_BITCODE=NO \
         CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO \
         CONFIGURATION_BUILD_DIR=build/target-ios-sim

if [ "$1" = '-strip' ]; then
   # remove modules folders (not required for robo
   rm -rf build/target-ios/StoreKitRvm.framework/Modules
   rm -rf build/target-ios/StoreKitRvm.framework/Headers
   rm -rf build/target-ios-sim/StoreKitRvm.framework/Modules
   rm -rf build/target-ios-sim/StoreKitRvm.framework/Headers
fi

xcodebuild -create-xcframework \
    -framework "build/target-ios-sim/StoreKitRvm.framework" \
    -framework "build/target-ios/StoreKitRvm.framework" \
    -output "../robopods/META-INF/robovm/ios/libs/StoreKitRvm.xcframework"


rm -rf build
