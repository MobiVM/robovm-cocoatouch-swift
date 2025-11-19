# CocoaTouch Bindings for Declared Age Range API

[**MobiVM**](https://github.com/MobiVM/robovm) -
[**bro-gen**](https://github.com/dkimitsa/robovm-bro-gen) -
[**bro-gen tutorial**](https://dkimitsa.github.io/2017/10/19/bro-gen-tutorial/) -
[**dkimitsa's dev blog**](https://dkimitsa.github.io/)

This repository provides CocoaTouch bindings for StoreKit API v18.2, which is accessible only via Swift code (commonly referred to as StoreKit2).  
References:  
- https://developer.apple.com/documentation/declaredagerange/
- https://developer.apple.com/forums/tags/declared-age-range  

---

## How to Use

### Snapshot Builds

Snapshots are deployed to the Sonatype snapshot repository.  
Add the following repository to your `build.gradle` file:

```groovy
repositories {
    maven { url 'https://central.sonatype.com/repository/maven-snapshots' }
}
```

### Dependencies

The bindings are available as the following artifact:

```groovy
dependencies {
    implementation "com.mobidevelop.robovm:robopods-swift-declaredagerange:26.1.0.0"
}
```

### Code sample

`com.apple.developer.declared-age-range` [has to be added](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.declared-age-range?language=objc) to entitlement list:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>com.apple.developer.declared-age-range</key>
        <true/>
    </dict>
</plist>
```

Entitlement file has to be configured in `robovm.xml`:
```xml
<config>
    ...
    <iosEntitlementsPList>Entitlements.plist.xml</iosEntitlementsPList>
</config>
```

API can be used in a way similar to Apple's documentation:

```java
AgeRangeService.shared().requestAgeRange(
    10, null, null, this,
    (response, nsError) -> {
        if (response != null) {
            System.out.println("resp: " + response);
        } else {
            System.out.println("err: " + nsError);
        }
    }
);
```
