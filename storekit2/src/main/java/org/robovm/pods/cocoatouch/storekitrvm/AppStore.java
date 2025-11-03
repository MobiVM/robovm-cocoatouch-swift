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

import org.robovm.apple.foundation.NSError;
import org.robovm.apple.foundation.NSObject;
import org.robovm.apple.foundation.NSUUID;
import org.robovm.apple.uikit.UIWindowScene;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.VoidBlock1;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.ptr.Ptr;


/**
 * @since Available in iOS 15.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("RvmAppStore")
public class AppStore extends NSObject {

    public static class RvmAppStorePtr extends Ptr<AppStore, RvmAppStorePtr> {}
    static { ObjCRuntime.bind(AppStore.class); }
    
    
    protected AppStore() {}
    protected AppStore(Handle h, long handle) { super(h, handle); }
    protected AppStore(SkipInit skipInit) { super(skipInit); }
    
    @Method(selector = "canMakePayments")
    public static native boolean canMakePayments();

    @Method(selector = "deviceVerificationID")
    public static native NSUUID deviceVerificationID();

    /**
     * @since Available in iOS 16.0 and later.
     */
    @Method(selector = "presentOfferCodeRedeemSheetIn:completionHandler:")
    public static native Task presentOfferCodeRedeemSheet(UIWindowScene scene, @Block VoidBlock1<NSError> completionHandler);

    @Method(selector = "StoreKitErrorDomain")
    public static native String StoreKitErrorDomain();

    /**
     * @since Available in iOS 16.0 and later.
     */
    @Method(selector = "requestReviewIn:")
    public static native void requestReviewIn(UIWindowScene scene);

    @Method(selector = "syncWithCompletionHandler:")
    public static native Task sync(@Block VoidBlock1<NSError> completionHandler);

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
