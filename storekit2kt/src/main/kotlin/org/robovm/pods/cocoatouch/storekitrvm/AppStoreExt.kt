package org.robovm.pods.cocoatouch.storekitrvm

import org.robovm.apple.uikit.UIWindowScene

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