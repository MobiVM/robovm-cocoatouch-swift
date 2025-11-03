/*
 * Copyright (C) 2025 The MobiVM Contributors
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.robovm.pods.cocoatouch.storekitrvm;

/*<imports>*/
import java.io.*;
import java.nio.*;
import java.util.*;
import org.robovm.objc.*;
import org.robovm.objc.annotation.*;
import org.robovm.objc.block.*;
import org.robovm.rt.*;
import org.robovm.rt.annotation.*;
import org.robovm.rt.bro.*;
import org.robovm.rt.bro.annotation.*;
import org.robovm.rt.bro.ptr.*;
import org.robovm.apple.foundation.*;
import org.robovm.apple.uikit.*;
import org.robovm.apple.coregraphics.*;
import org.robovm.apple.coreanimation.*;
/*</imports>*/

/*<javadoc>*/
/**
 * @since Available in iOS 15.0 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmProduct")/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmProduct/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmProductPtr extends Ptr<RvmProduct, RvmProductPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmProduct.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmProduct() {}
    protected RvmProduct(Handle h, long handle) { super(h, handle); }
    protected RvmProduct(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "jsonRepresentation")
    public native NSData getJsonRepresentation();
    @Property(selector = "id")
    public native String getId();
    @Property(selector = "type")
    public native RvmProduct_ProductType getType();
    @Property(selector = "displayName")
    public native String getDisplayName();
    @Property(selector = "productDescription")
    public native String getProductDescription();
    @Property(selector = "price")
    public native NSDecimalNumber getPrice();
    @Property(selector = "displayPrice")
    public native String getDisplayPrice();
    @Property(selector = "isFamilyShareable")
    public native boolean isFamilyShareable();
    @Property(selector = "subscription")
    public native RvmProduct_SubscriptionInfo getSubscription();
    @Property(selector = "priceFormatStyle")
    public native RvmFormatStyle_Currency getPriceFormatStyle();
    @Property(selector = "debugDescription")
    public native String getDebugDescription();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "productsFor:completionHandler:")
    public static native RvmTask getProducts(NSArray<NSString> identifiers, @Block VoidBlock2<NSArray<RvmProduct>, NSError> completionHandler);
    @Method(selector = "latestTransactionWithCompletionHandler:")
    public native RvmTask getLatestTransaction(@Block VoidBlock1<RvmVerificationResult_Transaction> completionHandler);
    @Method(selector = "currentEntitlementWithCompletionHandler:")
    public native RvmTask getCurrentEntitlement(@Block VoidBlock1<RvmVerificationResult_Transaction> completionHandler);
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "purchaseWithOptions:completionHandler:")
    public native RvmTask purchase(NSSet<RvmProduct_PurchaseOption> options, @Block VoidBlock2<RvmProduct_PurchaseResult, NSError> completionHandler);
    /**
     * @since Available in iOS 17.0 and later.
     */
    @Method(selector = "purchaseWithConfirmIn:options:completionHandler:")
    public native RvmTask purchase(UIScene scene, NSSet<RvmProduct_PurchaseOption> options, @Block VoidBlock2<RvmProduct_PurchaseResult, NSError> completionHandler);
    /**
     * @since Available in iOS 18.2 and later.
     */
    @Method(selector = "purchaseWithConfirmInVc:options:completionHandler:")
    public native RvmTask purchase(UIViewController viewController, NSSet<RvmProduct_PurchaseOption> options, @Block VoidBlock2<RvmProduct_PurchaseResult, NSError> completionHandler);
    @Method(selector = "PurchaseErrorDomain")
    public static native String PurchaseErrorDomain();
    /*</methods>*/
}
