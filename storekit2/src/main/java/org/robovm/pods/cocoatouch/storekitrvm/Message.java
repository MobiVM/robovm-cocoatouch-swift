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
import org.robovm.apple.foundation.NSErrorException;
import org.robovm.apple.foundation.NSObject;
import org.robovm.apple.uikit.UIWindowScene;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.annotation.MachineSizedSInt;
import org.robovm.rt.bro.ptr.Ptr;

/**
 * @since Available in iOS 16.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmMessage")
public class Message extends NSObject {
    public static class MessagePtr extends Ptr<Message, MessagePtr> {}
    static { ObjCRuntime.bind(Message.class); }
    
    protected Message() {}
    protected Message(Handle h, long handle) { super(h, handle); }
    protected Message(SkipInit skipInit) { super(skipInit); }
    
    @Property(selector = "reason")
    public native Reason getReason();

    public boolean display(UIWindowScene scene) throws NSErrorException {
       NSError.NSErrorPtr ptr = new NSError.NSErrorPtr();
       boolean result = display(scene, ptr);
       if (ptr.get() != null) { throw new NSErrorException(ptr.get()); }
       return result;
    }
    @Method(selector = "displayIn:error:")
    private native boolean display(UIWindowScene scene, NSError.NSErrorPtr error);
    @Method(selector = "messages")
    public static native AsyncSequence<Message> messages();

     /**
      * @since Available in iOS 16.0 and later.
      */
     @Library(Library.INTERNAL) @NativeClass("RvmMessage_Reason")
     public static class Reason extends NSObject {
         public static class ReasonPtr extends Ptr<Reason, ReasonPtr> {}
         static { ObjCRuntime.bind(Reason.class); }

         protected Reason() {}
         protected Reason(Handle h, long handle) { super(h, handle); }
         protected Reason(SkipInit skipInit) { super(skipInit); }

         @Property(selector = "rawValue")
         public native @MachineSizedSInt long getRawValue();
         @Property(selector = "localizedDescription")
         public native String getLocalizedDescription();

         @Method(selector = "generic")
         public static native Reason generic();
         @Method(selector = "priceIncreaseConsent")
         public static native Reason priceIncreaseConsent();
         @Method(selector = "billingIssue")
         public static native Reason billingIssue();
         @Method(selector = "winBackOffer")
         public static native Reason winBackOffer();
     }

 }
