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


import org.robovm.apple.foundation.*;
import org.robovm.apple.uikit.UIWindowScene;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.VoidBlock1;
import org.robovm.objc.block.VoidBlock2;
import org.robovm.rt.annotation.StronglyLinked;
import org.robovm.rt.bro.Bro;
import org.robovm.rt.bro.ValuedEnum;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.annotation.MachineSizedSInt;
import org.robovm.rt.bro.annotation.Pointer;
import org.robovm.rt.bro.ptr.Ptr;



/**
 * @since Available in iOS 15.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmTransaction")
public class Transaction extends NSObject {

    public static class TransactionPtr extends Ptr<Transaction, TransactionPtr> {}
    static { ObjCRuntime.bind(Transaction.class); }

    protected Transaction() {}
    protected Transaction(Handle h, long handle) { super(h, handle); }
    protected Transaction(SkipInit skipInit) { super(skipInit); }
    
    
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
    public native Offer getOffer();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.2. 'offerType' has been renamed to 'offer.type': Use the offer property instead
     */
    @Deprecated
    @Property(selector = "offerType")
    public native OfferType getOfferType();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.2. 'offerID' has been renamed to 'id': Use the offer property instead
     */
    @Deprecated
    @Property(selector = "offerID")
    public native String getOfferID();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.2. 'offerPaymentModeStringRepresentation' has been renamed to 'offer.paymentMode.rawValue': Use the offer property instead
     */
    @Deprecated
    @Property(selector = "offerPaymentModeStringRepresentation")
    public native String getOfferPaymentModeStringRepresentation();
    @Property(selector = "revocationDate")
    public native NSDate getRevocationDate();
    @Property(selector = "revocationReason")
    public native RevocationReason getRevocationReason();
    @Property(selector = "productType")
    public native Product.ProductType getProductType();
    @Property(selector = "appAccountToken")
    public native NSUUID getAppAccountToken();
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Property(selector = "environment")
    public native AppStore.Environment getEnvironment();
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
    public native Reason getReason();
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
    public native Storefront getStorefront();
    /**
     * @since Available in iOS 15.0 and later.
     * @deprecated Deprecated in iOS 17.0. Use the storefront property instead
     */
    @Deprecated
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
    @Property(selector = "deviceVerification")
    public native NSData getDeviceVerification();
    @Property(selector = "deviceVerificationNonce")
    public native NSUUID getDeviceVerificationNonce();
    @Property(selector = "ownershipType")
    public native OwnershipType getOwnershipType();
    @Property(selector = "signedDate")
    public native NSDate getSignedDate();
    @Property(selector = "debugDescription")
    public native String getDebugDescription();
    
    @Method(selector = "finishWithCompletionHandler:")
    public native Task finish(@Block Runnable completionHandler);
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "subscriptionStatusWithCompletionHandler:")
    public native Task getSubscriptionStatus(@Block VoidBlock1<Product.SubscriptionInfo.Status> completionHandler);
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "beginRefundRequestIn:completionHandler:")
    public native Task beginRefundRequest(UIWindowScene scene, @Block VoidBlock2<RefundRequestStatus, NSError> completionHandler);
    @Method(selector = "RefundRequestErrorDomain")
    public static native String RefundRequestErrorDomain();
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "beginRefundRequestFor:in:completionHandler:")
    public static native Task beginRefundRequest(long transactionID, UIWindowScene scene, @Block VoidBlock2<RefundRequestStatus, NSError> completionHandler);
    @Method(selector = "all")
    public static native AsyncSequence<VerificationResult.Transaction> all();
    @Method(selector = "currentEntitlements")
    public static native AsyncSequence<VerificationResult.Transaction> currentEntitlements();
    @Method(selector = "currentEntitlementFor:completionHandler:")
    public static native Task getCurrentEntitlement(String productID, @Block VoidBlock1<VerificationResult.Transaction> completionHandler);
    @Method(selector = "latestFor:completionHandler:")
    public static native Task getLatest(String productID, @Block VoidBlock1<VerificationResult.Transaction> completionHandler);
    @Method(selector = "unfinished")
    public static native AsyncSequence<VerificationResult.Transaction> unfinished();
    @Method(selector = "updates")
    public static native AsyncSequence<VerificationResult.Transaction> updates();


    /**
     * @since Available in iOS 17.2 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmTransaction_Offer")
    public static class Offer extends NSObject   {
        public static class OfferPtr extends Ptr<Offer, OfferPtr> {}
        static { ObjCRuntime.bind(Offer.class); }

        protected Offer() {}
        protected Offer(Handle h, long handle) { super(h, handle); }
        protected Offer(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "id")
        public native String getId();
        @Property(selector = "type")
        public native OfferType getType();
        @Property(selector = "paymentMode")
        public native PaymentMode getPaymentMode();

        @Library(Library.INTERNAL) @NativeClass("RvmTransaction_Offer_PaymentMode")
        public static class PaymentMode extends NSObject {
            public static class PaymentModePtr extends Ptr<PaymentMode, PaymentModePtr> {}
            static { ObjCRuntime.bind(PaymentMode.class); }

            protected PaymentMode() {}
            protected PaymentMode(Handle h, long handle) { super(h, handle); }
            protected PaymentMode(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "rawValue")
            public native String getRawValue();

            @Method(selector = "freeTrial")
            public static native PaymentMode freeTrial();
            @Method(selector = "payAsYouGo")
            public static native PaymentMode payAsYouGo();
            @Method(selector = "payUpFront")
            public static native PaymentMode payUpFront();
        }
    }

    @Library(Library.INTERNAL) @NativeClass("RvmTransaction_OfferType")
    public static class OfferType extends NSObject {
        public static class OfferTypePtr extends Ptr<OfferType, OfferTypePtr> {}
        static { ObjCRuntime.bind(OfferType.class); }

        protected OfferType() {}
        protected OfferType(Handle h, long handle) { super(h, handle); }
        protected OfferType(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "rawValue")
        public native @MachineSizedSInt long getRawValue();

        @Method(selector = "introductory")
        public static native OfferType introductory();
        @Method(selector = "promotional")
        public static native OfferType promotional();
        @Method(selector = "code")
        public static native OfferType code();
        @Method(selector = "winBack")
        public static native OfferType winBack();
    }

    @Library(Library.INTERNAL) @NativeClass("RvmTransaction_OwnershipType")
    public static class OwnershipType extends NSObject {
        public static class OwnershipTypePtr extends Ptr<OwnershipType, OwnershipTypePtr> {}
        static { ObjCRuntime.bind(OwnershipType.class); }

        protected OwnershipType() {}
        protected OwnershipType(Handle h, long handle) { super(h, handle); }
        protected OwnershipType(SkipInit skipInit) { super(skipInit); }
        @Method(selector = "initWithRawValue:")
        public OwnershipType(String rawValue) { super((SkipInit) null); initObject(init(rawValue)); }

        @Property(selector = "rawValue")
        public native String getRawValue();

        @Method(selector = "initWithRawValue:")
        protected native @Pointer long init(String rawValue);
        @Method(selector = "purchased")
        public static native OwnershipType purchased();
        @Method(selector = "familyShared")
        public static native OwnershipType familyShared();
    }

    /**
     * @since Available in iOS 17.0 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmTransaction_Reason")
    public static class Reason extends NSObject {
        public static class ReasonPtr extends Ptr<Reason, ReasonPtr> {}
        static { ObjCRuntime.bind(Reason.class); }

        protected Reason() {}
        protected Reason(Handle h, long handle) { super(h, handle); }
        protected Reason(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "rawValue")
        public native String getRawValue();

        @Method(selector = "purchase")
        public static native Reason purchase();
        @Method(selector = "renewal")
        public static native Reason renewal();
    }

    @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
    public enum RefundRequestError implements NSErrorCode {
        Unknown(-1L),
        DuplicateRequest(0L),
        Failed(1L);

        private final long n;

        private RefundRequestError(long n) { this.n = n; }
        public long value() { return n; }
        public static RefundRequestError valueOf(long n) {
            for (RefundRequestError v : values()) {
                if (v.n == n) {
                    return v;
                }
            }
            throw new IllegalArgumentException("No constant with value " + n + " found in "
                    + RefundRequestError.class.getName());
        }

        // bind wrap to include it in compilation as long as nserror enum is used
        static { Bro.bind(NSErrorWrap.class); }
        @StronglyLinked
        public static class NSErrorWrap extends NSError {
            protected NSErrorWrap(SkipInit skipInit) {super(skipInit);}

            @Override public NSErrorCode getErrorCode() {
                try {
                    return  RefundRequestError.valueOf(getCode());
                } catch (IllegalArgumentException e) {
                    return null;
                }
            }

            public static String getClassDomain() {
                /** must be inserted in value section */
                return Transaction.RefundRequestErrorDomain();
            }
        }
    }

    @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
    public enum RefundRequestStatus implements ValuedEnum {
        Unknown(-1L),
        Success(0L),
        UserCancelled(1L);

        private final long n;

        private RefundRequestStatus(long n) { this.n = n; }
        public long value() { return n; }
        public static RefundRequestStatus valueOf(long n) {
            for (RefundRequestStatus v : values()) {
                if (v.n == n) {
                    return v;
                }
            }
            throw new IllegalArgumentException("No constant with value " + n + " found in "
                    + RefundRequestStatus.class.getName());
        }
    }


    @Library(Library.INTERNAL) @NativeClass("RvmTransaction_RevocationReason")
    public static class RevocationReason extends NSObject {
        public static class RevocationReasonPtr extends Ptr<RevocationReason, RevocationReasonPtr> {}
        static { ObjCRuntime.bind(RevocationReason.class); }

        protected RevocationReason() {}
        protected RevocationReason(Handle h, long handle) { super(h, handle); }
        protected RevocationReason(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "rawValue")
        public native @MachineSizedSInt long getRawValue();

        @Method(selector = "developerIssue")
        public static native RevocationReason developerIssue();
        @Method(selector = "other")
        public static native RevocationReason other();
    }
}
