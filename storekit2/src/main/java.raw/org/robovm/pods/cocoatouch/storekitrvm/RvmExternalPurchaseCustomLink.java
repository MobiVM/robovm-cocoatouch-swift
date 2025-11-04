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
 * @since Available in iOS 18.1 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmExternalPurchaseCustomLink")/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmExternalPurchaseCustomLink/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmExternalPurchaseCustomLinkPtr extends Ptr<RvmExternalPurchaseCustomLink, RvmExternalPurchaseCustomLinkPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmExternalPurchaseCustomLink.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmExternalPurchaseCustomLink() {}
    protected RvmExternalPurchaseCustomLink(Handle h, long handle) { super(h, handle); }
    protected RvmExternalPurchaseCustomLink(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "isEligibleWithCompletionHandler:")
    public static native RvmTask isEligible(@Block VoidBooleanBlock completionHandler);
    @Method(selector = "showNoticeWithType:completionHandler:")
    public static native RvmTask showNotice(RvmExternalPurchaseCustomLink_NoticeType type, @Block VoidBlock2<RvmExternalPurchaseCustomLink_NoticeResult, NSError> completionHandler);
    @Method(selector = "tokenFor:completionHandler:")
    public static native RvmTask getToken(String tokenType, @Block VoidBlock2<RvmExternalPurchaseCustomLink_Token, NSError> completionHandler);
    /*</methods>*/
}
