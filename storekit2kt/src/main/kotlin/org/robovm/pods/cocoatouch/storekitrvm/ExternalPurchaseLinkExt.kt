package org.robovm.pods.cocoatouch.storekitrvm

import org.robovm.apple.foundation.NSURL
import kotlin.coroutines.resume

suspend fun ExternalPurchaseLinkKt.canOpen() = suspendCancellableTask { cont ->
    ExternalPurchaseLink.canOpen { cont.resume(it) }
}

/**
 * @since Available in iOS 17.5 and later.
 */
suspend fun ExternalPurchaseLinkKt.eligibleURLs() = suspendCancellableTask { cont ->
    ExternalPurchaseLink.eligibleURLs { cont.resume(it?.toList())}
}

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun ExternalPurchaseLinkKt.open() = suspendCancellableTask { cont ->
    ExternalPurchaseLink.open(cont::completionHandler)
}

/**
 * @since Available in iOS 17.5 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun ExternalPurchaseLinkKt.open(url: NSURL) = suspendCancellableTask { cont ->
    ExternalPurchaseLink.open(url, cont::completionHandler)
}
