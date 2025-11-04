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


import org.robovm.apple.foundation.NSLocale;
import org.robovm.apple.foundation.NSObject;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.rt.bro.annotation.Library;

public class FormatStyle {
    private FormatStyle() {}

    /**
     * @since Available in iOS 15.0 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmFormatStyle_Currency")
    public static class Currency extends NSObject {
        static { ObjCRuntime.bind(Currency.class); }

        protected Currency() {}
        protected Currency(Handle h, long handle) { super(h, handle); }
        protected Currency(SkipInit skipInit) { super(skipInit); }
        
        
        @Property(selector = "currencyCode")
        public native String getCurrencyCode();
        @Property(selector = "locale")
        public native NSLocale getLocale();
    }
}
