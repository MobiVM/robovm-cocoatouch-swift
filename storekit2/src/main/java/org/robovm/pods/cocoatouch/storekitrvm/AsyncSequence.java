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
import org.robovm.objc.block.Block0;
import org.robovm.objc.block.VoidBlock1;
import org.robovm.objc.block.VoidBlock2;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.annotation.Pointer;


@Library(Library.INTERNAL) @NativeClass("RvmAsyncSequence")
public class AsyncSequence<T extends NSObject> extends NSObject {
    static { ObjCRuntime.bind(AsyncSequence.class); }
    
    protected AsyncSequence() {}
    protected AsyncSequence(Handle h, long handle) { super(h, handle); }
    protected AsyncSequence(SkipInit skipInit) { super(skipInit); }

    @Method(selector = "makeAsyncIterator")
    public native AsyncIterator<T> makeAsyncIterator();

    @Library(Library.INTERNAL) @NativeClass("RvmAsyncIterator")
    public static class AsyncIterator<T extends NSObject> extends NSObject {
        static { ObjCRuntime.bind(AsyncIterator.class); }

        protected AsyncIterator() {}
        protected AsyncIterator(Handle h, long handle) { super(h, handle); }
        protected AsyncIterator(SkipInit skipInit) { super(skipInit); }

        public Task next(VoidBlock2<T, NSError> completionHandler) {
            // FIXME: RoboVM doesn't support Blocks with generics. using NSObject as arg
            //noinspection unchecked
            return next0((VoidBlock2<NSObject, NSError>) completionHandler);
        }

        @Method(selector = "nextWithCompletionHandler:")
        private native Task next0(@Block VoidBlock2<NSObject, NSError> completionHandler);
    }
}
