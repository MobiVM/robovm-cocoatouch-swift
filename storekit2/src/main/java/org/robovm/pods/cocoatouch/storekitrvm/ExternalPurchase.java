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



import org.robovm.apple.foundation.NSError;
import org.robovm.apple.foundation.NSObject;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.VoidBlock2;
import org.robovm.objc.block.VoidBooleanBlock;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.ptr.Ptr;

/**
 * @since Available in iOS 15.4 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmExternalPurchase")
public class ExternalPurchase extends NSObject {

    public static class ExternalPurchasePtr extends Ptr<ExternalPurchase, ExternalPurchasePtr> {}
    static { ObjCRuntime.bind(ExternalPurchase.class); }
    
    protected ExternalPurchase() {}
    protected ExternalPurchase(Handle h, long handle) { super(h, handle); }
    protected ExternalPurchase(SkipInit skipInit) { super(skipInit); }
    
    
    /**
     * @since Available in iOS 17.4 and later.
     */
    @Method(selector = "canPresentWithCompletionHandler:")
    public static native Task canPresent(@Block VoidBooleanBlock completionHandler);
    @Method(selector = "presentNoticeSheetWithCompletionHandler:")
    public static native Task presentNoticeSheet(@Block VoidBlock2<NoticeResult, NSError> completionHandler);

    @Library(Library.INTERNAL) @NativeClass("RvmExternalPurchase_NoticeResult")
    public static class NoticeResult extends NSObject {
        public static class NoticeResultPtr extends Ptr<NoticeResult, NoticeResultPtr> {}
        static { ObjCRuntime.bind(NoticeResult.class); }

        protected NoticeResult() {}
        protected NoticeResult(Handle h, long handle) { super(h, handle); }
        protected NoticeResult(SkipInit skipInit) { super(skipInit); }

        @Method(selector = "canceled")
        public static native Canceled canceled();

        @Library(Library.INTERNAL) @NativeClass("RvmExternalPurchase_NoticeResult_Canceled")
        public static class Canceled extends ExternalPurchase.NoticeResult {

            public static class RvmExternalPurchase_NoticeResult_CanceledPtr extends Ptr<Canceled, RvmExternalPurchase_NoticeResult_CanceledPtr> {}
            static { ObjCRuntime.bind(Canceled.class); }

            protected Canceled() {}
            protected Canceled(Handle h, long handle) { super(h, handle); }
            protected Canceled(SkipInit skipInit) { super(skipInit); }
        }

        @Library(Library.INTERNAL) @NativeClass("RvmExternalPurchase_NoticeResult_Continued")
        public static class Continued extends ExternalPurchase.NoticeResult {

            public static class ContinuedPtr extends Ptr<Continued, ContinuedPtr> {}
            static { ObjCRuntime.bind(Continued.class); }

            protected Continued() {}
            protected Continued(Handle h, long handle) { super(h, handle); }
            protected Continued(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "externalPurchaseToken")
            public native String getExternalPurchaseToken();
        }
    }
}
