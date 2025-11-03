import Foundation
import StoreKit

/// Information about a product configured in App Store Connect.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc public class RvmProduct: NSObject  {
    let raw: Product
    init(raw: Product) {
        self.raw = raw
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmProduct { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }

    @objc(RvmProduct_ProductType)
    public class ProductType: NSObject {
        let raw: Product.ProductType
        init(raw: Product.ProductType) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? ProductType { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }


        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        @objc public var rawValue: String { raw.rawValue }

        /// Creates a new instance with the specified raw value.
        ///
        /// If there is no value of the type that corresponds with the specified raw
        /// value, this initializer returns `nil`. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     print(PaperSize(rawValue: "Legal"))
        ///     // Prints "Optional("PaperSize.Legal")"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String) {
            self.raw = Product.ProductType(rawValue: rawValue)
        }

        @objc public static let consumable = Product.ProductType.consumable.toRvm()

        @objc public static let nonConsumable = Product.ProductType.nonConsumable.toRvm() 

        @objc public static let nonRenewable = Product.ProductType.nonRenewable.toRvm()

        @objc public static let autoRenewable = Product.ProductType.autoRenewable.toRvm()
    }

    /// The raw JSON representation of the product.
    @objc public var jsonRepresentation: Data { raw.jsonRepresentation}

    /// The unique product identifier.
    @objc public var id: String { raw.id }

    /// The type of the product.
    @objc public var type: RvmProduct.ProductType { raw.type.toRvm() }

    /// A localized display name of the product.
    @objc public var displayName: String { raw.displayName }

    /// A localized description of the product.
    @objc public var productDescription: String { raw.description }

    /// The price of the product in local currency.
    @objc public var price: NSDecimalNumber { raw.price as NSDecimalNumber }

    /// A localized string representation of `price`.
    @objc public var displayPrice: String { raw.displayPrice }

    /// Whether the product is available for family sharing.
    @objc public var isFamilyShareable: Bool { raw.isFamilyShareable }

    /// Properties and functionality specific to auto-renewable subscriptions.
    ///
    /// This is never `nil` if `type` is `.autoRenewable`, and always `nil` for all other product
    /// types.
    @objc public var subscription: RvmProduct.SubscriptionInfo? { raw.subscription?.toRvm() }
    
    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, macOS 12.0, *)
    public typealias ID = String
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    /// Represents the duration of time between subscription renewals.
    @objc(RvmProduct_SubscriptionPeriod)
    public class SubscriptionPeriod : NSObject {
        let raw: Product.SubscriptionPeriod
        init(raw: Product.SubscriptionPeriod) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? SubscriptionPeriod { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }
        
        /// A unit of time.
        @objc(RvmProduct_SubscriptionPeriod_Unit)
        public enum Unit : Int {
            case unknown = -1
            case day
            case week
            case month
            case year
        }

        /// The unit of time that this period represents.
        @objc public var unit: RvmProduct.SubscriptionPeriod.Unit { raw.unit.toRvm() }

        /// The number of units that the period represents.
        @objc public var value: Int { raw.value }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    @available(iOS 16.4, *)
    @available(visionOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @objc(RvmProduct_PromotionInfo)
    public class PromotionInfo : NSObject {
        let raw: Product.PromotionInfo
        init(raw: Product.PromotionInfo) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? PromotionInfo { self.raw == other.raw } else { false }
        }

        /// Product promotion visibility gives information on the current status of a promotion
        @objc(RvmProduct_PromotionInfo_Visibility)
        public enum Visibility : Int {
            case unknown = -1

            /// Indicates product visibility is the same as the default value set in App Store Connect.
            case appStoreConnectDefault

            /// Indicates product is shown.
            case visible

            /// Indicates product is hidden.
            case hidden
        }

        /// The product this promotion is associated with
        @objc public var productID: Product.ID { raw.productID }

        /// The visibility for this promotion for the current user (i.e.: visible, hidden)
        @objc public var visibility: RvmProduct.PromotionInfo.Visibility { raw.visibility.toRvm() }

        /// Update the properties associated with this promotion, such as the visibility
        @objc public func update(completionHandler: @escaping (Error?) -> Void) -> RvmTask {
            return Task.detached {
                do {
                    try await self.raw.update()
                    completionHandler(nil)
                } catch let error { completionHandler(error.toRvmError()) }
                return
            }.toRvm()
        }

        /// Fetch all the available product promotions in the order that should be displayed and with their current visibility status
        @objc public static func getCurrentOrder(completionHandler: @escaping ([RvmProduct.PromotionInfo]?, Error?) -> Void) -> RvmTask {
            return Task.detached {
                do {
                    completionHandler(try await Product.PromotionInfo.currentOrder.map { $0.toRvm() }, nil)
                } catch let error { completionHandler(nil, error.toRvmError()) }
                return
            }.toRvm()
        }

        /// Update the order of the promotions with a new list of product identifiers
        @objc public static func updateProductOrder(byID order: [String], completionHandler: @escaping (Error?) -> Void) -> RvmTask {
            return Task.detached {
                do {
                    try await Product.PromotionInfo.updateProductOrder(byID: order)
                    completionHandler(nil)
                } catch let error { completionHandler(error.toRvmError()) }
                return
            }.toRvm()
        }

        /// Update the visibility status for a product ID
        @objc public static func updateProductVisibility(
            _ visibility: RvmProduct.PromotionInfo.Visibility,
            for productID: Product.ID,
            completionHandler: @escaping (Error?) -> Void
        ) -> RvmTask {
            return Task.detached {
                do {
                    try await Product.PromotionInfo.updateProductVisibility(visibility.toRaw(), for: productID)
                    completionHandler(nil)
                } catch let error { completionHandler(error.toRvmError()) }
                return
            }.toRvm()
        }

        /// Update both the promotion order and visibility using the data in the provided `PromotionInfo` sequence
        @objc public static func updateAll(_ promotions: [RvmProduct.PromotionInfo], completionHandler: @escaping (Error?) -> Void) -> RvmTask {
            return Task.detached {
                do {
                    try await Product.PromotionInfo.updateAll(promotions.map{ $0.raw })
                    completionHandler(nil)
                } catch let error { completionHandler(error.toRvmError()) }
                return
            }.toRvm()
        }
    }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    /// Properties and functionality specific to auto-renewable subscriptions.
    @objc(RvmProduct_SubscriptionInfo)
    public class SubscriptionInfo: NSObject {
        let raw: Product.SubscriptionInfo
        init(raw: Product.SubscriptionInfo) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? SubscriptionInfo { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }


        /// An optional introductory offer that will automatically be applied if the user is eligible.
        @objc public var introductoryOffer: RvmProduct.SubscriptionOffer? {
            return raw.introductoryOffer?.toRvm()
        }

        /// An array of all the promotional offers configured for this subscription.
        @objc public var promotionalOffers: [RvmProduct.SubscriptionOffer] {
            return raw.promotionalOffers.map{ $0.toRvm() }
        }

        /// An array of all win-back offers configured for this subscription
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @objc public var winBackOffers: [RvmProduct.SubscriptionOffer] {
            return raw.winBackOffers.map{ $0.toRvm() }
        }

        /// The group identifier for this subscription.
        @objc public var subscriptionGroupID: String { raw.subscriptionGroupID }

        /// The duration that this subscription lasts before auto-renewing.
        @objc public var subscriptionPeriod: RvmProduct.SubscriptionPeriod {
            return raw.subscriptionPeriod.toRvm()
        }

        /// Whether the user is eligible to have an introductory offer applied to their purchase.
        @objc public func isEligibleForIntroOffer(completionHandler: @escaping (Bool) -> Void) -> RvmTask {
            return Task.detached { completionHandler(await self.raw.isEligibleForIntroOffer) }.toRvm()
        }

        /// Whether the user is eligible to have an introductory offer applied to a purchase in this
        /// subscription group.
        /// - Parameter groupID: The group identifier to check eligibility for.
        @objc public static func isEligibleForIntroOffer(for groupID: String, completionHandler: @escaping (Bool) -> Void) -> RvmTask {
            return Task.detached { completionHandler(await Product.SubscriptionInfo.isEligibleForIntroOffer(for: groupID)) }.toRvm()
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    @objc(RvmProduct_PurchaseOption)
    public class PurchaseOption : NSObject {
        let raw: Product.PurchaseOption
        init(raw: Product.PurchaseOption) {
            self.raw = raw
        }

        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? PurchaseOption { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }

        /// Apply an app account token to a purchase.
        ///
        /// The app account token will persist in the resulting `Transaction` from a purchase.
        /// - Parameter token: A UUID that associates the purchase with an account in your system.
        @objc public static func appAccountToken(_ token: UUID) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.appAccountToken(token).toRvm()
        }

        /// Add a custom string option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        @objc public static func customString(key: String, value: String) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.custom(key: key, value: value).toRvm()
        }

        /// Add a custom number option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        @objc public static func customNumber(key: String, value: Double) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.custom(key: key, value: value).toRvm()
        }

        /// Add a custom Boolean option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        @objc public static func customBool(key: String, value: Bool) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.custom(key: key, value: value).toRvm()
        }

        /// Add a custom data option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        @objc public static func customData(key: String, value: Data) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.custom(key: key, value: value).toRvm()
        }

        /// A closure that determines whether the transaction should continue if the device's App Store storefront has changed during a transaction.
        ///
        /// The default is `true` if this option is not added.
        /// - Parameter shouldContinuePurchase: A closure that returns a boolean to determine if the
        ///                                     purchase should continue when the storefront has
        ///                                     changed to `Storefront` during the purchase process.
        @objc @preconcurrency public static func onStorefrontChange(shouldContinuePurchase: @escaping @Sendable (RvmStorefront) -> Bool) -> RvmProduct.PurchaseOption {
            let proxy: @Sendable (Storefront) -> Bool = { shouldContinuePurchase($0.toRvm()) }
            return Product.PurchaseOption.onStorefrontChange(shouldContinuePurchase: proxy).toRvm()
        }

        /// Apply a promotional offer to a purchase.
        /// - Parameters:
        ///   - offerID: The `id` property of the `SubscriptionOffer` to apply.
        ///   - keyID: The key ID of the private key used to generate `signature`. The private key
        ///            and key ID can be generated on App Store Connect.
        ///   - nonce: The nonce used in `signature`.
        ///   - signature: The cryptographic signature of the offer parameters, generated on your
        ///                server.
        ///   - timestamp: The time the signature was generated in milliseconds since 1970.
        @objc public static func promotionalOffer(offerID: String, keyID: String, nonce: UUID, signature: Data, timestamp: Int) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.promotionalOffer(offerID: offerID, keyID: keyID, nonce: nonce, signature: signature, timestamp: timestamp).toRvm()
        }

        /// Apply a promotional offer to a purchase.
        ///
        /// - Parameters:
        ///    - offerID: The `id` property of the `SubscriptionOffer` to apply.
        ///    - signature: The metadata of the signature used to validate a promotional offer.
        @available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
        @objc public static func promotionalOffer(offerID: String, signature: RvmProduct.SubscriptionOffer.Signature) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.promotionalOffer(offerID: offerID, signature: signature.raw).toRvm()
        }

        /// The quantity of this product to purchase.
        ///
        /// The default is 1 if this option is not added. This option can only be applied to consumable
        /// products and non-renewing subscriptions.
        /// - Parameter quantity: The quantity to purchase.
        @objc public static func quantity(_ quantity: Int) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.quantity(quantity).toRvm()
        }

        /// Toggle ask to buy when testing in the App Store Sandbox environment.
        ///
        /// The default is `false` if this option is not added.
        /// - Parameter simulateAskToBuy: Set as `true` to simulate a child's account asking
        ///                               permission to purchase from a family member.
        @objc public static func simulatesAskToBuyInSandbox(_ simulateAskToBuy: Bool) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.simulatesAskToBuyInSandbox(simulateAskToBuy).toRvm()
        }

        /// Apply a win-back offer to a purchase.
        /// - Parameters:
        ///   - offer: The `SubscriptionOffer` of type win-back to apply to the purchase.
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @objc public static func winBackOffer(_ offer: RvmProduct.SubscriptionOffer) -> RvmProduct.PurchaseOption {
            return Product.PurchaseOption.winBackOffer(offer.toRaw()).toRvm()
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    @objc(RvmProduct_PurchaseResult)
    public class PurchaseResult: NSObject {
        private override init() {}

        /// The purchase succeeded with a `Transaction`.
        @objc(RvmProduct_PurchaseResult_success)
        public class success: PurchaseResult {
            @objc public let transaction: VerificationResultTransaction
            init(transaction: VerificationResultTransaction) {
                self.transaction = transaction
            }
            
            public override func isEqual(_ object: Any?) -> Bool {
                return if let other = object as? success { self.transaction == other.transaction } else { false }
            }

            public override var hash: Int { return transaction.hashValue }
        }
        
        /// The user cancelled the purchase.
        @objc public static let userCancelled = PurchaseResult()

        /// The purchase is pending some user action.
        ///
        /// These purchases may succeed in the future, and the resulting `Transaction` will be
        /// delivered via `Transaction.updates`
        @objc public static let pending = PurchaseResult()

        @objc public static let unknown = PurchaseResult()
        
        @objc public override var description: String {
            switch self {
            case is PurchaseResult.success:
                return "Purchase succeeded"
            case PurchaseResult.userCancelled:
                return "User cancelled purchase"
            case PurchaseResult.pending:
                return "Purchase pending user action"
            default:
                return "Unknown purchase result"
            }
        }
    }

    @objc public static let PurchaseErrorDomain = "ProductRvm.PurchaseErrorDomain"
    
    @objc(RvmProduct_PurchaseError)
    public enum PurchaseError : Int {
        case unknown = -1

        /// The quantity applied to the purchase was invalid.
        case invalidQuantity

        /// The product is not available on the store.
        case productUnavailable

        /// The user is not allowed to make purchases.
        case purchaseNotAllowed

        /// The user is ineligible for the applied promotional offer.
        case ineligibleForOffer

        /// The promotional offer identifier applied was invalid.
        case invalidOfferIdentifier

        /// The promotional offer price was invalid.
        case invalidOfferPrice

        /// The signature generated for the promotional offer was invalid.
        case invalidOfferSignature

        /// Necessary promotional offer parameters were missing.
        case missingOfferParameters
    }

    /// Processes a purchase for the product.
    /// - Parameter options: A set of options to configure the purchase.
    /// - Returns: The result of the purchase.
    /// - Throws: A `PurchaseError` or `StoreKitError`.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @available(visionOS, unavailable, message: "Use @Environment(\\.purchase) to get a PurchaseAction value to call. If your app uses UIKit, use purchase(confirmIn:options:).")
    @available(visionOS, unavailable)
    @objc @MainActor public func purchase(
        options: Set<RvmProduct.PurchaseOption> = [],
        completionHandler: @escaping (RvmProduct.PurchaseResult?, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await self.raw.purchase(options: Set(options.map { $0.raw })).toRvm(), nil)
            } catch let e {
                completionHandler(nil, e.toRvmError())
            }
            return
        }.toRvm()
    }

    /// Processes a purchase for the product.
    /// - Parameters:
    ///   - scene: The scene to show purchase confirmation UI in proximity to.
    ///   - options: A set of options to configure the purchase.
    /// - Returns: The result of the purchase
    /// - Throws: A `PurchaseError` or `StoreKitError`.
    @available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @objc @MainActor public func purchase(
        confirmIn scene: UIScene,
        options: Set<RvmProduct.PurchaseOption> = [],
        completionHandler: @escaping (RvmProduct.PurchaseResult?, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await self.raw.purchase(confirmIn: scene, options: Set(options.map { $0.raw })).toRvm(), nil)
            } catch let e {
                completionHandler(nil, e.toRvmError())
            }
            return
        }.toRvm()
    }

    /// Processes a purchase for the product.
    /// - Parameters:
    ///   - viewController: The view controller to show purchase confirmation UI in proximity to.
    ///   - options: A set of options to configure the purchase.
    /// - Returns: The result of the purchase
    /// - Throws: A `PurchaseError` or `StoreKitError`.
    @available(iOS 18.2, tvOS 18.2, visionOS 2.2, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @objc public func purchase(
        confirmInVc viewController: UIViewController,
        options: Set<RvmProduct.PurchaseOption> = [],
        completionHandler: @escaping (RvmProduct.PurchaseResult?, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await self.raw.purchase(confirmIn: viewController, options: Set(options.map { $0.raw })).toRvm(), nil)
            } catch let e {
                completionHandler(nil, e.toRvmError())
            }
            return
        }.toRvm()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `debugDescription` property for types that conform to
    /// `CustomDebugStringConvertible`:
    ///
    ///     struct Point: CustomDebugStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var debugDescription: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `debugDescription` property.
    @objc public override var debugDescription: String { raw.debugDescription }
    public override var description: String {return raw.description }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    /// Requests product data from the App Store.
    /// - Parameter identifiers: A set of product identifiers to load from the App Store. If any
    ///                          identifiers are not found, they will be excluded from the return
    ///                          value.
    /// - Returns: An array of all the products received from the App Store.
    /// - Throws: `StoreKitError`
    @objc public static func products(
        for identifiers: [String],
        completionHandler: @escaping ([RvmProduct]?, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await Product.products(for: identifiers).map{ $0.toRvm()}, nil)
            } catch let e {
                completionHandler(nil, e.toRvmError())
            }
            return
        }.toRvm()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    /// The most recent transaction for the product, or `nil` if the user has never purchased this product.
    @objc public func latestTransaction(completionHandler: @escaping (VerificationResultTransaction?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await self.raw.latestTransaction?.toRvm()) }.toRvm()
    }

    /// The transaction that entitles the user to this product, or `nil` if the user is not currently entitled to
    /// this product.
    @objc public func currentEntitlement(completionHandler: @escaping (VerificationResultTransaction?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await self.raw.currentEntitlement?.toRvm()) }.toRvm()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {

    /// The format style to use when formatting numbers derived from the price for the product.
    ///
    /// Use `displayPrice` when possible. Use `priceFormatStyle` only for localizing numbers
    /// derived from the `price` property, such as "2 products for $(`price * 2`)".
    /// - Important: When using `priceFormatStyle` on systems earlier than iOS 16.0,
    ///              macOS 13.0, tvOS 16.0 or watchOS 9.0, the property may return a format style
    ///              with a sentinel locale with identifier "xx\_XX" in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error.
    //@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8x.0, visionOS 1.0, *)
    @objc public var priceFormatStyle: RvmFormatStyle_Currency { raw.priceFormatStyle.toRvm() }

    /// The format style to use when formatting subscription periods for the subscription.
    ///
    /// Use the `formatted(_:referenceDate:)` method on `Product.SubscriptionPeriod`
    /// with this style to format the subscription period for the App Store locale for the subscription.
    /// - Important: When using `subscriptionPeriodFormatStyle` on systems earlier than
    ///              iOS 16.0, macOS 13.0, tvOS 16.0 or watchOS 9.0, the property may return a
    ///              format style with a sentinel locale with identifier "xx\_XX" in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error.
    
    // TODO: FIXME: ComponentsFormatStyle missing:
    // @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    // @objc public var subscriptionPeriodFormatStyle: Date.ComponentsFormatStyle { raw.subscriptionPeriodFormatStyle }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension RvmProduct {

    /// The format style to use when formatting subscription period units for the subscription.
    ///
    /// Use the `formatted(_:)` method on `Product.SubscriptionPeriod.Unit` with this
    /// style to format the subscription period for the App Store locale for the subscription.
    public var subscriptionPeriodUnitFormatStyle: RvmProduct.SubscriptionPeriod.Unit.FormatStyle {
        return raw.subscriptionPeriodUnitFormatStyle.toRvm()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct {
    /// Information about a subscription offer configured in App Store Connect.
    ///
    @objc(RvmProduct_SubscriptionOffer)
    public class SubscriptionOffer : NSObject {
        let raw: Product.SubscriptionOffer
        init(raw: Product.SubscriptionOffer) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? SubscriptionOffer { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }


        @objc(RvmProduct_SubscriptionOffer_OfferType)
        public class OfferType : NSObject {
            let raw: Product.SubscriptionOffer.OfferType
            public init(raw: Product.SubscriptionOffer.OfferType) {
                self.raw = raw
            }
            
            public override func isEqual(_ object: Any?) -> Bool {
                return if let other = object as? OfferType { self.raw == other.raw } else { false }
            }

            public override var hash: Int { raw.hashValue }


            /// The corresponding value of the raw type.
            ///
            /// A new instance initialized with `rawValue` will be equivalent to this
            /// instance. For example:
            ///
            ///     enum PaperSize: String {
            ///         case A4, A5, Letter, Legal
            ///     }
            ///
            ///     let selectedSize = PaperSize.Letter
            ///     print(selectedSize.rawValue)
            ///     // Prints "Letter"
            ///
            ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
            ///     // Prints "true"
            @objc public var rawValue: String { raw.rawValue }

            /// Creates a new instance with the specified raw value.
            ///
            /// If there is no value of the type that corresponds with the specified raw
            /// value, this initializer returns `nil`. For example:
            ///
            ///     enum PaperSize: String {
            ///         case A4, A5, Letter, Legal
            ///     }
            ///
            ///     print(PaperSize(rawValue: "Legal"))
            ///     // Prints "Optional("PaperSize.Legal")"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: String) {
                self.raw = Product.SubscriptionOffer.OfferType(rawValue: rawValue)
            }

            @objc public static var introductory: RvmProduct.SubscriptionOffer.OfferType {
                Product.SubscriptionOffer.OfferType.introductory.toRvm()
            }

            @objc public static var promotional: RvmProduct.SubscriptionOffer.OfferType {
                Product.SubscriptionOffer.OfferType.promotional.toRvm()
            }

            @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
            @objc public static var winBack: RvmProduct.SubscriptionOffer.OfferType {
                Product.SubscriptionOffer.OfferType.winBack.toRvm()
            }
        }

        @objc(RvmProduct_SubscriptionOffer_PaymentMode)
        public class PaymentMode : NSObject {
            let raw: Product.SubscriptionOffer.PaymentMode
            public init(raw: Product.SubscriptionOffer.PaymentMode) {
                self.raw = raw
            }

            public override func isEqual(_ object: Any?) -> Bool {
                return if let other = object as? PaymentMode { self.raw == other.raw } else { false }
            }

            public override var hash: Int { raw.hashValue }


            /// The corresponding value of the raw type.
            ///
            /// A new instance initialized with `rawValue` will be equivalent to this
            /// instance. For example:
            ///
            ///     enum PaperSize: String {
            ///         case A4, A5, Letter, Legal
            ///     }
            ///
            ///     let selectedSize = PaperSize.Letter
            ///     print(selectedSize.rawValue)
            ///     // Prints "Letter"
            ///
            ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
            ///     // Prints "true"
            @objc public var rawValue: String { raw.rawValue }

            /// Creates a new instance with the specified raw value.
            ///
            /// If there is no value of the type that corresponds with the specified raw
            /// value, this initializer returns `nil`. For example:
            ///
            ///     enum PaperSize: String {
            ///         case A4, A5, Letter, Legal
            ///     }
            ///
            ///     print(PaperSize(rawValue: "Legal"))
            ///     // Prints "Optional("PaperSize.Legal")"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: String) {
                raw = Product.SubscriptionOffer.PaymentMode(rawValue: rawValue)
            }

            @objc public static var payAsYouGo: RvmProduct.SubscriptionOffer.PaymentMode {
                return Product.SubscriptionOffer.PaymentMode.payAsYouGo.toRvm()
            }

            @objc public static var payUpFront: RvmProduct.SubscriptionOffer.PaymentMode {
                return Product.SubscriptionOffer.PaymentMode.payUpFront.toRvm()
            }

            @objc public static var freeTrial: RvmProduct.SubscriptionOffer.PaymentMode {
                return Product.SubscriptionOffer.PaymentMode.freeTrial.toRvm()
            }
        }

        /// The offer identifier.
        ///
        /// This is always `nil` for introductory offers and never `nil` for other offer types.
        @objc public var id: String? { raw.id }

        /// The type of the offer.
        @objc public var type: RvmProduct.SubscriptionOffer.OfferType { raw.type.toRvm() }

        /// The discounted price that the offer provides in local currency.
        ///
        /// This is the price per period in the case of `.payAsYouGo`
        @objc public var price: NSDecimalNumber { raw.price as NSDecimalNumber }

        /// A localized string representation of `price`.
        @objc public var displayPrice: String { raw.displayPrice }

        /// The duration that this offer lasts before auto-renewing or changing to standard subscription
        /// renewals.
        @objc public var period: RvmProduct.SubscriptionPeriod { raw.period.toRvm() }

        /// The number of periods this offer will renew for.
        ///
        /// Always 1 except for `.payAsYouGo`.
        @objc public var periodCount: Int { raw.periodCount }

        /// How the user is charged for this offer.
        @objc public var paymentMode: RvmProduct.SubscriptionOffer.PaymentMode { raw.paymentMode.toRvm() }
    }
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmProduct.ProductType {
    public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.ProductType {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionPeriod {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `debugDescription` property for types that conform to
    /// `CustomDebugStringConvertible`:
    ///
    ///     struct Point: CustomDebugStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var debugDescription: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `debugDescription` property.
    public override var debugDescription: String { raw.debugDescription }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionPeriod {

    /// The range of the subscription period beginning at a reference date.
    ///
    /// Use this method with the `subscriptionPeriodFormatStyle` from a `Product`.
    /// - Parameter referenceDate: The date the range will begin at, default is now.
    /// - Returns: A range starting from `referenceDate` and ending after the subscription period.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public func dateRange(referenceDate: Date = .now) -> [Date] {
        let range = raw.dateRange(referenceDate: referenceDate)
        return [range.lowerBound, range.upperBound]
    }

// TODO: FIXME: FormatStyle is not available
//    /// Format the subscription period.
//    ///
//    /// Get a format style for a subscription from the `subscriptionPeriodFormatStyle` property of
//    /// `Product`.
//    /// - Parameters:
//    ///   - format: The format style to use.
//    ///   - referenceDate: The date to format in respect to, default is now.
//    /// - Returns: The result of formatting the subscription period with `format`.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
//    public func formatted<S>(_ format: S, referenceDate: Date = .now) -> S.FormatOutput where S : FormatStyle, S.FormatInput == Range<Date>
}

// TODO: FIXME: FormatStyle is not available
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
//extension ProductRvm.SubscriptionPeriod {
//
//    /// Format the subscription period.
//    ///
//    /// - Parameters:
//    ///   - format: The format style to use.
//    ///   - referenceDate: The date to format in respect to, default is now.
//    /// - Returns: The result of formatting the subscription period with `format`.
//    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
//    public func formatted<S>(_ format: S, referenceDate: Date = .now) -> S.FormatOutput where S : FormatStyle, S.FormatInput == Duration
//}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionPeriod {

    /// A period of one week.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var weekly: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.weekly.toRvm() }

    /// A period of one month.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var monthly: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.monthly.toRvm() }

    /// A period of one year.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var yearly: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.yearly.toRvm() }

    /// A period of three days.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var everyThreeDays: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.everyThreeDays.toRvm() }

    /// A period of two weeks.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var everyTwoWeeks: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.everyTwoWeeks.toRvm() }

    /// A period of two months.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var everyTwoMonths: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.everyTwoMonths.toRvm() }

    /// A period of three months.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var everyThreeMonths: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.everyThreeMonths.toRvm() }

    /// A period of six months.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public static var everySixMonths: RvmProduct.SubscriptionPeriod { return Product.SubscriptionPeriod.everySixMonths.toRvm() }
}


@available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
extension RvmProduct.SubscriptionInfo {

    /// The level of this subscription relative to other subscriptions in the same group.
    ///
    /// Subscriptions with a lower group level indicate a higher level of service. For example, if someone
    /// subscribes to a subscription with a group level lower than their current subscription, this would be
    /// an upgrade.
    /// - Important: When using `groupLevel` on systems earlier than iOS 17.0, macOS 14.0,
    ///              tvOS 17.0 or watchOS 10.0, the property may return a sentinel value of 0 in some
    ///              uncommon cases: (1) StoreKit Testing in Xcode (workaround: test your app on a
    ///              device running a more recent OS) or (2) a critical server error.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public var groupLevel: Int { raw.groupLevel }

    /// A localized display name of the subscription's group.
    ///
    /// To get the display name of the subscription itself, use ``Product/displayName`` on the
    /// corresponding ``Product`` value.
    /// - Important: When using `groupDisplayName` on systems earlier than iOS 17.0,
    ///              macOS 14.0, tvOS 17.0 or watchOS 10.0, the property may return a sentinel
    ///              empty string in some uncommon cases: (1) StoreKit Testing in Xcode
    ///              (workaround: test your app on a device running a more recent OS) or (2) a critical
    ///              server error.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @objc public var groupDisplayName: String { raw.groupDisplayName }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo {

    @objc(RvmProduct_SubscriptionInfo_RenewalState)
    public class RenewalState : NSObject {
        let raw: Product.SubscriptionInfo.RenewalState
        init(raw: Product.SubscriptionInfo.RenewalState) {
            self.raw = raw
        }

        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? RenewalState { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }

        
        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        public var rawValue: Int { raw.rawValue }

        /// Creates a new instance with the specified raw value.
        ///
        /// If there is no value of the type that corresponds with the specified raw
        /// value, this initializer returns `nil`. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     print(PaperSize(rawValue: "Legal"))
        ///     // Prints "Optional("PaperSize.Legal")"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Int) {
            self.raw = Product.SubscriptionInfo.RenewalState(rawValue: rawValue)
        }

        @objc public static var subscribed: RvmProduct.SubscriptionInfo.RenewalState { return Product.SubscriptionInfo.RenewalState.subscribed.toRvm() }

        @objc public static var expired: RvmProduct.SubscriptionInfo.RenewalState { return Product.SubscriptionInfo.RenewalState.expired.toRvm() }

        @objc public static var inBillingRetryPeriod: RvmProduct.SubscriptionInfo.RenewalState { return Product.SubscriptionInfo.RenewalState.inBillingRetryPeriod.toRvm() }

        @objc public static var inGracePeriod: RvmProduct.SubscriptionInfo.RenewalState { return Product.SubscriptionInfo.RenewalState.inGracePeriod.toRvm() }

        @objc public static var revoked: RvmProduct.SubscriptionInfo.RenewalState { return Product.SubscriptionInfo.RenewalState.revoked.toRvm() }
    }

    /// Represents signed renewal information for a purchase.
    @objc(RvmProduct_SubscriptionInfo_RenewalInfo)
    public class RenewalInfo: NSObject {
        let raw: Product.SubscriptionInfo.RenewalInfo
        init(raw: Product.SubscriptionInfo.RenewalInfo) {
            self.raw = raw
        }

        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? RenewalInfo { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }


        @objc(RvmProduct_SubscriptionInfo_RenewalInfo_ExpirationReason)
        public class ExpirationReason : NSObject {
            let raw: Product.SubscriptionInfo.RenewalInfo.ExpirationReason
            init(raw: Product.SubscriptionInfo.RenewalInfo.ExpirationReason) {
                self.raw = raw
            }

            public override func isEqual(_ object: Any?) -> Bool {
                return if let other = object as? ExpirationReason { self.raw == other.raw } else { false }
            }

            public override var hash: Int { raw.hashValue }

            /// The corresponding value of the raw type.
            ///
            /// A new instance initialized with `rawValue` will be equivalent to this
            /// instance. For example:
            ///
            ///     enum PaperSize: String {
            ///         case A4, A5, Letter, Legal
            ///     }
            ///
            ///     let selectedSize = PaperSize.Letter
            ///     print(selectedSize.rawValue)
            ///     // Prints "Letter"
            ///
            ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
            ///     // Prints "true"
            @objc public var rawValue: Int { raw.rawValue }

            /// Creates a new instance with the specified raw value.
            ///
            /// If there is no value of the type that corresponds with the specified raw
            /// value, this initializer returns `nil`. For example:
            ///
            ///     enum PaperSize: String {
            ///         case A4, A5, Letter, Legal
            ///     }
            ///
            ///     print(PaperSize(rawValue: "Legal"))
            ///     // Prints "Optional("PaperSize.Legal")"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: Int) {
                self.raw = Product.SubscriptionInfo.RenewalInfo.ExpirationReason(rawValue: rawValue)
            }

            @objc public static var autoRenewDisabled: RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason {
                return Product.SubscriptionInfo.RenewalInfo.ExpirationReason.autoRenewDisabled.toRvm()
            }

            @objc public static var billingError: RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason {
                return Product.SubscriptionInfo.RenewalInfo.ExpirationReason.billingError.toRvm()
            }

            @objc public static var didNotConsentToPriceIncrease: RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason {
                return Product.SubscriptionInfo.RenewalInfo.ExpirationReason.didNotConsentToPriceIncrease.toRvm()
            }

            @objc public static var productUnavailable: RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason {
                return Product.SubscriptionInfo.RenewalInfo.ExpirationReason.productUnavailable.toRvm()
            }

            @objc public static var unknown: RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason {
                return Product.SubscriptionInfo.RenewalInfo.ExpirationReason.unknown.toRvm()
            }
        }

        @objc(RvmProduct_SubscriptionInfo_RenewalInfo_PriceIncreaseStatus)
        public enum PriceIncreaseStatus : Int {
            case unknown
            
            case noIncreasePending

            case pending

            case agreed
        }

        /// The JSON representation of the renewal information.
        @objc public var jsonRepresentation: Data { raw.jsonRepresentation }

        /// The original transaction identifier for the subscription group.
        @objc public var originalTransactionID: UInt64 { raw.originalTransactionID }

        /// The currently active product identifier, or the most recently active product identifier if the
        /// subscription is expired.
        @objc public var currentProductID: String { raw.currentProductID }

        /// Whether the subscription will auto renew at the end of the current billing period.
        @objc public var willAutoRenew: Bool { raw.willAutoRenew }

        /// The product identifier the subscription will auto renew to at the end of the current billing period.
        ///
        /// If the user disabled auto renewing, this property will be `nil`.
        @objc public var autoRenewPreference: String? { raw.autoRenewPreference }

        /// The reason the subscription expired.
        @objc public var expirationReason: RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason? { raw.expirationReason?.toRvm() }

        /// The status of a price increase for the user.
        @objc public var priceIncreaseStatus: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus { raw.priceIncreaseStatus.toRvm() }

        /// Whether the subscription is in a billing retry period.
        @objc public var isInBillingRetry: Bool { raw.isInBillingRetry }

        /// The date the billing grace period will expire.
        @objc public var gracePeriodExpirationDate: Date? { raw.gracePeriodExpirationDate }

        /// A subscription offer that applies at the next renewal period.
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @objc public var offer: RvmTransaction.Offer? { raw.offer?.toRvm() }

        /// Identifies the offer that will be applied to the next billing period.
        ///
        /// If `offerType` is `promotional`, this will be the offer identifier. If `offerType` is
        /// `code`, this will be the offer code reference name. This will be `nil` for `introductory`
        /// offers and if there will be no offer applied for the next billing period.
        @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.id", message: "Use the offer property instead")
        @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "offer.id", message: "Use the offer property instead")
        @available(tvOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.id", message: "Use the offer property instead")
        @available(watchOS, introduced: 8.0, deprecated: 11.0, renamed: "offer.id", message: "Use the offer property instead")
        @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "offer.id", message: "Use the offer property instead")
        @objc public var offerID: String? { raw.offerID }

        /// The type of the offer that will be applied to the next billing period.
        @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.type", message: "Use the offer property instead")
        @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "offer.type", message: "Use the offer property instead")
        @available(tvOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.type", message: "Use the offer property instead")
        @available(watchOS, introduced: 8.0, deprecated: 11.0, renamed: "offer.type", message: "Use the offer property instead")
        @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "offer.type", message: "Use the offer property instead")
        @objc public var offerType: RvmTransaction.OfferType? { raw.offerType?.toRvm() }

        /// The string representation of the payment mode applied to the subscription offer for this transaction.
        ///
        /// - Note: Only when there is an offer for this subscription.
        ///
        /// - Important: The property may return a `nil` value in some cases:
        ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS),
        ///              (2) older transaction information where this field is absent, or (3) a critical server error.
        @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
        @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
        @available(tvOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
        @available(watchOS, introduced: 8.0, deprecated: 11.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
        @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
        @objc public var offerPaymentModeStringRepresentation: String? { raw.offerPaymentModeStringRepresentation }

        /// The server environment the renewal info was created in.
        @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
        @objc public var environment: RvmAppStore.Environment { raw.environment.toRvm() }

        /// The server environment the renewal info was created in.
        ///
        /// The possible values this can return are "Production" for apps downloaded from the App Store,
        /// "Sandbox" for the App Store Sandbox and apps downloaded from TestFlight, and "Xcode"
        /// for StoreKit Testing in Xcode.
        /// - Important: The property may return a sentinel empty string in some uncommon cases:
        ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running
        ///              a more recent OS) or (2) a critical server error. If possible, use the
        ///              ``Product/SubscriptionInfo/RenewalInfo/environment``
        ///              property to guarantee a valid value.
        @available(iOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
        @available(macOS, introduced: 12.0, deprecated: 13.0, message: "Use the environment property instead")
        @available(tvOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
        @available(watchOS, introduced: 8.0, deprecated: 9.0, message: "Use the environment property instead")
        @available(macCatalyst, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
        @available(visionOS, unavailable)
        @objc public var environmentStringRepresentation: String { raw.environmentStringRepresentation }

        /// The date that marks the start of the most recent period of *continuous subscription*.
        ///
        /// A period is considered a *continuous subscription* if there is no more than a 60 day gap
        /// between any two subscribed periods.
        /// - Important: When using `recentSubscriptionStartDate` on systems earlier than
        ///              iOS 16.0, macOS 13.0, tvOS 16.0 or watchOS 9.0, the property may return
        ///              a sentinel date equal to `Date.distantPast` in some uncommon cases:
        ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running
        ///              a more recent OS) or (2) a critical server error.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @objc public var recentSubscriptionStartDate: Date { raw.recentSubscriptionStartDate }

        /// The date of the next subscription renewal.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @objc public var renewalDate: Date? { raw.renewalDate }

        /// The amount that will be charged to the customer on the next renewal date.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @objc public var renewalPrice: NSDecimalNumber? { raw.renewalPrice as? NSDecimalNumber }

        /// The `Locale.Currency` used for the purchase.
        ///
        /// - Important: The currency value is nil if the renewalPrice is unavailable.
        @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
        @objc public var currencyIdentifier: String? { raw.currency?.identifier }

        /// ISO3A code for the currency used for the purchase.
        ///
        /// - Important: The property may return a `nil` value in some uncommon cases:
        ///              (1) The renewalPrice is also `nil`, (2) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS)
        ///              or (3) a critical server error.
        @available(iOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead")
        @available(macOS, introduced: 12.0, deprecated: 13.0, renamed: "currency.identifier", message: "Use the currency property instead")
        @available(tvOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead")
        @available(watchOS, introduced: 8.0, deprecated: 9.0, renamed: "currency.identifier", message: "Use the currency property instead")
        @available(visionOS, unavailable)
        @objc public var currencyCode: String? { raw.currencyCode }

        /// List of win-back offers the user is eligible to apply to a purchase for this subscription group.
        /// - Note: The first item in the list is the best fit offer for the current user.
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @objc public var eligibleWinBackOfferIDs: [String] { raw.eligibleWinBackOfferIDs }

        /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
        /// `deviceVerificationNonce` (both lowercased UUID strings).
        @objc public var deviceVerification: Data { raw.deviceVerification }

        /// The nonce used when computing `deviceVerification`.
        /// - SeeAlso: `AppStore.deviceVerificationID`
        @objc public var deviceVerificationNonce: UUID { raw.deviceVerificationNonce }

        /// The date this renewal info was generated and signed.
        @objc public var signedDate: Date { raw.signedDate }
    }

    @objc(RvmProduct_SubscriptionInfo_Status)
    public class Status : NSObject {
        let raw: Product.SubscriptionInfo.Status
        init (raw: Product.SubscriptionInfo.Status) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Status { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }

        @objc public var state: RvmProduct.SubscriptionInfo.RenewalState { raw.state.toRvm() }

        @objc public var transaction: VerificationResultTransaction { raw.transaction.toRvm() }

        @objc public var renewalInfo: VerificationResultRenewalInfo { raw.renewalInfo.toRvm() }
    }

    @objc public func status(completionHandler: @escaping ([RvmProduct.SubscriptionInfo.Status]?, Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await self.raw.status.map { $0.toRvm() }, nil)
            } catch let error {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }

    @objc public static func status(for groupID: String, completionHandler: @escaping ([RvmProduct.SubscriptionInfo.Status]?, Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await Product.SubscriptionInfo.status(for: groupID).map { $0.toRvm() }, nil)
            } catch let error {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc(RvmVerificationResult_RenewalInfo) public class VerificationResultRenewalInfo: NSObject {
    let raw: VerificationResult<Product.SubscriptionInfo.RenewalInfo>
    @objc public let isVerified: Bool

    init(raw: VerificationResult<Product.SubscriptionInfo.RenewalInfo>) {
        self.raw = raw
        if case .verified(_) = raw { self.isVerified = true } else { self.isVerified = false }
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? VerificationResultRenewalInfo { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }
    
    @objc public func getPayloadValue() throws -> RvmProduct.SubscriptionInfo.RenewalInfo {
        return try raw.payloadValue.toRvm()
    }
    
    /// Ignore the result of StoreKit's verification, and get the payload value.
    /// - SeeAlso: In order to check whether StoreKit was able to verify the signature,  use the
    ///           `payloadValue` property or a pattern matching technique such as a switch
    ///            statement.
    @objc public var unsafePayloadValue: RvmProduct.SubscriptionInfo.RenewalInfo { raw.unsafePayloadValue.toRvm() }

    @objc public var error: NSError? {
        guard case let .unverified(_, error) = raw else { return nil }
        return error.toRvm()
    }
    
    /// The raw JSON web signature for the signed value.
    @objc public var jwsRepresentation: String { raw.jwsRepresentation }

    /// The data for the header component of the JWS.
    @objc public var headerData: Data { raw.headerData }

    /// The data for the payload component of the JWS.
    @objc public var payloadData: Data { raw.payloadData }

    /// The data for the signature component of the JWS.
    @objc public var signatureData: Data { raw.signatureData }

    /// The signature of the JWS, converted to a `CryptoKit` value.
    @objc public var signature: RvmECDSASignature { raw.signature.toRvm() }

    /// The component of the JWS that the signature is computed over.
    @objc public var signedData: Data { raw.signedData }

    /// The date the signature was generated.
    @objc public var signedDate: Date { raw.signedDate }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    @objc public var deviceVerification: Data { raw.deviceVerification }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    @objc public var deviceVerificationNonce: UUID { raw.deviceVerificationNonce }

    public override var description: String { raw.debugDescription }
}



@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.PurchaseOption {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `debugDescription` property for types that conform to
    /// `CustomDebugStringConvertible`:
    ///
    ///     struct Point: CustomDebugStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var debugDescription: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `debugDescription` property.
    @objc public override var debugDescription: String { raw.debugDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionOffer {

    /// The metadata of the signature used to validate a promotional offer.
    @available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
    @objc(RvmProduct_SubscriptionInfo_Signature)
    public class Signature : NSObject {
        let raw: Product.SubscriptionOffer.Signature
        public init(raw: Product.SubscriptionOffer.Signature) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Signature { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }
        
        /// The key ID of the private key used to generate `signature`. The private key and key ID
        /// can be generated on App Store Connect.
        @objc public var keyID: String { raw.keyID }
        
        /// The nonce used in `signature`.
        @objc public var nonce: UUID { raw.nonce }
        
        /// The time the signature was generated in milliseconds since 1970.
        @objc public var timestamp: Int { raw.timestamp }
        
        /// The cryptographic signature of the offer parameters, generated on your server.
        @objc public var signature: Data { raw.signature }
        
        /// Create a new signature to validate a promotional offer.
        ///
        /// - Parameters:
        ///     - keyID: The key ID of the private key used to generate `signature`. The private key and key ID
        ///              can be generated on App Store Connect.
        ///     - nonce: The nonce used in `signature`.
        ///     - timestamp: The time the signature was generated in milliseconds since 1970.
        ///     - signature: The cryptographic signature of the offer parameters, generated on your server.
        public init(keyID: String, nonce: UUID, timestamp: Int, signature: Data) {
            self.raw = Product.SubscriptionOffer.Signature(keyID: keyID, nonce: nonce, timestamp: timestamp, signature: signature)
        }
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionPeriod.Unit {
    
    /// A format style used for localizing subscription period units.
    ///
    /// Get the format style for a subscription via the `subscriptionPeriodUnitFormatStyle`
    /// property of `Product`.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @objc(RvmProduct_SubscriptionPeriod_Unit_FormatStyle)
    public class FormatStyle : NSObject {
        let raw: Product.SubscriptionPeriod.Unit.FormatStyle
        init (raw: Product.SubscriptionPeriod.Unit.FormatStyle) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? FormatStyle { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }

        
        /// Get a human readable representation of the unit, localized for the subscription the format style
        /// is from.
        @objc public func format(_ value: RvmProduct.SubscriptionPeriod.Unit) -> String {
            return raw.format(value.toRaw())
        }
        
        /// If the format allows selecting a locale, returns a copy of this format with the new locale set. Default implementation returns an unmodified self.
        @objc public func locale(_ locale: Locale) -> RvmProduct.SubscriptionPeriod.Unit.FormatStyle {
            return raw.locale(locale).toRvm()
        }
        
        /// Encodes this value into the given encoder.
        ///
        /// If the value fails to encode anything, `encoder` will encode an empty
        /// keyed container in its place.
        ///
        /// This function throws an error if any values are invalid for the given
        /// encoder's format.
        ///
        /// - Parameter encoder: The encoder to write data to.
        public func encode(to encoder: any Encoder) throws {
            try raw.encode(to: encoder)
        }
        
        /// Creates a new instance by decoding from the given decoder.
        ///
        /// This initializer throws an error if reading from the decoder fails, or
        /// if the data read is corrupted or otherwise invalid.
        ///
        /// - Parameter decoder: The decoder to read data from.
        public init(from decoder: any Decoder) throws {
            self.raw = try Product.SubscriptionPeriod.Unit.FormatStyle(from: decoder)
        }
    }
}


@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo.RenewalState {
    @objc public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo.RenewalState {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo.RenewalInfo {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `debugDescription` property for types that conform to
    /// `CustomDebugStringConvertible`:
    ///
    ///     struct Point: CustomDebugStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var debugDescription: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `debugDescription` property.
    @objc public override var debugDescription: String { raw.debugDescription }
    @objc public override var description: String { raw.debugDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo.Status {
    @objc public static var updates: RvmAsyncSequence<RvmProduct.SubscriptionInfo.Status> {
        return Product.SubscriptionInfo.Status.updates.toRvm()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo.Status {
    @objc(RvmProduct_SubscriptionInfo_Status_Pair)
    public class Pair : NSObject {
        @objc public let groupID: String
        @objc public let statuses: [RvmProduct.SubscriptionInfo.Status]
        init (groupID: String, statuses: [RvmProduct.SubscriptionInfo.Status]) {
            self.groupID = groupID
            self.statuses = statuses
        }
    }


    /// A sequence of the subscription status for each of the app's subscription groups.
    ///
    /// If `statuses` is empty, or a `groupID` isn't present in the sequence, the user has never been
    /// subscribed to a subscription in the group. For subscriptions which support family sharing,
    /// `statuses` may have several elements, representing the status of family member's subscriptions.
    /// If the subscription does not support family sharing, statuses will have 0 or 1 elements.
    ///
    /// - Note: For apps which support operating systems where this API is unavailable, use
    ///         ``Product/SubscriptionInfo/status(for:)`` to check the status for each
    ///         individual subscription group.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    @objc public static var all: RvmAsyncSequence<RvmProduct.SubscriptionInfo.Status.Pair> {
        return Product.SubscriptionInfo.Status.all.toRvm()
    }
}


@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmProduct.SubscriptionOffer.OfferType {
    @objc public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionOffer.OfferType {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmProduct.SubscriptionOffer.PaymentMode {
    @objc public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionOffer.PaymentMode {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason {
    @objc public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}


