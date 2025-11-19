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
package org.robovm.pods.cocoatouch.declaredagereange;

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
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmAgeRangeService_AgeRange/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmAgeRangeService_AgeRangePtr extends Ptr<RvmAgeRangeService_AgeRange, RvmAgeRangeService_AgeRangePtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmAgeRangeService_AgeRange.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmAgeRangeService_AgeRange() {}
    protected RvmAgeRangeService_AgeRange(Handle h, long handle) { super(h, handle); }
    protected RvmAgeRangeService_AgeRange(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "lowerBound")
    protected native NSNumber getLowerBound0();
    @Property(selector = "upperBound")
    protected native NSNumber getUpperBound0();
    @Property(selector = "ageRangeDeclaration")
    protected native RvmAgeRangeService_AgeRangeDeclaration getAgeRangeDeclaration0();
    @Property(selector = "activeParentalControls")
    public native RvmAgeRangeService_ParentalControls getActiveParentalControls();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    
    /*</methods>*/
}
