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
import org.robovm.apple.uikit.UIScene;
import org.robovm.apple.uikit.UIViewController;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.Block1;
import org.robovm.objc.block.VoidBlock1;
import org.robovm.objc.block.VoidBlock2;
import org.robovm.objc.block.VoidBooleanBlock;
import org.robovm.rt.annotation.StronglyLinked;
import org.robovm.rt.bro.Bro;
import org.robovm.rt.bro.ValuedEnum;
import org.robovm.rt.bro.annotation.ByVal;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.annotation.MachineSizedSInt;
import org.robovm.rt.bro.ptr.Ptr;


/**
 * @since Available in iOS 15.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmProduct")
public class Product extends NSObject {
    public static class RvmProductPtr extends Ptr<Product, RvmProductPtr> {}
    static { ObjCRuntime.bind(Product.class); }
    
    protected Product() {}
    protected Product(Handle h, long handle) { super(h, handle); }
    protected Product(SkipInit skipInit) { super(skipInit); }
    
    @Property(selector = "jsonRepresentation")
    public native NSData getJsonRepresentation();
    @Property(selector = "id")
    public native String getId();
    @Property(selector = "type")
    public native ProductType getType();
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
    public native SubscriptionInfo getSubscription();
    @Property(selector = "priceFormatStyle")
    public native FormatStyle.Currency getPriceFormatStyle();
    @Property(selector = "debugDescription")
    public native String getDebugDescription();

    @Method(selector = "productsFor:completionHandler:")
    public static native Task getProducts(NSArray<NSString> identifiers, @Block VoidBlock2<NSArray<Product>, NSError> completionHandler);
    @Method(selector = "latestTransactionWithCompletionHandler:")
    public native Task getLatestTransaction(@Block VoidBlock1<VerificationResult.Transaction> completionHandler);
    @Method(selector = "currentEntitlementWithCompletionHandler:")
    public native Task getCurrentEntitlement(@Block VoidBlock1<VerificationResult.Transaction> completionHandler);
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "purchaseWithOptions:completionHandler:")
    public native Task purchase(NSSet<PurchaseOption> options, @Block VoidBlock2<PurchaseResult, NSError> completionHandler);
    /**
     * @since Available in iOS 17.0 and later.
     */
    @Method(selector = "purchaseWithConfirmIn:options:completionHandler:")
    public native Task purchase(UIScene scene, NSSet<PurchaseOption> options, @Block VoidBlock2<PurchaseResult, NSError> completionHandler);
    /**
     * @since Available in iOS 18.2 and later.
     */
    @Method(selector = "purchaseWithConfirmInVc:options:completionHandler:")
    public native Task purchase(UIViewController viewController, NSSet<PurchaseOption> options, @Block VoidBlock2<PurchaseResult, NSError> completionHandler);
    @Method(selector = "PurchaseErrorDomain")
    public static native String PurchaseErrorDomain();

    @Library(Library.INTERNAL) @NativeClass("RvmProduct_ProductType")
    public static class ProductType extends NSObject {
        public static class ProductTypePtr extends Ptr<ProductType, ProductTypePtr> {}
        static { ObjCRuntime.bind(ProductType.class); }

        protected ProductType() {}
        protected ProductType(Handle h, long handle) { super(h, handle); }
        protected ProductType(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "rawValue")
        public native String getRawValue();

        @Method(selector = "consumable")
        public static native ProductType consumable();
        @Method(selector = "nonConsumable")
        public static native ProductType nonConsumable();
        @Method(selector = "nonRenewable")
        public static native ProductType nonRenewable();
        @Method(selector = "autoRenewable")
        public static native ProductType autoRenewable();
    }

    /**
     * @since Available in iOS 16.4 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmProduct_PromotionInfo")
    public static class PromotionInfo extends NSObject {
        public static class PromotionInfoPtr extends Ptr<PromotionInfo, PromotionInfoPtr> {}
        static { ObjCRuntime.bind(PromotionInfo.class); }

        protected PromotionInfo() {}
        protected PromotionInfo(Handle h, long handle) { super(h, handle); }
        protected PromotionInfo(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "productID")
        public native String getProductID();
        @Property(selector = "visibility")
        public native Visibility getVisibility();

        @Method(selector = "updateWithCompletionHandler:")
        public native Task update(@Block VoidBlock1<NSError> completionHandler);
        @Method(selector = "getCurrentOrderWithCompletionHandler:")
        public static native Task getCurrentOrder(@Block VoidBlock2<NSArray<PromotionInfo>, NSError> completionHandler);
        @Method(selector = "updateProductOrderByID:completionHandler:")
        public static native Task updateProductOrder(NSArray<NSString> order, @Block VoidBlock1<NSError> completionHandler);
        @Method(selector = "updateProductVisibility:for:completionHandler:")
        public static native Task updateProductVisibility(Visibility visibility, String productID, @Block VoidBlock1<NSError> completionHandler);
        @Method(selector = "updateAll:completionHandler:")
        public static native Task updateAll(NSArray<PromotionInfo> promotions, @Block VoidBlock1<NSError> completionHandler);

        @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
        public enum Visibility implements ValuedEnum {
            Unknown(-1L),
            AppStoreConnectDefault(0L),
            Visible(1L),
            Hidden(2L);

            private final long n;

            private Visibility(long n) { this.n = n; }
            public long value() { return n; }
            public static Visibility valueOf(long n) {
                for (Visibility v : values()) {
                    if (v.n == n) {
                        return v;
                    }
                }
                throw new IllegalArgumentException("No constant with value " + n + " found in "
                        + Visibility.class.getName());
            }
        }
    }

    @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
    public enum PurchaseError implements NSErrorCode {
        Unknown(-1L),
        InvalidQuantity(0L),
        ProductUnavailable(1L),
        PurchaseNotAllowed(2L),
        IneligibleForOffer(3L),
        InvalidOfferIdentifier(4L),
        InvalidOfferPrice(5L),
        InvalidOfferSignature(6L),
        MissingOfferParameters(7L);

        private final long n;

        private PurchaseError(long n) { this.n = n; }
        public long value() { return n; }
        public static PurchaseError valueOf(long n) {
            for (PurchaseError v : values()) {
                if (v.n == n) {
                    return v;
                }
            }
            throw new IllegalArgumentException("No constant with value " + n + " found in "
                + PurchaseError.class.getName());
        }

        // bind wrap to include it in compilation as long as nserror enum is used
        static { Bro.bind(NSErrorWrap.class); }
        @StronglyLinked
        public static class NSErrorWrap extends NSError {
            protected NSErrorWrap(SkipInit skipInit) {super(skipInit);}

            @Override public NSErrorCode getErrorCode() {
                 try {
                     return  PurchaseError.valueOf(getCode());
                 } catch (IllegalArgumentException e) {
                     return null;
                 }
             }

            public static String getClassDomain() {
                /** must be inserted in value section */
                return PurchaseErrorDomain();
            }
        }
    }

    @Library(Library.INTERNAL) @NativeClass("RvmProduct_PurchaseOption")
    public static class PurchaseOption extends NSObject {
        public static class PurchaseOptionPtr extends Ptr<PurchaseOption, PurchaseOptionPtr> {}
        static { ObjCRuntime.bind(PurchaseOption.class); }

        protected PurchaseOption() {}
        protected PurchaseOption(Handle h, long handle) { super(h, handle); }
        protected PurchaseOption(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "debugDescription")
        public native String getDebugDescription();

        @Method(selector = "appAccountToken:")
        public static native PurchaseOption appAccountToken(NSUUID token);
        @Method(selector = "customStringWithKey:value:")
        public static native PurchaseOption customString(String key, String value);
        @Method(selector = "customNumberWithKey:value:")
        public static native PurchaseOption customNumber(String key, double value);
        @Method(selector = "customBoolWithKey:value:")
        public static native PurchaseOption customBool(String key, boolean value);
        @Method(selector = "customDataWithKey:value:")
        public static native PurchaseOption customData(String key, NSData value);
        @Method(selector = "onStorefrontChangeWithShouldContinuePurchase:")
        public static native PurchaseOption onStorefrontChange(@Block Block1<Storefront, Boolean> shouldContinuePurchase);
        @Method(selector = "promotionalOfferWithOfferID:keyID:nonce:signature:timestamp:")
        public static native PurchaseOption promotionalOffer(String offerID, String keyID, NSUUID nonce, NSData signature, @MachineSizedSInt long timestamp);
        /**
         * @since Available in iOS 17.4 and later.
         */
        @Method(selector = "promotionalOfferWithOfferID:signature:")
        public static native PurchaseOption promotionalOffer(String offerID, SubscriptionInfo.Signature signature);
        @Method(selector = "quantity:")
        public static native PurchaseOption quantity(@MachineSizedSInt long quantity);
        @Method(selector = "simulatesAskToBuyInSandbox:")
        public static native PurchaseOption simulatesAskToBuyInSandbox(boolean simulateAskToBuy);
        /**
         * @since Available in iOS 18.0 and later.
         */
        @Method(selector = "winBackOffer:")
        public static native PurchaseOption winBackOffer(SubscriptionOffer offer);
    }

    @Library(Library.INTERNAL) @NativeClass("RvmProduct_PurchaseResult")
    public static class PurchaseResult extends NSObject {
        public static class PurchaseResultPtr extends Ptr<PurchaseResult, PurchaseResultPtr> {}
        static { ObjCRuntime.bind(PurchaseResult.class); }

        protected PurchaseResult() {}
        protected PurchaseResult(Handle h, long handle) { super(h, handle); }
        protected PurchaseResult(SkipInit skipInit) { super(skipInit); }

        @Method(selector = "userCancelled")
        public static native PurchaseResult userCancelled();
        @Method(selector = "pending")
        public static native PurchaseResult pending();
        @Method(selector = "unknown")
        public static native PurchaseResult unknown();

        @Library(Library.INTERNAL) @NativeClass("RvmProduct_PurchaseResult_success")
        public static class success extends Product.PurchaseResult {
            public static class successPtr extends Ptr<success, successPtr> {}
            static { ObjCRuntime.bind(success.class); }

            protected success() {}
            protected success(Handle h, long handle) { super(h, handle); }
            protected success(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "transaction")
            public native VerificationResult.Transaction getTransaction();

            @Method(selector = "userCancelled")
            public static native Product.PurchaseResult userCancelled();
            @Method(selector = "pending")
            public static native Product.PurchaseResult pending();
            @Method(selector = "unknown")
            public static native Product.PurchaseResult unknown();
        }
    }

    @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionInfo")
    public static class SubscriptionInfo extends NSObject {
        public static class SubscriptionInfoPtr extends Ptr<SubscriptionInfo, SubscriptionInfoPtr> {}
        static { ObjCRuntime.bind(SubscriptionInfo.class); }

        protected SubscriptionInfo() {}
        protected SubscriptionInfo(Handle h, long handle) { super(h, handle); }
        protected SubscriptionInfo(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "introductoryOffer")
        public native SubscriptionOffer getIntroductoryOffer();
        @Property(selector = "promotionalOffers")
        public native NSArray<SubscriptionOffer> getPromotionalOffers();
        /**
         * @since Available in iOS 18.0 and later.
         */
        @Property(selector = "winBackOffers")
        public native NSArray<SubscriptionOffer> getWinBackOffers();
        @Property(selector = "subscriptionGroupID")
        public native String getSubscriptionGroupID();
        @Property(selector = "subscriptionPeriod")
        public native SubscriptionPeriod getSubscriptionPeriod();
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

        @Method(selector = "isEligibleForIntroOfferWithCompletionHandler:")
        public native Task isEligibleForIntroOffer(@Block VoidBooleanBlock completionHandler);
        @Method(selector = "isEligibleForIntroOfferFor:completionHandler:")
        public static native Task isEligibleForIntroOffer(String groupID, @Block VoidBooleanBlock completionHandler);
        @Method(selector = "statusWithCompletionHandler:")
        public native Task getStatus(@Block VoidBlock2<NSArray<Status>, NSError> completionHandler);
        @Method(selector = "statusFor:completionHandler:")
        public static native Task getStatus(String groupID, @Block VoidBlock2<NSArray<Status>, NSError> completionHandler);

        @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionInfo_RenewalInfo")
        public static class RenewalInfo extends NSObject {
            public static class RenewalInfoPtr extends Ptr<RenewalInfo, RenewalInfoPtr> {}
            static { ObjCRuntime.bind(RenewalInfo.class); }

            protected RenewalInfo() {}
            protected RenewalInfo(Handle h, long handle) { super(h, handle); }
            protected RenewalInfo(SkipInit skipInit) { super(skipInit); }

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
            public native ExpirationReason getExpirationReason();
            @Property(selector = "priceIncreaseStatus")
            public native PriceIncreaseStatus getPriceIncreaseStatus();
            @Property(selector = "isInBillingRetry")
            public native boolean isInBillingRetry();
            @Property(selector = "gracePeriodExpirationDate")
            public native NSDate getGracePeriodExpirationDate();
            /**
             * @since Available in iOS 18.0 and later.
             */
            @Property(selector = "offer")
            public native Transaction.Offer getOffer();
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
            public native Transaction.OfferType getOfferType();
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
            public native AppStore.Environment getEnvironment();
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

            @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionInfo_RenewalInfo_ExpirationReason")
            public static class ExpirationReason extends NSObject {
                public static class ExpirationReasonPtr extends Ptr<ExpirationReason, ExpirationReasonPtr> {}
                static { ObjCRuntime.bind(ExpirationReason.class); }

                protected ExpirationReason() {}
                protected ExpirationReason(Handle h, long handle) { super(h, handle); }
                protected ExpirationReason(SkipInit skipInit) { super(skipInit); }

                @Property(selector = "rawValue")
                public native @MachineSizedSInt long getRawValue();
                @Property(selector = "localizedDescription")
                public native String getLocalizedDescription();


                @Method(selector = "autoRenewDisabled")
                public static native ExpirationReason autoRenewDisabled();
                @Method(selector = "billingError")
                public static native ExpirationReason billingError();
                @Method(selector = "didNotConsentToPriceIncrease")
                public static native ExpirationReason didNotConsentToPriceIncrease();
                @Method(selector = "productUnavailable")
                public static native ExpirationReason productUnavailable();
                @Method(selector = "unknown")
                public static native ExpirationReason unknown();
            }

            @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
            public enum PriceIncreaseStatus implements ValuedEnum {
                Unknown(0L),
                NoIncreasePending(1L),
                Pending(2L),
                Agreed(3L);

                private final long n;

                private PriceIncreaseStatus(long n) { this.n = n; }
                public long value() { return n; }
                public static PriceIncreaseStatus valueOf(long n) {
                    for (PriceIncreaseStatus v : PriceIncreaseStatus.values()) {
                        if (v.n == n) {
                            return v;
                        }
                    }
                    throw new IllegalArgumentException("No constant with value " + n + " found in "
                            + PriceIncreaseStatus.class.getName());
                }
            }
        }

        @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionInfo_RenewalState")
        public static class RenewalState extends NSObject {
            public static class RenewalStatePtr extends Ptr<RenewalState, RenewalStatePtr> {}
            static { ObjCRuntime.bind(RenewalState.class); }

            protected RenewalState() {}
            protected RenewalState(Handle h, long handle) { super(h, handle); }
            protected RenewalState(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "localizedDescription")
            public native String getLocalizedDescription();

            @Method(selector = "subscribed")
            public static native RenewalState subscribed();
            @Method(selector = "expired")
            public static native RenewalState expired();
            @Method(selector = "inBillingRetryPeriod")
            public static native RenewalState inBillingRetryPeriod();
            @Method(selector = "inGracePeriod")
            public static native RenewalState inGracePeriod();
            @Method(selector = "revoked")
            public static native RenewalState revoked();
        }

        /**
         * @since Available in iOS 17.4 and later.
         */
        @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionInfo_Signature")
        public static class Signature extends NSObject {
            public static class SignaturePtr extends Ptr<Signature, SignaturePtr> {}
            static { ObjCRuntime.bind(Signature.class); }

            protected Signature() {}
            protected Signature(Handle h, long handle) { super(h, handle); }
            protected Signature(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "keyID")
            public native String getKeyID();
            @Property(selector = "nonce")
            public native NSUUID getNonce();
            @Property(selector = "timestamp")
            public native @MachineSizedSInt long getTimestamp();
            @Property(selector = "signature")
            public native NSData getSignature();
        }

        @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionInfo_Status")
        public static class Status extends NSObject {
            public static class StatusPtr extends Ptr<Status, StatusPtr> {}
            static { ObjCRuntime.bind(Status.class); }

            protected Status() {}
            protected Status(Handle h, long handle) { super(h, handle); }
            protected Status(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "state")
            public native RenewalState getState();
            @Property(selector = "transaction")
            public native VerificationResult.Transaction getTransaction();
            @Property(selector = "renewalInfo")
            public native VerificationResult.RenewalInfo getRenewalInfo();

            @Method(selector = "updates")
            public static native AsyncSequence<Status> updates();
            @Method(selector = "all")
            public static native AsyncSequence<Pair> all();

            @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionInfo_Status_Pair")
            public static class Pair extends NSObject {
                static { ObjCRuntime.bind(Pair.class); }

                protected Pair() {}
                protected Pair(Handle h, long handle) { super(h, handle); }
                protected Pair(SkipInit skipInit) { super(skipInit); }

                @Property(selector = "groupID")
                public native String getGroupID();
                @Property(selector = "statuses")
                public native NSArray<Status> getStatuses();
            }
        }
    }

    @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionOffer")
    public static class SubscriptionOffer extends NSObject {
        public static class SubscriptionOfferPtr extends Ptr<SubscriptionOffer, SubscriptionOfferPtr> {}
        static { ObjCRuntime.bind(SubscriptionOffer.class); }
        
        protected SubscriptionOffer() {}
        protected SubscriptionOffer(Handle h, long handle) { super(h, handle); }
        protected SubscriptionOffer(SkipInit skipInit) { super(skipInit); }
        
        @Property(selector = "id")
        public native String getId();
        @Property(selector = "type")
        public native OfferType getType();
        @Property(selector = "price")
        public native NSDecimalNumber getPrice();
        @Property(selector = "displayPrice")
        public native String getDisplayPrice();
        @Property(selector = "period")
        public native SubscriptionPeriod getPeriod();
        @Property(selector = "periodCount")
        public native @MachineSizedSInt long getPeriodCount();
        @Property(selector = "paymentMode")
        public native PaymentMode getPaymentMode();
    
        @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionOffer_OfferType")
        public static class OfferType extends NSObject {
            public static class OfferTypePtr extends Ptr<OfferType, OfferTypePtr> {}
            static { ObjCRuntime.bind(OfferType.class); }
    
            protected OfferType() {}
            protected OfferType(Handle h, long handle) { super(h, handle); }
            protected OfferType(SkipInit skipInit) { super(skipInit); }
    
            @Property(selector = "rawValue")
            public native String getRawValue();
            @Property(selector = "localizedDescription")
            public native String getLocalizedDescription();
    
            @Method(selector = "introductory")
            public static native OfferType introductory();
            @Method(selector = "promotional")
            public static native OfferType promotional();
            @Method(selector = "winBack")
            public static native OfferType winBack();
        }
    
        @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionOffer_PaymentMode")
        public static class PaymentMode extends NSObject {
            public static class PaymentModePtr extends Ptr<PaymentMode, PaymentModePtr> {}
            static { ObjCRuntime.bind(PaymentMode.class); }
    
            protected PaymentMode() {}
            protected PaymentMode(Handle h, long handle) { super(h, handle); }
            protected PaymentMode(SkipInit skipInit) { super(skipInit); }
    
            @Property(selector = "rawValue")
            public native String getRawValue();
            @Property(selector = "localizedDescription")
            public native String getLocalizedDescription();
    
            @Method(selector = "payAsYouGo")
            public static native PaymentMode payAsYouGo();
            @Method(selector = "payUpFront")
            public static native PaymentMode payUpFront();
            @Method(selector = "freeTrial")
            public static native PaymentMode freeTrial();
        }
    
    }

    @Library(Library.INTERNAL) @NativeClass("RvmProduct_SubscriptionPeriod")
    public static class SubscriptionPeriod extends NSObject {
        public static class SubscriptionPeriodPtr extends Ptr<SubscriptionPeriod, SubscriptionPeriodPtr> {}
        static { ObjCRuntime.bind(SubscriptionPeriod.class); }

        protected SubscriptionPeriod() {}
        protected SubscriptionPeriod(Handle h, long handle) { super(h, handle); }
        protected SubscriptionPeriod(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "unit")
        public native Unit getUnit();
        @Property(selector = "value")
        public native @MachineSizedSInt long getValue();
        @Property(selector = "debugDescription")
        public native String getDebugDescription();

        /**
         * @since Available in iOS 15.0 and later.
         */
        @Method(selector = "dateRangeWithReferenceDate:")
        public native NSArray<NSDate> getDateRange(NSDate referenceDate);
        @Method(selector = "weekly")
        public static native SubscriptionPeriod weekly();
        @Method(selector = "monthly")
        public static native SubscriptionPeriod monthly();
        @Method(selector = "yearly")
        public static native SubscriptionPeriod yearly();
        @Method(selector = "everyThreeDays")
        public static native SubscriptionPeriod everyThreeDays();
        @Method(selector = "everyTwoWeeks")
        public static native SubscriptionPeriod everyTwoWeeks();
        @Method(selector = "everyTwoMonths")
        public static native SubscriptionPeriod everyTwoMonths();
        @Method(selector = "everyThreeMonths")
        public static native SubscriptionPeriod everyThreeMonths();
        @Method(selector = "everySixMonths")
        public static native SubscriptionPeriod everySixMonths();

         @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
         public enum Unit implements ValuedEnum {
             Unknown(-1L),
             Day(0L),
             Week(1L),
             Month(2L),
             Year(3L);

             private final long n;

             private Unit(long n) { this.n = n; }
             public long value() { return n; }
             public static Unit valueOf(long n) {
                 for (Unit v : Unit.values()) {
                     if (v.n == n) {
                         return v;
                     }
                 }
                 throw new IllegalArgumentException("No constant with value " + n + " found in "
                         + Unit.class.getName());
             }
         }
    }
}
