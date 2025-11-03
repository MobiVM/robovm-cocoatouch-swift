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



import org.robovm.apple.foundation.NSArray;
import org.robovm.apple.foundation.NSError;
import org.robovm.apple.foundation.NSObject;
import org.robovm.apple.foundation.NSURL;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.block.VoidBlock1;
import org.robovm.objc.block.VoidBooleanBlock;
import org.robovm.rt.bro.annotation.Library;

/**
 * @since Available in iOS 15.4 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmExternalPurchaseLink")
public class ExternalPurchaseLink extends NSObject {

    static { ObjCRuntime.bind(ExternalPurchaseLink.class); }

    protected ExternalPurchaseLink() {}
    protected ExternalPurchaseLink(Handle h, long handle) { super(h, handle); }
    protected ExternalPurchaseLink(SkipInit skipInit) { super(skipInit); }
    
    @Method(selector = "canOpenWithCompletionHandler:")
    public static native Task canOpen(@Block VoidBooleanBlock completionHandler);
    /**
     * @since Available in iOS 17.5 and later.
     */
    @Method(selector = "eligibleURLsWithCompletionHandler:")
    public static native Task eligibleURLs(@Block VoidBlock1<NSArray<NSURL>> completionHandler);
    @Method(selector = "openWithCompletionHandler:")
    public static native Task open(@Block VoidBlock1<NSError> completionHandler);
    /**
     * @since Available in iOS 17.5 and later.
     */
    @Method(selector = "openWithUrl:completionHandler:")
    public static native Task open(NSURL url, @Block VoidBlock1<NSError> completionHandler);
}
