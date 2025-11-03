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
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmAppStore/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmAppStorePtr extends Ptr<RvmAppStore, RvmAppStorePtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmAppStore.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmAppStore() {}
    protected RvmAppStore(Handle h, long handle) { super(h, handle); }
    protected RvmAppStore(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "canMakePayments")
    public static native boolean canMakePayments();
    @Method(selector = "deviceVerificationID")
    public static native NSUUID deviceVerificationID();
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Method(selector = "requestReviewIn:")
    public static native void requestReviewIn(UIWindowScene scene);
    @Method(selector = "syncWithCompletionHandler:")
    public static native RvmTask sync(@Block VoidBlock1<NSError> completionHandler);
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Method(selector = "presentOfferCodeRedeemSheetIn:completionHandler:")
    public static native RvmTask presentOfferCodeRedeemSheet(UIWindowScene scene, @Block VoidBlock1<NSError> completionHandler);
    @Method(selector = "StoreKitErrorDomain")
    public static native String StoreKitErrorDomain();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "showManageSubscriptionsIn:completionHandler:")
    public static native RvmTask showManageSubscriptions(UIWindowScene scene, @Block VoidBlock1<NSError> completionHandler);
    /**
     * @since Available in iOS 17.0 and later.
     */
    @Method(selector = "showManageSubscriptionsIn:subscriptionGroupID:completionHandler:")
    public static native RvmTask showManageSubscriptions(UIWindowScene scene, String subscriptionGroupID, @Block VoidBlock1<NSError> completionHandler);
    /*</methods>*/
}
