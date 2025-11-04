package org.robovm.pods.cocoatouch.storekitrvm

import org.robovm.apple.foundation.*
import org.robovm.apple.uikit.UIScene
import org.robovm.apple.uikit.UIViewController
import org.robovm.pods.cocoatouch.storekitrvm.Product.PromotionInfo
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine


/**
 * @since Available in iOS 15.0 and later.
 * @throws NSErrorException
 */
suspend fun ProductKt.getProducts(identifiers: Collection<String>): List<Product> = suspendCancellableTask { cont ->
    val ids = identifiers.mapTo(NSMutableArray()) { NSString(it) }
    Product.getProducts(ids, cont::completionHandler)
}

/**
 * @since Available in iOS 15.0 and later.
 */
suspend fun Product.getLatestTransaction() = suspendCancellableTask<VerificationResult.Transaction?> { cont ->
    getLatestTransaction { cont.resume(it) }
}

/**
 * @since Available in iOS 15.0 and later.
 */
suspend fun Product.getCurrentEntitlement() = suspendCancellableTask<VerificationResult.Transaction?> { cont ->
    getCurrentEntitlement { cont.resume(it) }
}

/**
 * @since Available in iOS 15.0 and later.
 * @throws NSErrorException
 */
suspend fun Product.purchase(options: Set<Product.PurchaseOption> = emptySet()) = suspendCancellableTask { cont ->
    purchase(options.toNSSet(), cont::completionHandler)
}

/**
 * @since Available in iOS 17.0 and later.
 * @throws NSErrorException
 */
suspend fun Product.purchase(scene: UIScene, options: Set<Product.PurchaseOption> = emptySet()) = suspendCancellableTask { cont ->
    purchase(scene, options.toNSSet(), cont::completionHandler)
}

/**
 * @since Available in iOS 18.2 and later.
 * @throws NSErrorException
 */
suspend fun Product.purchase(vc: UIViewController, options: Set<Product.PurchaseOption> = emptySet()) = suspendCancellableTask { cont ->
    purchase(vc, options.toNSSet(), cont::completionHandler)
}

/**
 * @since Available in iOS 16.4 and later.
 * @throws NSErrorException
 */
suspend fun ProductKt.PromotionInfoKt.getCurrentOrder() = suspendCancellableTask { cont ->
    Product.PromotionInfo.getCurrentOrder(cont::completionHandler)
}.toList()

/**
 * @since Available in iOS 16.4 and later.
 * @throws NSErrorException
 */
suspend fun ProductKt.PromotionInfoKt.updateProductOrder(order: List<String>) = suspendCancellableTask { cont ->
    Product.PromotionInfo.updateProductOrder(NSArray.fromStrings(order), cont::completionHandler)
}

/**
 * @since Available in iOS 16.4 and later.
 * @throws NSErrorException
 */
suspend fun ProductKt.PromotionInfoKt.updateProductVisibility(visibility: PromotionInfo.Visibility, productID: String) = suspendCancellableTask { cont ->
    Product.PromotionInfo.updateProductVisibility(visibility, productID, cont::completionHandler)
}

/**
 * @since Available in iOS 16.4 and later.
 * @throws NSErrorException
 */
suspend fun ProductKt.PromotionInfoKt.updateAll(promotions: List<PromotionInfo>) = suspendCancellableTask { cont ->
    Product.PromotionInfo.updateAll(NSArray(promotions), cont::completionHandler)
}

/**
 * @throws NSErrorException
 */
suspend fun Product.PromotionInfo.update() = suspendCancellableTask { cont ->
    update(cont::completionHandler)
}


suspend fun Product.SubscriptionInfo.isEligibleForIntroOffer() = suspendCancellableTask { cont ->
    isEligibleForIntroOffer { cont.resume(it) }
}

suspend fun ProductKt.SubscriptionInfoKt.isEligibleForIntroOffer(groupID: String) = suspendCancellableTask { cont ->
    Product.SubscriptionInfo.isEligibleForIntroOffer(groupID) { cont.resume(it) }
}


suspend fun Product.SubscriptionInfo.getStatus() = suspendCoroutine { cont ->
    getStatus(cont::completionHandler)
}

suspend fun ProductKt.SubscriptionInfoKt.getStatus(groupID: String) = suspendCancellableTask { cont ->
    Product.SubscriptionInfo.getStatus(groupID, cont::completionHandler)
}.toList()


/**
 * workaround: NSSet(collection) will crash if collection is empty
 */
private fun <T: NSObject> Collection<T>.toNSSet(): NSSet<T> {
    return if (isEmpty()) NSSet() else NSSet(this)
}