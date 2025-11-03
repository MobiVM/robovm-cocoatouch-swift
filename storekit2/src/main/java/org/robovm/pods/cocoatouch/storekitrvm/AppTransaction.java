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
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.VoidBlock2;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.ptr.Ptr;

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
    @Property(selector = "preorderDate")
    public native NSDate getPreorderDate();
    @Property(selector = "deviceVerification")
    public native NSData getDeviceVerification();
    @Property(selector = "deviceVerificationNonce")
    public native NSUUID getDeviceVerificationNonce();
    @Property(selector = "signedDate")
    public native NSDate getSignedDate();

    @Method(selector = "getSharedWithCompletionHandler:")
    public static native Task getShared(@Block VoidBlock2<VerificationResult.AppTransaction, NSError> completionHandler);
    @Method(selector = "refreshWithCompletionHandler:")
    public static native Task refresh(@Block VoidBlock2<VerificationResult.AppTransaction, NSError> completionHandler);
}
