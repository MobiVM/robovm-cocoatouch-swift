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
import org.robovm.objc.block.*;
import org.robovm.rt.bro.annotation.*;
import org.robovm.rt.bro.ptr.*;
import org.robovm.apple.foundation.*;
import org.robovm.apple.uikit.*;

/**
 * @since Available in iOS 18.4 and later.
 */
@Library(Library.INTERNAL) @NativeClass("RvmAdvancedCommerceProduct")
public class AdvancedCommerceProduct extends NSObject {
    public static class AdvancedCommerceProductPtr extends Ptr<AdvancedCommerceProduct, AdvancedCommerceProductPtr> {}
    static { ObjCRuntime.bind(AdvancedCommerceProduct.class); }

    protected AdvancedCommerceProduct() {}
    protected AdvancedCommerceProduct(Handle h, long handle) { super(h, handle); }
    protected AdvancedCommerceProduct(SkipInit skipInit) { super(skipInit); }

    @Property(selector = "id")
    public native String getId();
    @Property(selector = "type")
    public native Product.ProductType getType();
    @Property(selector = "allTransactions")
    public native AsyncSequence<VerificationResult.Transaction> getAllTransactions();
    @Property(selector = "currentEntitlements")
    public native AsyncSequence<VerificationResult.Transaction> getCurrentEntitlements();

    @Method(selector = "createWithId:completionHandler:")
    public static native Task create(String id, @Block VoidBlock2<AdvancedCommerceProduct, NSError> completionHandler);

    /**
     * @since Available in iOS 18.4 and later.
     */
    @Method(selector = "purchaseWithCompactJWS:confirmIn:options:completionHandler:")
    public native Task purchase(String compactJWS, UIViewController viewController, NSSet<PurchaseOption> options, @Block VoidBlock2<Product.PurchaseResult, NSError> completionHandler);
    @Method(selector = "latestTransactionWithCompletionHandler:")
    public native Task getLatestTransaction(@Block VoidBlock1<VerificationResult.Transaction> completionHandler);

    /**
     * @since Available in iOS 18.4 and later.
     */
    @Library(Library.INTERNAL) @NativeClass("RvmAdvancedCommerceProduct_PurchaseOption")
    public static class PurchaseOption extends NSObject {
        public static class PurchaseOptionPtr extends Ptr<PurchaseOption, PurchaseOptionPtr> {}
        static { ObjCRuntime.bind(PurchaseOption.class); }

        protected PurchaseOption() {}
        protected PurchaseOption(Handle h, long handle) { super(h, handle); }
        protected PurchaseOption(SkipInit skipInit) { super(skipInit); }

        @Method(selector = "onStorefrontChangeWithShouldContinuePurchase:")
        public static native PurchaseOption onStorefrontChange(@Block Block1<Storefront, Boolean> shouldContinuePurchase);
    }
}
