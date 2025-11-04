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
import org.robovm.rt.bro.ValuedEnum;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.ptr.Ptr;



/**
 * @since Available in iOS 18.1 and later.
 */
@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmExternalPurchaseCustomLink")
public class ExternalPurchaseCustomLink extends NSObject {
    public static class ExternalPurchaseCustomLinkPtr extends Ptr<ExternalPurchaseCustomLink, ExternalPurchaseCustomLinkPtr> {}
    static { ObjCRuntime.bind(ExternalPurchaseCustomLink.class); }
    
    protected ExternalPurchaseCustomLink() {}
    protected ExternalPurchaseCustomLink(Handle h, long handle) { super(h, handle); }
    protected ExternalPurchaseCustomLink(SkipInit skipInit) { super(skipInit); }

    @Method(selector = "isEligibleWithCompletionHandler:")
    public static native Task isEligible(@Block VoidBooleanBlock completionHandler);
    @Method(selector = "showNoticeWithType:completionHandler:")
    public static native Task showNotice(NoticeType type, @Block VoidBlock2<NoticeResult, NSError> completionHandler);
    @Method(selector = "tokenFor:completionHandler:")
    public static native Task getToken(String tokenType, @Block VoidBlock2<Token, NSError> completionHandler);

    @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
    public enum NoticeResult implements ValuedEnum {
        Unknown(-1L),
        Cancelled(0L),
        Continued(1L);

        private final long n;

        private NoticeResult(long n) { this.n = n; }
        public long value() { return n; }
        public static NoticeResult valueOf(long n) {
            for (NoticeResult v : values()) {
                if (v.n == n) {
                    return v;
                }
            }
            throw new IllegalArgumentException("No constant with value " + n + " found in "
                    + NoticeResult.class.getName());
        }
    }

    @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
    public enum NoticeType implements ValuedEnum {
        Unknown(-1L),
        WithinApp(0L),
        Browser(1L);

        private final long n;

        private NoticeType(long n) { this.n = n; }
        public long value() { return n; }
        public static NoticeType valueOf(long n) {
            for (NoticeType v : values()) {
                if (v.n == n) {
                    return v;
                }
            }
            throw new IllegalArgumentException("No constant with value " + n + " found in "
                    + NoticeType.class.getName());
        }
    }

    @Library(Library.INTERNAL) @NativeClass("RvmExternalPurchaseCustomLink_Token")
    public static class Token extends NSObject {

        public static class TokenPtr extends Ptr<Token, TokenPtr> {}
        static { ObjCRuntime.bind(Token.class); }

        protected Token() {}
        protected Token(Handle h, long handle) { super(h, handle); }
        protected Token(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "value")
        public native String getValue();
    }

}
