package org.robovm.pods.cocoatouch.storekitrvm

import org.robovm.apple.uikit.UIViewController
import kotlin.coroutines.resume

/**
 * @since Available in iOS 18.4 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AdvancedCommerceProductKt.create(id: String): AdvancedCommerceProduct =
    suspendCancellableTask { cont ->
        AdvancedCommerceProduct.create(id, cont::completionHandler)
    }

/**
 * @since Available in iOS 18.4 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AdvancedCommerceProduct.purchase(
    compactJWS: String,
    viewController: UIViewController,
    options: Set<AdvancedCommerceProduct.PurchaseOption> = emptySet()
): Product.PurchaseResult = suspendCancellableTask { cont ->
    purchase(compactJWS, viewController, options.toNSSet(), cont::completionHandler)
}

/**
 * @since Available in iOS 18.4 and later.
 */
suspend fun AdvancedCommerceProduct.getLatestTransaction(): VerificationResult.Transaction? =
    suspendCancellableTask { cont ->
        getLatestTransaction { cont.resume(it) }
    }
