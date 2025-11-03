package org.robovm.pods.cocoatouch.storekitrvm

import kotlin.coroutines.resume

suspend fun StorefrontKt.getCurrent() = suspendCancellableTask<Storefront?> { cont ->
    Storefront.getCurrent { cont.resume(it) }
}
