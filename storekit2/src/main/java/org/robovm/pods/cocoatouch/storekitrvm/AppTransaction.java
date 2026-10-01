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

import org.robovm.objc.*;
import org.robovm.objc.annotation.*;
import org.robovm.objc.block.*;
import org.robovm.rt.bro.annotation.*;
import org.robovm.rt.bro.ptr.*;
import org.robovm.apple.foundation.*;

/**
 * @since Available in iOS 16.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmAppTransaction")
public class AppTransaction extends NSObject {

    public static class AppTransactionPtr extends Ptr<AppTransaction, AppTransactionPtr> {}
    static { ObjCRuntime.bind(AppTransaction.class); }

    protected AppTransaction() {}
    protected AppTransaction(Handle h, long handle) { super(h, handle); }
    protected AppTransaction(SkipInit skipInit) { super(skipInit); }

    @Property(selector = "jsonRepresentation")
    public native NSData getJsonRepresentation();
    @Property(selector = "appID")
    public native NSNumber getAppID();
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Property(selector = "appTransactionID")
    public native String getAppTransactionID();
    @Property(selector = "appVersion")
    public native String getAppVersion();
    @Property(selector = "appVersionID")
    public native NSNumber getAppVersionID();
    @Property(selector = "bundleID")
    public native String getBundleID();
    @Property(selector = "environment")
    public native AppStore.Environment getEnvironment();
    @Property(selector = "originalAppVersion")
    public native String getOriginalAppVersion();
    @Property(selector = "originalPurchaseDate")
    public native NSDate getOriginalPurchaseDate();
    /**
     * @since Available in iOS 18.4 and later.
     */
    @Property(selector = "originalPlatform")
    public native AppStore.Platform getOriginalPlatform();
    /**
     * @since Available in iOS 16.0 and later.
     * @deprecated Deprecated in iOS 18.4. Use the originalPlatform property instead.
     */
    @Deprecated
    @Property(selector = "originalPlatformStringRepresentation")
    public native String getOriginalPlatformStringRepresentation();
    @Property(selector = "preorderDate")
    public native NSDate getPreorderDate();
    @Property(selector = "deviceVerification")
    public native NSData getDeviceVerification();
    @Property(selector = "deviceVerificationNonce")
    public native NSUUID getDeviceVerificationNonce();
    /**
     * @since Available in iOS 16.0 and later.
     */
    @Property(selector = "revocationDate")
    public native NSDate getRevocationDate();
    @Property(selector = "signedDate")
    public native NSDate getSignedDate();
    /**
     * @since Available in iOS 27.0 and later.
     */
    @Property(selector = "storeType")
    public native StoreType getStoreType();

    /**
     * @since Available in iOS 16.0 and later.
     * @deprecated Deprecated in iOS 27.0. Use the storeType property instead.
     */
    @Deprecated
    @Property(selector = "storeTypeStringRepresentation")
    public native String getStoreTypeStringRepresentation();

    @Method(selector = "getSharedWithCompletionHandler:")
    public static native Task getShared(@Block VoidBlock2<VerificationResult.AppTransaction, NSError> completionHandler);
    @Method(selector = "refreshWithCompletionHandler:")
    public static native Task refresh(@Block VoidBlock2<VerificationResult.AppTransaction, NSError> completionHandler);

    @Method(selector = "all")
    public static native AsyncSequence<VerificationResult.AppTransaction> all();

    /**
     * @since Available in iOS 27.0 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmAppTransaction_StoreType")
    public static class StoreType extends NSObject {
        public static class StoreTypePtr extends Ptr<StoreType, StoreTypePtr> {}
        static { ObjCRuntime.bind(StoreType.class); }

        protected StoreType() {}
        protected StoreType(Handle h, long handle) { super(h, handle); }
        protected StoreType(SkipInit skipInit) { super(skipInit); }
        @Method(selector = "initWithRawValue:")
        public StoreType(String rawValue) { super((SkipInit) null); initObject(init(rawValue)); }

        @Property(selector = "rawValue")
        public native String getRawValue();

        @Method(selector = "initWithRawValue:")
        protected native @Pointer long init(String rawValue);

        @Method(selector = "consumer")
        public static native StoreType consumer();
        @Method(selector = "education")
        public static native StoreType education();
        @Method(selector = "enterprise")
        public static native StoreType enterprise();
    }
}
