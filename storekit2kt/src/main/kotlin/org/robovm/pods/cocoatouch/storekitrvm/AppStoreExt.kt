package org.robovm.pods.cocoatouch.storekitrvm

import org.robovm.apple.uikit.UIViewController
import org.robovm.apple.uikit.UIWindowScene
import kotlin.coroutines.resume

/**
 * @since Available in iOS 26.2 and later.
 */
suspend fun AppStoreKt.ageRatingCode(): Int? = suspendCancellableTask { cont ->
    AppStore.ageRatingCode { cont.resume(it?.intValue()) }
}

/**
 * @since Available in iOS 26.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppStoreKt.presentMerchandising(
    kind: AppStoreMerchandisingKind,
    controller: UIViewController
): AppStoreMerchandisingKind.PresentationResult = suspendCancellableTask { cont ->
    AppStore.presentMerchandising(kind, controller, cont::completionHandler)
}

/**
 * @since Available in iOS 27.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppStoreKt.presentOfferCodeRedeemSheet(
    viewController: UIViewController,
    options: Set<RedeemOption> = emptySet()
): VerificationResult.Transaction = suspendCancellableTask { cont ->
    AppStore.presentOfferCodeRedeemSheet(viewController, options.toNSSet(), cont::completionHandler)
}

/**
 * @since Available in iOS 16.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppStoreKt.presentOfferCodeRedeemSheet(scene: UIWindowScene) = suspendCancellableTask { cont ->
    AppStore.presentOfferCodeRedeemSheet(scene, cont::completionHandler)
}

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppStoreKt.sync() = suspendCancellableTask { cont -> AppStore.sync(cont::completionHandler) }

/**
 * @since Available in iOS 15.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppStoreKt.showManageSubscriptions(scene: UIWindowScene) = suspendCancellableTask { cont ->
    AppStore.showManageSubscriptions(scene, cont::completionHandler)
}

/**
 * @since Available in iOS 17.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppStoreKt.showManageSubscriptions(scene: UIWindowScene, subscriptionGroupID: String) = suspendCancellableTask { cont ->
    AppStore.showManageSubscriptions(scene, subscriptionGroupID,cont::completionHandler)
}
