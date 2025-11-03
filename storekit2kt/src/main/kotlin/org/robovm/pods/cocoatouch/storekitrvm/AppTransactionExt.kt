package org.robovm.pods.cocoatouch.storekitrvm

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppTransactionKt.getShared() = suspendCancellableTask { cont ->
    AppTransaction.getShared(cont::completionHandler)
}

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppTransactionKt.refresh() = suspendCancellableTask { cont ->
    AppTransaction.refresh(cont::completionHandler)
}
