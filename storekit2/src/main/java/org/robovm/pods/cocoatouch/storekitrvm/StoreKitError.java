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

import org.robovm.rt.annotation.*;
import org.robovm.rt.bro.*;
import org.robovm.rt.bro.annotation.*;
import org.robovm.apple.foundation.*;

@Marshaler(ValuedEnum.AsMachineSizedSIntMarshaler.class)
public enum StoreKitError implements NSErrorCode {
    Unknown(0L),
    UserCancelled(1L),
    NetworkError(2L),
    SystemError(3L),
    NotAvailableInStorefront(4L),
    NotEntitled(5L),
    Unsupported(6L),
    InvalidPresentationContext(7L);

    private final long n;

    private StoreKitError(long n) { this.n = n; }
    public long value() { return n; }
    public static StoreKitError valueOf(long n) {
        for (StoreKitError v : values()) {
            if (v.n == n) {
                return v;
            }
        }
        throw new IllegalArgumentException("No constant with value " + n + " found in "
            + StoreKitError.class.getName());
    }

    // bind wrap to include it in compilation as long as nserror enum is used
    static { Bro.bind(NSErrorWrap.class); }
    @StronglyLinked
    public static class NSErrorWrap extends NSError {
        protected NSErrorWrap(SkipInit skipInit) {super(skipInit);}

        @Override public NSErrorCode getErrorCode() {
             try {
                 return  StoreKitError.valueOf(getCode());
             } catch (IllegalArgumentException e) {
                 return null;
             }
         }

        public static String getClassDomain() {
            /** must be inserted in value section */
            return AppStore.StoreKitErrorDomain();
        }
    }
}
