package org.robovm.pods.cocoatouch.storekitrvm

/// file contains objects that are intended to simulate companion objects
/// extensions on Java classes (that is not possible)
/// each object defined here allows extension to be defined somewhere else
/// example:
//    fun Product.Companion.sync // <--- not possible as product is Java class
//    fun ProductKt.sync         // <--- extension on kt object

object AppStoreKt
object ProductKt {
    object PromotionInfoKt
    object SubscriptionInfoKt
}
object TransactionKt
object AppTransactionKt
object ExternalLinkAccountKt
object ExternalPurchaseKt
object ExternalPurchaseCustomLinkKt
object ExternalPurchaseLinkKt
object PaymentMethodBindingKt
object StorefrontKt