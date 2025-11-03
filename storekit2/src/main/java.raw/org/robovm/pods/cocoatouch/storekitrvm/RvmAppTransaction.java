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
 * @since Available in iOS 16.0 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmAppTransaction")/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmAppTransaction/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmAppTransactionPtr extends Ptr<RvmAppTransaction, RvmAppTransactionPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmAppTransaction.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmAppTransaction() {}
    protected RvmAppTransaction(Handle h, long handle) { super(h, handle); }
    protected RvmAppTransaction(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
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
    public native RvmAppStore_Environment getEnvironment();
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
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "getSharedWithCompletionHandler:")
    public static native RvmTask getShared(@Block VoidBlock2<RvmVerificationResult_AppTransaction, NSError> completionHandler);
    @Method(selector = "refreshWithCompletionHandler:")
    public static native RvmTask refresh(@Block VoidBlock2<RvmVerificationResult_AppTransaction, NSError> completionHandler);
    /*</methods>*/
}
