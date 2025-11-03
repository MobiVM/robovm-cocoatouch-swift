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
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmProduct_SubscriptionPeriod/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmProduct_SubscriptionPeriodPtr extends Ptr<RvmProduct_SubscriptionPeriod, RvmProduct_SubscriptionPeriodPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmProduct_SubscriptionPeriod.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmProduct_SubscriptionPeriod() {}
    protected RvmProduct_SubscriptionPeriod(Handle h, long handle) { super(h, handle); }
    protected RvmProduct_SubscriptionPeriod(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "unit")
    public native RvmProduct_SubscriptionPeriod_Unit getUnit();
    @Property(selector = "value")
    public native @MachineSizedSInt long getValue();
    @Property(selector = "debugDescription")
    public native String getDebugDescription();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    /**
     * @since Available in iOS 15.0 and later.
     */
    @Method(selector = "dateRangeWithReferenceDate:")
    public native NSArray<NSDate> getDateRange(NSDate referenceDate);
    @Method(selector = "weekly")
    public static native RvmProduct_SubscriptionPeriod weekly();
    @Method(selector = "monthly")
    public static native RvmProduct_SubscriptionPeriod monthly();
    @Method(selector = "yearly")
    public static native RvmProduct_SubscriptionPeriod yearly();
    @Method(selector = "everyThreeDays")
    public static native RvmProduct_SubscriptionPeriod everyThreeDays();
    @Method(selector = "everyTwoWeeks")
    public static native RvmProduct_SubscriptionPeriod everyTwoWeeks();
    @Method(selector = "everyTwoMonths")
    public static native RvmProduct_SubscriptionPeriod everyTwoMonths();
    @Method(selector = "everyThreeMonths")
    public static native RvmProduct_SubscriptionPeriod everyThreeMonths();
    @Method(selector = "everySixMonths")
    public static native RvmProduct_SubscriptionPeriod everySixMonths();
    /*</methods>*/
}
