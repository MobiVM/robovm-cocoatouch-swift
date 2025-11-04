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


public final class VerificationResult {

    /**
     * @since Available in iOS 16.0 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmVerificationResult_AppTransaction")
    public static class AppTransaction extends NSObject {
        public static class AppTransactionPtr extends Ptr<AppTransaction, AppTransactionPtr> {}
        static { ObjCRuntime.bind(AppTransaction.class); }

        protected AppTransaction() {}
        protected AppTransaction(Handle h, long handle) { super(h, handle); }
        protected AppTransaction(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "isVerified")
        public native boolean isVerified();
        @Property(selector = "unsafePayloadValue")
        public native org.robovm.pods.cocoatouch.storekitrvm.AppTransaction getUnsafePayloadValue();
        @Property(selector = "error")
        public native NSError getError();
        @Property(selector = "jwsRepresentation")
        public native String getJwsRepresentation();
        @Property(selector = "headerData")
        public native NSData getHeaderData();
        @Property(selector = "payloadData")
        public native NSData getPayloadData();
        @Property(selector = "signatureData")
        public native NSData getSignatureData();
        @Property(selector = "signature")
        public native ECDSASignature getSignature();
        @Property(selector = "signedData")
        public native NSData getSignedData();
        @Property(selector = "signedDate")
        public native NSDate getSignedDate();
        @Property(selector = "deviceVerification")
        public native NSData getDeviceVerification();
        @Property(selector = "deviceVerificationNonce")
        public native NSUUID getDeviceVerificationNonce();

        @Method(selector = "getPayloadValueAndReturnError:")
        public org.robovm.pods.cocoatouch.storekitrvm.AppTransaction getPayloadValue() throws NSErrorException {
            NSError.NSErrorPtr ptr = new NSError.NSErrorPtr();
            org.robovm.pods.cocoatouch.storekitrvm.AppTransaction result = getPayloadValue(ptr);
            if (ptr.get() != null) { throw new NSErrorException(ptr.get()); }
            return result;
        }
        @Method(selector = "getPayloadValueAndReturnError:")
        private native org.robovm.pods.cocoatouch.storekitrvm.AppTransaction getPayloadValue(NSError.NSErrorPtr error);
    }

    /**
     * @since Available in iOS 15.0 and later.
     */    @Library(Library.INTERNAL) @NativeClass("RvmVerificationResult_Transaction")
    public static class Transaction extends NSObject {

        public static class TransactionPtr extends Ptr<Transaction, TransactionPtr> {}
        static { ObjCRuntime.bind(Transaction.class); }

        protected Transaction() {}
        protected Transaction(Handle h, long handle) { super(h, handle); }
        protected Transaction(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "isVerified")
        public native boolean isVerified();
        @Property(selector = "unsafePayloadValue")
        public native org.robovm.pods.cocoatouch.storekitrvm.Transaction getUnsafePayloadValue();
        @Property(selector = "error")
        public native NSError getError();
        @Property(selector = "jwsRepresentation")
        public native String getJwsRepresentation();
        @Property(selector = "headerData")
        public native NSData getHeaderData();
        @Property(selector = "payloadData")
        public native NSData getPayloadData();
        @Property(selector = "signatureData")
        public native NSData getSignatureData();
        @Property(selector = "signature")
        public native ECDSASignature getSignature();
        @Property(selector = "signedData")
        public native NSData getSignedData();
        @Property(selector = "signedDate")
        public native NSDate getSignedDate();
        @Property(selector = "deviceVerification")
        public native NSData getDeviceVerification();
        @Property(selector = "deviceVerificationNonce")
        public native NSUUID getDeviceVerificationNonce();

        public org.robovm.pods.cocoatouch.storekitrvm.Transaction getPayloadValue() throws NSErrorException {
            NSError.NSErrorPtr ptr = new NSError.NSErrorPtr();
            org.robovm.pods.cocoatouch.storekitrvm.Transaction result = getPayloadValue(ptr);
            if (ptr.get() != null) { throw new NSErrorException(ptr.get()); }
            return result;
        }
        @Method(selector = "getPayloadValueAndReturnError:")
        private native org.robovm.pods.cocoatouch.storekitrvm.Transaction getPayloadValue(NSError.NSErrorPtr error);
    }

    /**
     * @since Available in iOS 15.0 and later.
     */

    @Library(Library.INTERNAL) @NativeClass("RvmVerificationResult_RenewalInfo")
    public static class RenewalInfo extends NSObject {
        static { ObjCRuntime.bind(RenewalInfo.class); }

        protected RenewalInfo() {}
        protected RenewalInfo(Handle h, long handle) { super(h, handle); }
        protected RenewalInfo(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "isVerified")
        public native boolean isVerified();
        @Property(selector = "unsafePayloadValue")
        public native Product.SubscriptionInfo.RenewalInfo getUnsafePayloadValue();
        @Property(selector = "error")
        public native NSError getError();
        @Property(selector = "jwsRepresentation")
        public native String getJwsRepresentation();
        @Property(selector = "headerData")
        public native NSData getHeaderData();
        @Property(selector = "payloadData")
        public native NSData getPayloadData();
        @Property(selector = "signatureData")
        public native NSData getSignatureData();
        @Property(selector = "signature")
        public native ECDSASignature getSignature();
        @Property(selector = "signedData")
        public native NSData getSignedData();
        @Property(selector = "signedDate")
        public native NSDate getSignedDate();
        @Property(selector = "deviceVerification")
        public native NSData getDeviceVerification();
        @Property(selector = "deviceVerificationNonce")
        public native NSUUID getDeviceVerificationNonce();

        public Product.SubscriptionInfo.RenewalInfo getPayloadValue() throws NSErrorException {
            NSError.NSErrorPtr ptr = new NSError.NSErrorPtr();
            Product.SubscriptionInfo.RenewalInfo result = getPayloadValue(ptr);
            if (ptr.get() != null) { throw new NSErrorException(ptr.get()); }
            return result;
        }
        @Method(selector = "getPayloadValueAndReturnError:")
        private native Product.SubscriptionInfo.RenewalInfo getPayloadValue(NSError.NSErrorPtr error);
    }

}

