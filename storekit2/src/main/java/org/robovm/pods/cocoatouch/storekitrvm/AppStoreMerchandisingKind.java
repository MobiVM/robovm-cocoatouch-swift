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
 * @since Available in iOS 26.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("RvmAppStoreMerchandisingKind")
public class AppStoreMerchandisingKind extends NSObject {
    public static class AppStoreMerchandisingKindPtr extends Ptr<AppStoreMerchandisingKind, AppStoreMerchandisingKindPtr> {}
    static { ObjCRuntime.bind(AppStoreMerchandisingKind.class); }

    protected AppStoreMerchandisingKind() {}
    protected AppStoreMerchandisingKind(Handle h, long handle) { super(h, handle); }
    protected AppStoreMerchandisingKind(SkipInit skipInit) { super(skipInit); }

    @Method(selector = "subscriptionBundle:")
    public static native AppStoreMerchandisingKind subscriptionBundle(String groupID);

    /**
     * @since Available in iOS 26.0 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmAppStoreMerchandisingKind_PresentationResult")
    public static class PresentationResult extends NSObject {
        public static class PresentationResultPtr extends Ptr<PresentationResult, PresentationResultPtr> {}
        static { ObjCRuntime.bind(PresentationResult.class); }

        protected PresentationResult() {}
        protected PresentationResult(Handle h, long handle) { super(h, handle); }
        protected PresentationResult(SkipInit skipInit) { super(skipInit); }

       @Method(selector = "dismissed")
        public static native PresentationResult dismissed();
        @Method(selector = "unknown")
        public static native PresentationResult unknown();

        /**
         * @since Available in iOS 26.0 and later.
         */
        @Library(Library.INTERNAL) @NativeClass("RvmAppStoreMerchandisingKind_PresentationResult_purchaseCompleted")
        public static class purchaseCompleted extends PresentationResult {
            static { ObjCRuntime.bind(purchaseCompleted.class); }

            protected purchaseCompleted() {}
            protected purchaseCompleted(Handle h, long handle) { super(h, handle); }
            protected purchaseCompleted(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "purchaseResult")
            public native Product.PurchaseResult getPurchaseResult();

            @Method(selector = "dismissed")
            public static native PresentationResult dismissed();
            @Method(selector = "unknown")
            public static native PresentationResult unknown();
        }
    }
}
