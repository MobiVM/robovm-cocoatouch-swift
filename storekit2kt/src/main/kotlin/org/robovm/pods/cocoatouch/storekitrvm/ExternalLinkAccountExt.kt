package org.robovm.pods.cocoatouch.storekitrvm

import kotlin.coroutines.resume

suspend fun ExternalLinkAccountKt.canOpen() = suspendCancellableTask { cont ->
    ExternalLinkAccount.canOpen { cont.resume(it)  }
}

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun ExternalLinkAccountKt.open() = suspendCancellableTask { cont ->
    ExternalLinkAccount.open(cont::completionHandler)
}
