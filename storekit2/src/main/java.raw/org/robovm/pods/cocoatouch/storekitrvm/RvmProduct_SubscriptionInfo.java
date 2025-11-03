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
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmProduct_SubscriptionInfo/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmProduct_SubscriptionInfoPtr extends Ptr<RvmProduct_SubscriptionInfo, RvmProduct_SubscriptionInfoPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmProduct_SubscriptionInfo.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmProduct_SubscriptionInfo() {}
    protected RvmProduct_SubscriptionInfo(Handle h, long handle) { super(h, handle); }
    protected RvmProduct_SubscriptionInfo(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "introductoryOffer")
    public native RvmProduct_SubscriptionOffer getIntroductoryOffer();
    @Property(selector = "promotionalOffers")
    public native NSArray<RvmProduct_SubscriptionOffer> getPromotionalOffers();
    /**
     * @since Available in iOS 18.0 and later.
     */
    @Property(selector = "winBackOffers")
    public native NSArray<RvmProduct_SubscriptionOffer> getWinBackOffers();
    @Property(selector = "subscriptionGroupID")
    public native String getSubscriptionGroupID();
    @Property(selector = "subscriptionPeriod")
    public native RvmProduct_SubscriptionPeriod getSubscriptionPeriod();
    /**
     * @since Available in iOS 16.4 and later.
     */
    @Property(selector = "groupLevel")
    public native @MachineSizedSInt long getGroupLevel();
    /**
     * @since Available in iOS 16.4 and later.
     */
    @Property(selector = "groupDisplayName")
    public native String getGroupDisplayName();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "isEligibleForIntroOfferWithCompletionHandler:")
    public native RvmTask isEligibleForIntroOffer(@Block VoidBooleanBlock completionHandler);
    @Method(selector = "isEligibleForIntroOfferFor:completionHandler:")
    public static native RvmTask isEligibleForIntroOffer(String groupID, @Block VoidBooleanBlock completionHandler);
    @Method(selector = "statusWithCompletionHandler:")
    public native RvmTask getStatus(@Block VoidBlock2<NSArray<RvmProduct_SubscriptionInfo_Status>, NSError> completionHandler);
    @Method(selector = "statusFor:completionHandler:")
    public static native RvmTask getStatus(String groupID, @Block VoidBlock2<NSArray<RvmProduct_SubscriptionInfo_Status>, NSError> completionHandler);
    /*</methods>*/
}
