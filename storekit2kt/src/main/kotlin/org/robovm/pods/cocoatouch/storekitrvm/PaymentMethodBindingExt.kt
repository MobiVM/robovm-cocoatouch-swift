package org.robovm.pods.cocoatouch.storekitrvm

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun PaymentMethodBinding.bind() = suspendCancellableTask { cont ->
    bind(cont::completionHandler)
}

suspend fun PaymentMethodBindingKt.create(id: String) = suspendCancellableTask { cont ->
    PaymentMethodBinding.create(id, cont::completionHandler)
}
