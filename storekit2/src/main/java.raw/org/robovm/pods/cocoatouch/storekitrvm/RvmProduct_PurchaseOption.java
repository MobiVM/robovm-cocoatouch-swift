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

/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmProduct_PurchaseOption/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmProduct_PurchaseOptionPtr extends Ptr<RvmProduct_PurchaseOption, RvmProduct_PurchaseOptionPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmProduct_PurchaseOption.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmProduct_PurchaseOption() {}
    protected RvmProduct_PurchaseOption(Handle h, long handle) { super(h, handle); }
    protected RvmProduct_PurchaseOption(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "debugDescription")
    public native String getDebugDescription();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "appAccountToken:")
    public static native RvmProduct_PurchaseOption appAccountToken(NSUUID token);
    @Method(selector = "customStringWithKey:value:")
    public static native RvmProduct_PurchaseOption customString(String key, String value);
    @Method(selector = "customNumberWithKey:value:")
    public static native RvmProduct_PurchaseOption customNumber(String key, double value);
    @Method(selector = "customBoolWithKey:value:")
    public static native RvmProduct_PurchaseOption customBool(String key, boolean value);
    @Method(selector = "customDataWithKey:value:")
    public static native RvmProduct_PurchaseOption customData(String key, NSData value);
    @Method(selector = "onStorefrontChangeWithShouldContinuePurchase:")
    public static native RvmProduct_PurchaseOption onStorefrontChange(@Block Block1<RvmStorefront, Boolean> shouldContinuePurchase);
    @Method(selector = "promotionalOfferWithOfferID:keyID:nonce:signature:timestamp:")
    public static native RvmProduct_PurchaseOption promotionalOffer(String offerID, String keyID, NSUUID nonce, NSData signature, @MachineSizedSInt long timestamp);
    /**
     * @since Available in iOS 17.4 and later.
     */
    @Method(selector = "promotionalOfferWithOfferID:signature:")
    public static native RvmProduct_PurchaseOption promotionalOffer(String offerID, RvmProduct_SubscriptionInfo_Signature signature);
    @Method(selector = "quantity:")
    public static native RvmProduct_PurchaseOption quantity(@MachineSizedSInt long quantity);
    @Method(selector = "simulatesAskToBuyInSandbox:")
    public static native RvmProduct_PurchaseOption simulatesAskToBuyInSandbox(boolean simulateAskToBuy);
    /**
     * @since Available in iOS 18.0 and later.
     */
    @Method(selector = "winBackOffer:")
    public static native RvmProduct_PurchaseOption winBackOffer(RvmProduct_SubscriptionOffer offer);
    /*</methods>*/
}
