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
import org.robovm.apple.foundation.NSErrorCode;
import org.robovm.apple.foundation.NSObject;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.VoidBlock1;
import org.robovm.objc.block.VoidBlock2;
import org.robovm.rt.annotation.StronglyLinked;
import org.robovm.rt.bro.Bro;
import org.robovm.rt.bro.ValuedEnum;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.ptr.Ptr;



/**
 * @since Available in iOS 16.4 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmPaymentMethodBinding")
public class PaymentMethodBinding extends NSObject {
    public static class PaymentMethodBindingPtr extends Ptr<PaymentMethodBinding, PaymentMethodBindingPtr> {}
    static { ObjCRuntime.bind(PaymentMethodBinding.class); }
    
    protected PaymentMethodBinding() {}
    protected PaymentMethodBinding(Handle h, long handle) { super(h, handle); }
    protected PaymentMethodBinding(SkipInit skipInit) { super(skipInit); }

    @Property(selector = "id")
    public native String getId();
    
    @Method(selector = "bindWithCompletionHandler:")
    public native Task bind(@Block VoidBlock1<NSError> completionHandler);
    @Method(selector = "PaymentMethodBindingErrorDomainRvm")
    public static native String PaymentMethodBindingErrorDomainRvm();
    @Method(selector = "createWithId:completionHandler:")
    public static native Task create(String id, @Block VoidBlock2<PaymentMethodBinding, NSError> completionHandler);

     @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
     public enum PaymentMethodBindingError implements NSErrorCode {
         Unknown(-1L),
         NotEligible(0L),
         InvalidPinningID(1L),
         Failed(2L);

         private final long n;

         private PaymentMethodBindingError(long n) { this.n = n; }
         public long value() { return n; }
         public static PaymentMethodBindingError valueOf(long n) {
             for (PaymentMethodBindingError v : values()) {
                 if (v.n == n) {
                     return v;
                 }
             }
             throw new IllegalArgumentException("No constant with value " + n + " found in "
                     + PaymentMethodBindingError.class.getName());
         }

         // bind wrap to include it in compilation as long as nserror enum is used
         static { Bro.bind(NSErrorWrap.class); }
         @StronglyLinked
         public static class NSErrorWrap extends NSError {
             protected NSErrorWrap(SkipInit skipInit) {super(skipInit);}

             @Override public NSErrorCode getErrorCode() {
                 try {
                     return  PaymentMethodBindingError.valueOf(getCode());
                 } catch (IllegalArgumentException e) {
                     return null;
                 }
             }

             public static String getClassDomain() {
                 /** must be inserted in value section */
                 return PaymentMethodBinding.PaymentMethodBindingErrorDomainRvm();
             }
         }
     }

 }
