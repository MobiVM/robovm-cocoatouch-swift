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
 * @since Available in iOS 15.4 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmExternalPurchaseLink")/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmExternalPurchaseLink/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmExternalPurchaseLinkPtr extends Ptr<RvmExternalPurchaseLink, RvmExternalPurchaseLinkPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmExternalPurchaseLink.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmExternalPurchaseLink() {}
    protected RvmExternalPurchaseLink(Handle h, long handle) { super(h, handle); }
    protected RvmExternalPurchaseLink(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "canOpenWithCompletionHandler:")
    public static native RvmTask canOpen(@Block VoidBooleanBlock completionHandler);
    /**
     * @since Available in iOS 17.5 and later.
     */
    @Method(selector = "eligibleURLsWithCompletionHandler:")
    public static native RvmTask eligibleURLs(@Block VoidBlock1<NSArray<NSURL>> completionHandler);
    @Method(selector = "openWithCompletionHandler:")
    public static native RvmTask open(@Block VoidBlock1<NSError> completionHandler);
    /**
     * @since Available in iOS 17.5 and later.
     */
    @Method(selector = "openWithUrl:completionHandler:")
    public static native RvmTask open(NSURL url, @Block VoidBlock1<NSError> completionHandler);
    /*</methods>*/
}
