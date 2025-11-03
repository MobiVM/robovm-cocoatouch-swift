//
//  PurchaseIntent.swift
//  StoreKitRvm
//

import Foundation
import StoreKit

/// Represents a user's intent to purchase a product. This is created when the user starts a product promotion buy from the App Store.
@available(iOS 16.4, macOS 14.4, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
@objc public class RvmPurchaseIntent : NSObject {
    let raw: PurchaseIntent
    init(raw: PurchaseIntent) {
        self.raw = raw
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmPurchaseIntent { self.raw == other.raw } else { false }
    }

    /// The in-app purchase product associated with this intent
    @objc public var product: RvmProduct { raw.product.toRvm() }

    /// The offer to be applied to the purchase
    /// - Note: This is only valid for subscriptions
    @available(iOS 18.0, macOS 15.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @objc public var offer: RvmProduct.SubscriptionOffer? { raw.offer?.toRvm() }

    /// The identifier for the intent
    @objc public var id: String { raw.id }
}

@available(iOS 16.4, macOS 14.4, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension RvmPurchaseIntent {
    /// A sequence that emits a purchase intent each time it is created.
    /// - Important: Create a `Task` to iterate this sequence as early as possible when your app
    ///              launches.
    /// - Note: You may want to delay processing this purchase if it would interrupt the user's interaction with your app.
    @objc public static var intents: RvmAsyncSequence<RvmPurchaseIntent> { PurchaseIntent.intents.toRvm() }
}
