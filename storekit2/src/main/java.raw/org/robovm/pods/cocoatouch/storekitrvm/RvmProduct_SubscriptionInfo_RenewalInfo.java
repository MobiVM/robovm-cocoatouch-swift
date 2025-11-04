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
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmProduct_SubscriptionInfo_RenewalInfo/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmProduct_SubscriptionInfo_RenewalInfoPtr extends Ptr<RvmProduct_SubscriptionInfo_RenewalInfo, RvmProduct_SubscriptionInfo_RenewalInfoPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmProduct_SubscriptionInfo_RenewalInfo.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmProduct_SubscriptionInfo_RenewalInfo() {}
    protected RvmProduct_SubscriptionInfo_RenewalInfo(Handle h, long handle) { super(h, handle); }
    protected RvmProduct_SubscriptionInfo_RenewalInfo(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "jsonRepresentation")
    public native NSData getJsonRepresentation();
    @Property(selector = "originalTransactionID")
    public native long getOriginalTransactionID();
    @Property(selector = "currentProductID")
    public native String getCurrentProductID();
    @Property(selector = "willAutoRenew")
    public native boolean isWillAutoRenew();
    @Property(selector = "autoRenewPreference")
    public native String getAutoRenewPreference();
    @Property(selector = "expirationReason")
    public native RvmProduct_SubscriptionInfo_RenewalInfo_ExpirationReason getExpirationReason();
    @Property(selector = "priceIncreaseStatus")
    public native RvmProduct_SubscriptionInfo_RenewalInfo_PriceIncreaseStatus getPriceIncreaseStatus();
    @Property(selector = "isInBillingRetry")
    public native boolean isInBillingRetry();
    @Property(selector = "gracePeriodExpirationDate")
    public native NSDate getGracePeriodExpirationDate();
    /**
     * @since Available in iOS 18.0 and later.
     */
    @Property(selector = "offer")
    public native RvmTransaction_Offer getOffer();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 18.0. 'offerID' has been renamed to 'offer.id': Use the offer property instead
     */
    @Deprecated
    @Property(selector = "offerID")
    public native String getOfferID();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 18.0. 'offerType' has been renamed to 'offer.type': Use the offer property instead
     */
    @Deprecated
    @Property(selector = "offerType")
    public native RvmTransaction_OfferType getOfferType();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 18.0. 'offerPaymentModeStringRepresentation' has been renamed to 'offer.paymentMode.rawValue': Use the offer property instead
     */
    @Deprecated
    @Property(selector = "offerPaymentModeStringRepresentation")
    public native String getOfferPaymentModeStringRepresentation();
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Property(selector = "environment")
    public native RvmAppStore_Environment getEnvironment();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 16.0. Use the environment property instead
     */
    @Deprecated
    @Property(selector = "environmentStringRepresentation")
    public native String getEnvironmentStringRepresentation();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "recentSubscriptionStartDate")
    public native NSDate getRecentSubscriptionStartDate();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "renewalDate")
    public native NSDate getRenewalDate();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "renewalPrice")
    public native NSDecimalNumber getRenewalPrice();
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Property(selector = "currencyIdentifier")
    public native String getCurrencyIdentifier();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 16.0. 'currencyCode' has been renamed to 'currency.identifier': Use the currency property instead
     */
    @Deprecated
    @Property(selector = "currencyCode")
    public native String getCurrencyCode();
    /**
     * @since Available in iOS 18.0 and later.
     */
    @Property(selector = "eligibleWinBackOfferIDs")
    public native NSArray<NSString> getEligibleWinBackOfferIDs();
    @Property(selector = "deviceVerification")
    public native NSData getDeviceVerification();
    @Property(selector = "deviceVerificationNonce")
    public native NSUUID getDeviceVerificationNonce();
    @Property(selector = "signedDate")
    public native NSDate getSignedDate();
    @Property(selector = "debugDescription")
    public native String getDebugDescription();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    
    /*</methods>*/
}
