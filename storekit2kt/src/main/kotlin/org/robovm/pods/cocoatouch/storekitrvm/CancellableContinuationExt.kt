package org.robovm.pods.cocoatouch.storekitrvm

import kotlinx.coroutines.CancellableContinuation
import kotlinx.coroutines.suspendCancellableCoroutine
import org.robovm.apple.foundation.NSError
import org.robovm.apple.foundation.NSErrorException
import kotlin.coroutines.Continuation
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException

//
// helpers to wrap callback into Continuation and deal with Swift Task
//

/**
 * continuation to completion handler
 */
internal fun <R> Continuation<R>.completionHandler(res: R?, error: NSError?) {
    if (error != null) resumeWithException(NSErrorException(error))
    else if (res == null) resumeWithException(NullPointerException("Unexpected result == null"))
    else resume(res)
}

/**
 * continuation to completion handler (with nullable result)
 */
internal fun <R> Continuation<R?>.completionNullableHandler(res: R?, error: NSError?) {
    if (error != null) resumeWithException(NSErrorException(error))
    else resume(res)
}

/**
 * continuation to completion handler (without result but with error handling)
 */
internal fun Continuation<Unit>.completionHandler(error: NSError?) {
    if (error != null) resumeWithException(NSErrorException(error))
    else resume(Unit)
}

/**
 * wrapper around suspendCancellableCoroutine that handles Swift Task and cancels it once scope is canceled
 */
internal suspend inline fun <T> suspendCancellableTask(crossinline block: (CancellableContinuation<T>) -> Task): T {
    return suspendCancellableCoroutine { cont ->
        val task = block(cont)
        cont.invokeOnCancellation { task.cancel() }
    }
}

