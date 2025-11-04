package org.robovm.pods.cocoatouch.storekitrvm

import org.robovm.apple.uikit.UIWindowScene
import kotlin.coroutines.resume

/**
 * @since Available in iOS 15.0 and later.
 */
suspend fun Transaction.finish() = suspendCancellableTask { cont -> finish { cont.resume(Unit) } }

/**
 * @since Available in iOS 15.0 and later.
 */
suspend fun Transaction.getSubscriptionStatus() = suspendCancellableTask { cont ->
    getSubscriptionStatus { cont.resume(it) }
}

/**
 * @since Available in iOS 15.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun Transaction.beginRefundRequest(scene: UIWindowScene) = suspendCancellableTask { cont ->
    beginRefundRequest(scene, cont::completionHandler)
}

/**
 * @since Available in iOS 15.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun TransactionKt.beginRefundRequest(transactionID: Long, scene: UIWindowScene) = suspendCancellableTask { cont ->
    Transaction.beginRefundRequest(transactionID, scene, cont::completionHandler)
}

suspend fun TransactionKt.getCurrentEntitlement(productID: String) = suspendCancellableTask<VerificationResult.Transaction?> { cont ->
    Transaction.getCurrentEntitlement(productID) { cont.resume(it) }
}

suspend fun TransactionKt.getLatest(productID: String) = suspendCancellableTask<VerificationResult.Transaction?> { cont ->
    Transaction.getLatest(productID) { cont.resume(it) }
}
