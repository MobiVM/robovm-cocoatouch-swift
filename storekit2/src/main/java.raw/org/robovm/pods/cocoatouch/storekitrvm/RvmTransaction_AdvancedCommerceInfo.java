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
 * @since Available in iOS 18.4 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmTransaction_AdvancedCommerceInfo/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmTransaction_AdvancedCommerceInfoPtr extends Ptr<RvmTransaction_AdvancedCommerceInfo, RvmTransaction_AdvancedCommerceInfoPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmTransaction_AdvancedCommerceInfo.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmTransaction_AdvancedCommerceInfo() {}
    protected RvmTransaction_AdvancedCommerceInfo(Handle h, long handle) { super(h, handle); }
    protected RvmTransaction_AdvancedCommerceInfo(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "requestReferenceID")
    public native String getRequestReferenceID();
    @Property(selector = "estimatedTax")
    public native NSDecimalNumber getEstimatedTax();
    @Property(selector = "taxRate")
    public native NSDecimalNumber getTaxRate();
    @Property(selector = "taxCode")
    public native String getTaxCode();
    @Property(selector = "taxExclusivePrice")
    public native NSDecimalNumber getTaxExclusivePrice();
    @Property(selector = "productDescription")
    public native String getProductDescription();
    @Property(selector = "displayName")
    public native String getDisplayName();
    @Property(selector = "period")
    public native RvmProduct_SubscriptionPeriod getPeriod();
    @Property(selector = "items")
    public native NSArray<RvmTransaction_AdvancedCommerceInfo_Item> getItems();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    
    /*</methods>*/
}
