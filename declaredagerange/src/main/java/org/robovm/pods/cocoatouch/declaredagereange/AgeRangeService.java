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

import org.robovm.objc.*;
import org.robovm.objc.annotation.*;
import org.robovm.objc.block.*;
import org.robovm.rt.annotation.StronglyLinked;
import org.robovm.rt.bro.Bro;
import org.robovm.rt.bro.ValuedEnum;
import org.robovm.rt.bro.annotation.*;
import org.robovm.apple.foundation.*;
import org.robovm.apple.uikit.*;

/**
 * @since Available in iOS 26.0 and later.
 */
@Library(Library.INTERNAL) @NativeClass("RvmAgeRangeService")
@ForceLinkClass(AgeRangeService.Error.class)
public class AgeRangeService extends NSObject {
    static { ObjCRuntime.bind(AgeRangeService.class); }

    protected AgeRangeService() {}
    protected AgeRangeService(Handle h, long handle) { super(h, handle); }
    protected AgeRangeService(SkipInit skipInit) { super(skipInit); }

    @Method(selector = "requestAgeRangeWithAgeGates:::in:completionHandler:")
    protected native void requestAgeRange(@MachineSizedSInt long threshold1, NSNumber threshold2, NSNumber threshold3, UIViewController viewController, @Block VoidBlock2<Response, NSError> completionHandler);
    public void requestAgeRange(int threshold1, Integer threshold2, Integer threshold3, UIViewController viewController, @Block VoidBlock2<Response, NSError> completionHandler) {
        requestAgeRange(
                threshold1,
                threshold2 != null ? NSNumber.valueOf((int)threshold2) : null,
                threshold3 != null ? NSNumber.valueOf((int)threshold3) : null,
                viewController, completionHandler
        );
    }
    @Method(selector = "shared")
    public static native AgeRangeService shared();
    @Method(selector = "ErrorDomain")
    public static native String ErrorDomain();
    
    @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
    public enum Error implements NSErrorCode {
        Unknown(-1L),
        NotAvailable(0L),
        InvalidRequest(1L);

        private final long n;

        private Error(long n) { this.n = n; }
        public long value() { return n; }
        public static Error valueOf(long n) {
            for (Error v : values()) {
                if (v.n == n) {
                    return v;
                }
            }
            throw new IllegalArgumentException("No constant with value " + n + " found in "
                    + Error.class.getName());
        }

        // bind wrap to include it in compilation as long as nserror enum is used
        static { Bro.bind(NSErrorWrap.class); }
        @StronglyLinked
        public static class NSErrorWrap extends NSError {
            protected NSErrorWrap(SkipInit skipInit) {super(skipInit);}

            @Override public Error getErrorCode() {
                try {
                    return  Error.valueOf(getCode());
                } catch (IllegalArgumentException e) {
                    return null;
                }
            }

            public static String getClassDomain() {
                return ErrorDomain();
            }

            @Override
            public String toString() {
                NSErrorCode code = getErrorCode();
                String codeStr = code != null ? code.toString() : "unknown(" + getCode() + ")";
                String description = getLocalizedDescription();
                return "AgeRangeService.Error." +
                        codeStr +
                        ((description != null) ? (", " + description) : "");
            }
        }
    }

    @Library(Library.INTERNAL) @NativeClass("RvmAgeRangeService_ParentalControls")
    public static class ParentalControls extends NSObject {
        static { ObjCRuntime.bind(ParentalControls.class); }

        protected ParentalControls() {}
        protected ParentalControls(Handle h, long handle) { super(h, handle); }
        protected ParentalControls(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "description")
        public native String description();

        @Method(selector = "containsWithOther:")
        public native boolean contains(ParentalControls other);
        @Method(selector = "communicationLimits")
        public static native ParentalControls communicationLimits();
    }

    @Library(Library.INTERNAL) @NativeClass("RvmAgeRangeService_AgeRange")
    public static class AgeRange extends NSObject {
        static { ObjCRuntime.bind(AgeRange.class); }

        protected AgeRange() {}
        protected AgeRange(Handle h, long handle) { super(h, handle); }
        protected AgeRange(SkipInit skipInit) { super(skipInit); }

        @Property(selector = "lowerBound")
        protected native NSNumber getLowerBound0();
        @Property(selector = "upperBound")
        protected native NSNumber getUpperBound0();
        @Property(selector = "ageRangeDeclaration")
        protected native AgeRangeDeclaration getAgeRangeDeclaration0();
        @Property(selector = "activeParentalControls")
        public native ParentalControls getActiveParentalControls();

        public Integer getLowerBound() {
            NSNumber v = getLowerBound0();
            return v != null ? v.intValue() : null;
        }
        public Integer getUpperBound() {
            NSNumber v = getUpperBound0();
            return v != null ? v.intValue() : null;
        }
        public AgeRangeDeclaration getAgeRangeDeclaration() {
            AgeRangeDeclaration v = getAgeRangeDeclaration0();
            return v != AgeRangeDeclaration.Unknown ? v : null;
        }
    }

    @org.robovm.rt.bro.annotation.Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
    public enum AgeRangeDeclaration implements ValuedEnum {
        Unknown(-1L),
        SelfDeclared(0L),
        GuardianDeclared(1L);

        private final long n;

        private AgeRangeDeclaration(long n) { this.n = n; }
        public long value() { return n; }
        public static AgeRangeDeclaration valueOf(long n) {
            for (AgeRangeDeclaration v : values()) {
                if (v.n == n) {
                    return v;
                }
            }
            throw new IllegalArgumentException("No constant with value " + n + " found in "
                    + AgeRangeDeclaration.class.getName());
        }
    }
    @Library(Library.INTERNAL) @NativeClass("RvmAgeRangeService_Response")
    public static class Response extends NSObject {
        static { ObjCRuntime.bind(Response.class); }

        public Response() {}
        protected Response(Handle h, long handle) { super(h, handle); }
        protected Response(SkipInit skipInit) { super(skipInit); }

        @Method(selector = "unknown")
        public static native Response unknown();
        @Method(selector = "declinedSharing")
        public static native Response declinedSharing();

        @Library(Library.INTERNAL) @NativeClass("RvmAgeRangeService_Response_sharing")
        public static class sharing extends Response {
            static { ObjCRuntime.bind(sharing.class); }

            protected sharing() {}
            protected sharing(Handle h, long handle) { super(h, handle); }
            protected sharing(SkipInit skipInit) { super(skipInit); }

            @Property(selector = "range")
            public native AgeRange getRange();
        }
    }
}
