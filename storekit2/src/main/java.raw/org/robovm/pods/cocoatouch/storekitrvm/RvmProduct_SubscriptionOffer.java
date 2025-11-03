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

/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmProduct_SubscriptionOffer/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmProduct_SubscriptionOfferPtr extends Ptr<RvmProduct_SubscriptionOffer, RvmProduct_SubscriptionOfferPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmProduct_SubscriptionOffer.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmProduct_SubscriptionOffer() {}
    protected RvmProduct_SubscriptionOffer(Handle h, long handle) { super(h, handle); }
    protected RvmProduct_SubscriptionOffer(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "id")
    public native String getId();
    @Property(selector = "type")
    public native RvmProduct_SubscriptionOffer_OfferType getType();
    @Property(selector = "price")
    public native NSDecimalNumber getPrice();
    @Property(selector = "displayPrice")
    public native String getDisplayPrice();
    @Property(selector = "period")
    public native RvmProduct_SubscriptionPeriod getPeriod();
    @Property(selector = "periodCount")
    public native @MachineSizedSInt long getPeriodCount();
    @Property(selector = "paymentMode")
    public native RvmProduct_SubscriptionOffer_PaymentMode getPaymentMode();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    
    /*</methods>*/
}
