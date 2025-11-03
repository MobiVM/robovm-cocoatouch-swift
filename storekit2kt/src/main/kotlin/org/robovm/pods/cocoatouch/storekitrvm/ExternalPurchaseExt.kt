package org.robovm.pods.cocoatouch.storekitrvm

import kotlin.coroutines.resume

suspend fun ExternalPurchaseKt.canPresent() = suspendCancellableTask { cont ->
    ExternalPurchase.canPresent { cont.resume(it) }
}

suspend fun ExternalPurchaseKt.presentNoticeSheet() = suspendCancellableTask { cont ->
    ExternalPurchase.presentNoticeSheet(cont::completionHandler)
}
