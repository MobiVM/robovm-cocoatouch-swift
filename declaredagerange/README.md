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
