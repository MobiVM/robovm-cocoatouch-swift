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
 * @since Available in iOS 26.4 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmTransaction_RevocationType/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmTransaction_RevocationTypePtr extends Ptr<RvmTransaction_RevocationType, RvmTransaction_RevocationTypePtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmTransaction_RevocationType.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmTransaction_RevocationType() {}
    protected RvmTransaction_RevocationType(Handle h, long handle) { super(h, handle); }
    protected RvmTransaction_RevocationType(SkipInit skipInit) { super(skipInit); }
    @Method(selector = "initWithRawValue:")
    public RvmTransaction_RevocationType(String rawValue) { super((SkipInit) null); initObject(init(rawValue)); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "rawValue")
    public native String getRawValue();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "initWithRawValue:")
    protected native @Pointer long init(String rawValue);
    @Method(selector = "familyRevocation")
    public static native RvmTransaction_RevocationType familyRevocation();
    @Method(selector = "fullRefund")
    public static native RvmTransaction_RevocationType fullRefund();
    @Method(selector = "proratedRefund")
    public static native RvmTransaction_RevocationType proratedRefund();
    @Method(selector = "assignmentRevocation")
    public static native RvmTransaction_RevocationType assignmentRevocation();
    /*</methods>*/
}
