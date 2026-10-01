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


import org.robovm.objc.*;
import org.robovm.objc.annotation.*;
import org.robovm.rt.bro.annotation.*;
import org.robovm.rt.bro.ptr.*;
import org.robovm.apple.foundation.*;



/**
 * @since Available in iOS 16.4 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmPurchaseIntent")
public class PurchaseIntent extends NSObject {
    public static class PurchaseIntentPtr extends Ptr<PurchaseIntent, PurchaseIntentPtr> {}
    static { ObjCRuntime.bind(PurchaseIntent.class); }

    protected PurchaseIntent() {}
    protected PurchaseIntent(Handle h, long handle) { super(h, handle); }
    protected PurchaseIntent(SkipInit skipInit) { super(skipInit); }
    
    @Property(selector = "product")
    public native Product getProduct();
    /**
     * @since Available in iOS 18.0 and later.
     */
    @Property(selector = "offer")
    public native Product.SubscriptionOffer getOffer();
    /**
     * @since Available in iOS 16.4 and later.
     */
    @Property(selector = "id")
    public native String getId();
    
    @Method(selector = "intents")
    public static native AsyncSequence<PurchaseIntent> intents();
}
