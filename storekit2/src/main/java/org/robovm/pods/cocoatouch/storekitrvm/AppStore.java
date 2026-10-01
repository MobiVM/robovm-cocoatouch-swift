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
import org.robovm.apple.uikit.*;
import org.robovm.objc.*;
import org.robovm.objc.annotation.*;
import org.robovm.objc.block.*;
import org.robovm.rt.bro.annotation.*;
import org.robovm.rt.bro.ptr.*;



/**
 * @since Available in iOS 15.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("RvmAppStore")
public class AppStore extends NSObject {

    public static class AppStorePtr extends Ptr<AppStore, AppStorePtr> {}
    static { ObjCRuntime.bind(AppStore.class); }


    protected AppStore() {}
    protected AppStore(Handle h, long handle) { super(h, handle); }
    protected AppStore(SkipInit skipInit) { super(skipInit); }

    @Method(selector = "canMakePayments")
    public static native boolean canMakePayments();

    @Method(selector = "deviceVerificationID")
    public static native NSUUID deviceVerificationID();
    /**
     * @since Available in iOS 26.2 and later.
     */
    @Method(selector = "ageRatingCodeWithCompletionHandler:")
    public static native Task ageRatingCode(@Block VoidBlock1<NSNumber> completionHandler);
    /**
     * @since Available in iOS 26.0 and later.
     */
    @Method(selector = "presentMerchandising:from:completionHandler:")
    public static native Task presentMerchandising(AppStoreMerchandisingKind kind, UIViewController controller, @Block VoidBlock2<AppStoreMerchandisingKind.PresentationResult, NSError> completionHandler);
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Method(selector = "requestReviewIn:")
    public static native void requestReviewIn(UIWindowScene scene);

    @Method(selector = "syncWithCompletionHandler:")
    public static native Task sync(@Block VoidBlock1<NSError> completionHandler);
    /**
     * @since Available in iOS 16.0 and later.
     * @deprecated Deprecated in iOS 27.0. Use `presentOfferCodeRedeemSheet(from:options:)` instead.
     */
    @Deprecated
    @Method(selector = "presentOfferCodeRedeemSheetIn:completionHandler:")
    public static native Task presentOfferCodeRedeemSheet(UIWindowScene scene, @Block VoidBlock1<NSError> completionHandler);
    /**
     * @since Available in iOS 27.0 and later.
     */
    @Method(selector = "presentOfferCodeRedeemSheetFrom:options:completionHandler:")
    public static native Task presentOfferCodeRedeemSheet(UIViewController viewController, NSSet<RedeemOption> options, @Block VoidBlock2<VerificationResult.Transaction, NSError> completionHandler);
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "showManageSubscriptionsIn:completionHandler:")
    public static native Task showManageSubscriptions(UIWindowScene scene, @Block VoidBlock1<NSError> completionHandler);

    /**
     * @since Available in iOS 17.0 and later.
     */
    @Method(selector = "showManageSubscriptionsIn:subscriptionGroupID:completionHandler:")
    public static native Task showManageSubscriptions(UIWindowScene scene, String subscriptionGroupID, @Block VoidBlock1<NSError> completionHandler);
    @Method(selector = "StoreKitErrorDomain")
    public static native String StoreKitErrorDomain();
    @Method(selector = "InvalidRequestErrorDomain")
    public static native String InvalidRequestErrorDomain();

    /**
     * @since Available in iOS 18.4 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmAppStore_Platform")
    public static class Platform extends NSObject {
        public static class PlatformPtr extends Ptr<Platform, PlatformPtr> {}
        static { ObjCRuntime.bind(Platform.class); }

        protected Platform() {}
        protected Platform(Handle h, long handle) { super(h, handle); }
        protected Platform(SkipInit skipInit) { super(skipInit); }
        @Method(selector = "initWithRawValue:")
        public Platform(String rawValue) { super((SkipInit) null); initObject(init(rawValue)); }

        @Property(selector = "rawValue")
        public native String getRawValue();

        @Method(selector = "initWithRawValue:")
        protected native @Pointer long init(String rawValue);

        @Method(selector = "iOS")
        public static native Platform iOS();

        @Method(selector = "macOS")
        public static native Platform macOS();

        @Method(selector = "tvOS")
        public static native Platform tvOS();

        @Method(selector = "visionOS")
        public static native Platform visionOS();

        @Method(selector = "managed")
        public static native Platform managed();
    }

    /**
     * @since Available in iOS 16.0 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmAppStore_Environment")
    public static class Environment extends NSObject {

        public static class EnvironmentPtr extends Ptr<Environment, EnvironmentPtr> {}
        static { ObjCRuntime.bind(Environment.class); }

        protected Environment() {}
        protected Environment(Handle h, long handle) { super(h, handle); }
        protected Environment(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "rawValue")
        public native String getRawValue();

        @Method(selector = "production")
        public static native Environment production();
        @Method(selector = "sandbox")
        public static native Environment sandbox();
        @Method(selector = "xcode")
        public static native Environment xcode();
    }
}
