# CocoaTouch Bindings for StoreKit2 API

[**MobiVM**](https://github.com/MobiVM/robovm) -
[**bro-gen**](https://github.com/dkimitsa/robovm-bro-gen) -
[**bro-gen tutorial**](https://dkimitsa.github.io/2017/10/19/bro-gen-tutorial/) -
[**dkimitsa's dev blog**](https://dkimitsa.github.io/)

This repository provides CocoaTouch bindings for StoreKit API v18.2, which is accessible only via Swift code (commonly referred to as StoreKit2).  
References:  
- https://developer.apple.com/storekit/  
- https://developer.apple.com/documentation/storekit  

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
    implementation "com.mobidevelop.robovm:robopods-swift-storekit2:18.2.0.1"
}
```

API can be used in a way similar to Apple's documentation:

```java
Product.getProducts(NSArray.fromStrings("product.id.1"), (products, nsError) -> {
    if (nsError != null) {
        // handle error
        return;
    }
    // handle products
});
```

---

## Sample app
The port of [Apple's Implementing a store in your app using the StoreKit API](https://developer.apple.com/documentation/storekit/implementing-a-store-in-your-app-using-the-storekit-api) available as part of [alt-pods-tests](https://github.com/dkimitsa/alt-pods-tests) repository:  
https://github.com/dkimitsa/alt-pods-tests/tree/master/cocoatouch-swift-storekit

---

# Hacking/Extending the Bindings (upgrading to a new version)

## Background 

RoboVM can access external or native libraries using the `bro-bridge`. Objective-C interoperability is available via the [Objective-C Runtime](https://developer.apple.com/documentation/objectivec/objective-c_runtime?language=objc), but there is no equivalent mechanism for Swift.  
Other ecosystems face similar limitations:

[Kotlin](https://kotlinlang.org/docs/native-objc-interop.html#usage):
> A Swift library can be used in Kotlin code if its API is exported to Objective-C with @objc. Pure Swift modules are not yet supported.

[Xamarin](https://learn.microsoft.com/en-us/previous-versions/xamarin/ios/platform/binding-swift/walkthrough)
> If the header doesn't exist or has an incomplete public interface (for example, you don't see classes/members) you have two options:
> -Update the Swift source code to generate the header and mark the required members with @objc attribute
> - Build a proxy framework where you control the public interface and proxy all the calls to underlying framework

## Approach
StoreKit2 -> StoreKitRvm -> StoreKitRvm.java-raw -> StoreKitRvm.java -> StoreKitRvm.kotlin

### Building from Source
Both Maven and Xcode are required.  
Build the project with:

```bash
mvn clean install
```

This will create `StoreKitRvm.xcframework`, and copy it to the `res` folder, and install the artifact into the local Maven repository.

### StoreKitRvm

To make StoreKit2 accessible, it must be wrapped in Objective-C at the native level. This is implemented as `StoreKitRvm.xcframework`.  
The [source code](src/main/native/) can be built using [build.sh](src/main/native/build.sh):

- Running `build.sh` without arguments keeps the `Headers` folder, which is required for building `StoreKitRvm.java-raw`.
- Running `build.sh -strip` removes the `Headers` and `Modules` folders to reduce footprint.

### StoreKitRvm.java-raw

The native Objective-C `StoreKitRvm.xcframework` is bound to a Java API using `bro-gen`.  
Run the following command from the `storekit/src/main/bro-gen` directory:

```bash
${path_to_bro_gen}/bro-gen.rb ../java.raw storekitrvm.yaml
```

The result is Java code in `src/main/java.raw`.  
Since `bro-gen` has limitations and cannot produce an internal class hierarchy, the generated code is treated as raw output and then manually restructured into a proper hierarchy. For example:

```java
public class RvmProduct_SubscriptionInfo_RenewalInfo_ExpirationReason {
} 
```

is transformed into:

```java
public class Product {
    public static class SubscriptionInfo {
        public static class RenewalInfo {
            public static class ExpirationReason {

            }
        }
    }
}
```

This structure mirrors the hierarchy of the original Swift StoreKit API.

Another purpose of `java.raw` is to monitor changes when `StoreKitRvm.xcframework` is updated and bindings are regenerated, allowing corresponding updates to be applied to the final manual Java code.

### StoreKitRvm.java

This file contains the manually structured and cleaned-up code from `java.raw`.  
It is compiled into the artifact and serves as the final public API.
