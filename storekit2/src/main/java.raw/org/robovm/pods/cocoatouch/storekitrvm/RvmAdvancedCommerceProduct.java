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
 * @since Available in iOS 18.4 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmAdvancedCommerceProduct/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmAdvancedCommerceProductPtr extends Ptr<RvmAdvancedCommerceProduct, RvmAdvancedCommerceProductPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmAdvancedCommerceProduct.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmAdvancedCommerceProduct() {}
    protected RvmAdvancedCommerceProduct(Handle h, long handle) { super(h, handle); }
    protected RvmAdvancedCommerceProduct(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "id")
    public native String getId();
    @Property(selector = "type")
    public native RvmProduct_ProductType getType();
    @Property(selector = "allTransactions")
    public native RvmAsyncSequence<RvmVerificationResult_Transaction> getAllTransactions();
    @Property(selector = "currentEntitlements")
    public native RvmAsyncSequence<RvmVerificationResult_Transaction> getCurrentEntitlements();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "createWithId:completionHandler:")
    public static native RvmTask create(String id, @Block VoidBlock2<RvmAdvancedCommerceProduct, NSError> completionHandler);
    /**
     * @since Available in iOS 18.4 and later.
     */
    @Method(selector = "purchaseWithCompactJWS:confirmIn:options:completionHandler:")
    public native RvmTask purchase(String compactJWS, UIViewController viewController, NSSet<RvmAdvancedCommerceProduct_PurchaseOption> options, @Block VoidBlock2<RvmProduct_PurchaseResult, NSError> completionHandler);
    @Method(selector = "latestTransactionWithCompletionHandler:")
    public native RvmTask getLatestTransaction(@Block VoidBlock1<RvmVerificationResult_Transaction> completionHandler);
    /*</methods>*/
}
