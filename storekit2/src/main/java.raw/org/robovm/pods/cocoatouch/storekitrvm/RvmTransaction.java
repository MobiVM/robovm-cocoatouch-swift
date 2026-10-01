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
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmTransaction")/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmTransaction/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmTransactionPtr extends Ptr<RvmTransaction, RvmTransactionPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmTransaction.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmTransaction() {}
    protected RvmTransaction(Handle h, long handle) { super(h, handle); }
    protected RvmTransaction(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "jsonRepresentation")
    public native NSData getJsonRepresentation();
    @Property(selector = "id")
    public native long getId();
    @Property(selector = "originalID")
    public native long getOriginalID();
    @Property(selector = "webOrderLineItemID")
    public native String getWebOrderLineItemID();
    @Property(selector = "productID")
    public native String getProductID();
    @Property(selector = "subscriptionGroupID")
    public native String getSubscriptionGroupID();
    @Property(selector = "appBundleID")
    public native String getAppBundleID();
    @Property(selector = "purchaseDate")
    public native NSDate getPurchaseDate();
    @Property(selector = "originalPurchaseDate")
    public native NSDate getOriginalPurchaseDate();
    @Property(selector = "expirationDate")
    public native NSDate getExpirationDate();
    @Property(selector = "purchasedQuantity")
    public native @MachineSizedSInt long getPurchasedQuantity();
    @Property(selector = "isUpgraded")
    public native boolean isUpgraded();
    /**
     * @since Available in iOS 17.2 and later.
     */
    @Property(selector = "offer")
    public native RvmTransaction_Offer getOffer();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.2. 'offerType' has been renamed to 'offer.type': Use the offer property instead.
     */
    @Deprecated
    @Property(selector = "offerType")
    public native RvmTransaction_OfferType getOfferType();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.2. 'offerID' has been renamed to 'id': Use the offer property instead.
     */
    @Deprecated
    @Property(selector = "offerID")
    public native String getOfferID();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.2. 'offerPaymentModeStringRepresentation' has been renamed to 'offer.paymentMode.rawValue': Use the offer property instead.
     */
    @Deprecated
    @Property(selector = "offerPaymentModeStringRepresentation")
    public native String getOfferPaymentModeStringRepresentation();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 18.4. Use the offer property instead.
     */
    @Deprecated
    @Property(selector = "offerPeriodStringRepresentation")
    public native String getOfferPeriodStringRepresentation();
    @Property(selector = "revocationDate")
    public native NSDate getRevocationDate();
    @Property(selector = "revocationReason")
    public native RvmTransaction_RevocationReason getRevocationReason();
    /**
     * @since Available in iOS 26.4 and later.
     */
    @Property(selector = "revocationType")
    public native RvmTransaction_RevocationType getRevocationType();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 26.4. Use the revocationType property instead
     */
    @Deprecated
    @Property(selector = "revocationTypeStringRepresentation")
    public native String getRevocationTypeStringRepresentation();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "revocationPercentage")
    public native NSDecimalNumber getRevocationPercentage();
    @Property(selector = "productType")
    public native RvmProduct_ProductType getProductType();
    @Property(selector = "appAccountToken")
    public native NSUUID getAppAccountToken();
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
     * @since Available in iOS 17.0 and later.
     */
    @Property(selector = "reason")
    public native RvmTransaction_Reason getReason();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.0. Use the reason property instead
     */
    @Deprecated
    @Property(selector = "reasonStringRepresentation")
    public native String getReasonStringRepresentation();
    /**
     * @since Available in iOS 17.0 and later.
     */
    @Property(selector = "storefront")
    public native RvmStorefront getStorefront();
    @Property(selector = "storefrontCountryCode")
    public native String getStorefrontCountryCode();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "price")
    public native NSDecimalNumber getPrice();
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
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "bundleProductID")
    public native String getBundleProductID();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "bundleSubscriptionGroupID")
    public native String getBundleSubscriptionGroupID();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "previousOriginalTransactionID")
    public native NSNumber getPreviousOriginalTransactionID();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "bundleTransactionID")
    public native String getBundleTransactionID();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "bundleOriginalTransactionID")
    public native String getBundleOriginalTransactionID();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Property(selector = "appTransactionID")
    public native String getAppTransactionID();
    @Property(selector = "deviceVerification")
    public native NSData getDeviceVerification();
    @Property(selector = "deviceVerificationNonce")
    public native NSUUID getDeviceVerificationNonce();
    @Property(selector = "ownershipType")
    public native RvmTransaction_OwnershipType getOwnershipType();
    @Property(selector = "signedDate")
    public native NSDate getSignedDate();
    /**
     * @since Available in iOS 18.4 and later.
     */
    @Property(selector = "advancedCommerceInfo")
    public native RvmTransaction_AdvancedCommerceInfo getAdvancedCommerceInfo();
    /**
     * @since Available in iOS 26.4 and later.
     */
    @Property(selector = "billingPlanType")
    public native RvmProduct_SubscriptionInfo_BillingPlanType getBillingPlanType();
    /**
     * @since Available in iOS 26.4 and later.
     */
    @Property(selector = "commitmentInfo")
    public native RvmTransaction_CommitmentInfo getCommitmentInfo();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "finishWithCompletionHandler:")
    public native RvmTask finish(@Block Runnable completionHandler);
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "subscriptionStatusWithCompletionHandler:")
    public native RvmTask getSubscriptionStatus(@Block VoidBlock1<RvmProduct_SubscriptionInfo_Status> completionHandler);
    /**
     * @since Available in iOS 18.4 and later.
     */
    @Method(selector = "allFor:")
    public static native RvmAsyncSequence<RvmVerificationResult_Transaction> allFor(String productID);
    /**
     * @since Available in iOS 18.4 and later.
     */
    @Method(selector = "currentEntitlementsFor:")
    public static native RvmAsyncSequence<RvmVerificationResult_Transaction> currentEntitlementsFor(String productID);
    @Method(selector = "updates")
    public static native RvmAsyncSequence<RvmVerificationResult_Transaction> updates();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "beginRefundRequestIn:completionHandler:")
    public native RvmTask beginRefundRequest(UIWindowScene scene, @Block VoidBlock2<RvmTransaction_RefundRequestStatus, NSError> completionHandler);
    @Method(selector = "RefundRequestErrorDomain")
    public static native String RefundRequestErrorDomain();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "beginRefundRequestFor:in:completionHandler:")
    public static native RvmTask beginRefundRequest(long transactionID, UIWindowScene scene, @Block VoidBlock2<RvmTransaction_RefundRequestStatus, NSError> completionHandler);
    @Method(selector = "all")
    public static native RvmAsyncSequence<RvmVerificationResult_Transaction> all();
    @Method(selector = "currentEntitlements")
    public static native RvmAsyncSequence<RvmVerificationResult_Transaction> currentEntitlements();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 18.4. Use the currentEntitlements(for:) method instead.
     */
    @Deprecated
    @Method(selector = "currentEntitlementFor:completionHandler:")
    public static native RvmTask getCurrentEntitlement(String productID, @Block VoidBlock1<RvmVerificationResult_Transaction> completionHandler);
    @Method(selector = "latestFor:completionHandler:")
    public static native RvmTask getLatest(String productID, @Block VoidBlock1<RvmVerificationResult_Transaction> completionHandler);
    @Method(selector = "unfinished")
    public static native RvmAsyncSequence<RvmVerificationResult_Transaction> unfinished();
    /*</methods>*/
}
