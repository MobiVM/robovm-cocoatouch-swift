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

import org.robovm.apple.foundation.NSObject;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.VoidBlock1;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.ptr.Ptr;

/**
 * @since Available in iOS 15.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmStorefront")
public class Storefront extends NSObject {
    public static class StorefrontPtr extends Ptr<Storefront, StorefrontPtr> {}
    static { ObjCRuntime.bind(Storefront.class); }
    
    protected Storefront() {}
    protected Storefront(Handle h, long handle) { super(h, handle); }
    protected Storefront(SkipInit skipInit) { super(skipInit); }
    
    @Property(selector = "countryCode")
    public native String getCountryCode();
    @Property(selector = "id")
    public native String getId();
    
    @Method(selector = "currentWithCompletionHandler:")
    public static native Task getCurrent(@Block VoidBlock1<Storefront> completionHandler);
    @Method(selector = "updates")
    public static native AsyncSequence<Storefront> updates();
}
