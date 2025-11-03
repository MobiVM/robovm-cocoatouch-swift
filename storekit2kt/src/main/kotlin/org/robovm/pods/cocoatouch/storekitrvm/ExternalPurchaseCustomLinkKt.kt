package org.robovm.pods.cocoatouch.storekitrvm

import org.robovm.pods.cocoatouch.storekitrvm.ExternalPurchaseCustomLink.NoticeType
import kotlin.coroutines.resume

suspend fun ExternalPurchaseCustomLinkKt.isEligible() = suspendCancellableTask { cont ->
    ExternalPurchaseCustomLink.isEligible { cont.resume(it) }
}

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun ExternalPurchaseCustomLinkKt.showNotice(type: NoticeType) = suspendCancellableTask { cont ->
    ExternalPurchaseCustomLink.showNotice(type, cont::completionHandler)
}

suspend fun ExternalPurchaseCustomLinkKt.getToken(tokenType: String) = suspendCancellableTask { cont ->
    ExternalPurchaseCustomLink.getToken(tokenType, cont::completionNullableHandler)
}
