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
 * @since Available in iOS 16.4 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmProduct_PromotionInfo/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmProduct_PromotionInfoPtr extends Ptr<RvmProduct_PromotionInfo, RvmProduct_PromotionInfoPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmProduct_PromotionInfo.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmProduct_PromotionInfo() {}
    protected RvmProduct_PromotionInfo(Handle h, long handle) { super(h, handle); }
    protected RvmProduct_PromotionInfo(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "productID")
    public native String getProductID();
    @Property(selector = "visibility")
    public native RvmProduct_PromotionInfo_Visibility getVisibility();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "updateWithCompletionHandler:")
    public native RvmTask update(@Block VoidBlock1<NSError> completionHandler);
    @Method(selector = "getCurrentOrderWithCompletionHandler:")
    public static native RvmTask getCurrentOrder(@Block VoidBlock2<NSArray<RvmProduct_PromotionInfo>, NSError> completionHandler);
    @Method(selector = "updateProductOrderByID:completionHandler:")
    public static native RvmTask updateProductOrder(NSArray<NSString> order, @Block VoidBlock1<NSError> completionHandler);
    @Method(selector = "updateProductVisibility:for:completionHandler:")
    public static native RvmTask updateProductVisibility(RvmProduct_PromotionInfo_Visibility visibility, String productID, @Block VoidBlock1<NSError> completionHandler);
    @Method(selector = "updateAll:completionHandler:")
    public static native RvmTask updateAll(NSArray<RvmProduct_PromotionInfo> promotions, @Block VoidBlock1<NSError> completionHandler);
    /*</methods>*/
}
