package org.robovm.pods.cocoatouch.storekitrvm

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import org.robovm.apple.foundation.NSObject

/**
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun <T: NSObject> AsyncSequence.AsyncIterator<T>.next(): T? =
    suspendCancellableTask { cont -> next(cont::completionNullableHandler) }

fun <T: NSObject> AsyncSequence.AsyncIterator<T>.asFlow() : Flow<T> {
    return flow {
        while (true) {
            val res = next() ?: break
            emit(res)
        }
    }
}

suspend inline fun <T: NSObject> AsyncSequence<T>.forEach(action: (T) -> Unit) {
    val iter = this.makeAsyncIterator()
    while (true) {
        val res = iter.next() ?: break
        action(res)
    }
}

