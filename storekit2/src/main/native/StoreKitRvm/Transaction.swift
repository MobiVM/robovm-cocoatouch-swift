import Foundation
import StoreKit


/// Represents signed transaction information for a purchase.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc public class RvmTransaction : NSObject {

    let raw: Transaction
    init(raw: Transaction) {
        self.raw = raw
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmTransaction { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }

    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @objc(RvmTransaction_Reason)
    public class Reason : NSObject {
        let raw: Transaction.Reason
        init(raw: Transaction.Reason) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Reason { self.raw == other.raw } else { false }
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
            self.raw = Transaction.Reason(rawValue: rawValue)
        }

        /// The transaction is a purchase
        @objc public static var purchase: RvmTransaction.Reason { return Transaction.Reason.purchase.toRvm() }

        /// The transaction is a subscription renewal
        @objc public static var renewal: RvmTransaction.Reason { return Transaction.Reason.renewal.toRvm() }
    }

    @objc(RvmTransaction_RevocationReason)
    public class RevocationReason: NSObject {
        let raw: Transaction.RevocationReason
        init(raw: Transaction.RevocationReason) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? RevocationReason { self.raw == other.raw } else { false }
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
            self.raw = Transaction.RevocationReason(rawValue: rawValue)
        }

        /// The user refunded the transaction due to an issue in your app.
        @objc public static var developerIssue: RvmTransaction.RevocationReason {
            return Transaction.RevocationReason.developerIssue.toRvm()
        }

        /// The transaction was revoked for some other reason.
        @objc public static var other: RvmTransaction.RevocationReason {
            return Transaction.RevocationReason.other.toRvm()
        }
    }

    @objc(RvmTransaction_OfferType)
    public class OfferType : NSObject {
        let raw: Transaction.OfferType
        public init(raw: Transaction.OfferType) {
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
            raw = Transaction.OfferType(rawValue: rawValue)
        }

        @objc public static var introductory: RvmTransaction.OfferType { return Transaction.OfferType.introductory.toRvm() }

        @objc public static var promotional: RvmTransaction.OfferType { return Transaction.OfferType.promotional.toRvm() }

        @objc public static var code: RvmTransaction.OfferType { return Transaction.OfferType.code.toRvm() }

        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @objc public static var winBack: RvmTransaction.OfferType { return Transaction.OfferType.winBack.toRvm() }
    }

    @objc(RvmTransaction_OwnershipType)
    public class OwnershipType : NSObject {
        let raw: Transaction.OwnershipType
        public init(raw: Transaction.OwnershipType) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? OwnershipType { self.raw == other.raw } else { false }
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
        @objc public init(rawValue: String) {
            self.raw = Transaction.OwnershipType(rawValue: rawValue)
        }

        /// The current user is the purchaser of the transaction.
        @objc public static var purchased: RvmTransaction.OwnershipType { return Transaction.OwnershipType.purchased.toRvm() }

        /// The user has access to this transaction through family sharing.
        @objc public static var familyShared: RvmTransaction.OwnershipType { return Transaction.OwnershipType.familyShared.toRvm() }
    }

    /// Details for the offer applied to this transaction.
    @available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
    @objc(RvmTransaction_Offer)
    public class Offer : NSObject {
        let raw: Transaction.Offer
        init(raw: Transaction.Offer) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Offer { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }


        /// The type of payment used for the offer.
        @objc(RvmTransaction_Offer_PaymentMode)
        public class PaymentMode : NSObject {
            let raw: Transaction.Offer.PaymentMode
            init(raw: Transaction.Offer.PaymentMode) {
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
                self.raw = Transaction.Offer.PaymentMode(rawValue: rawValue)
            }

            @objc public static var freeTrial: RvmTransaction.Offer.PaymentMode {
                return Transaction.Offer.PaymentMode.freeTrial.toRvm()
            }

            @objc public static var payAsYouGo: RvmTransaction.Offer.PaymentMode {
                return Transaction.Offer.PaymentMode.payAsYouGo.toRvm()
            }

            @objc public static var payUpFront: RvmTransaction.Offer.PaymentMode {
                Transaction.Offer.PaymentMode.payUpFront.toRvm()
            }
        }

        /// Identifies the offer applied to this transaction for `promotional` and `code` offer types.
        ///
        /// If `offerType` is `promotional`, this will be the offer identifier. If `offerType` is `code`,
        /// this will be the offer code reference name. This will be `nil` for `introductory` offers and if
        /// there is no offer applied.
        @objc public var id: String? { raw.id }

        /// The type of subscription offer applied to this transaction.
        @objc public var type: RvmTransaction.OfferType { raw.type.toRvm() }

        /// The payment mode of the offer applied to a transaction.
        /// - Note: The payment mode may be unknown for transactions created before the release of App Store Server API 1.10.
        ///         If the payment mode is unknown, the property is nil.
        @objc public var paymentMode: RvmTransaction.Offer.PaymentMode? { raw.paymentMode?.toRvm() }
    }

    /// The JSON representation of the transaction.
    @objc public var jsonRepresentation: Data { raw.jsonRepresentation }

    /// Unique ID for the transaction.
    @objc public var id: UInt64 { raw.id }

    /// The ID of the original transaction for `productID` or`subscriptionGroupID` if this is a
    /// subscription.
    @objc public var originalID: UInt64 { raw.originalID }

    /// Uniquely identifies a subscription purchase.
    /// - Note: Only for subscriptions.
    @objc public var webOrderLineItemID: String? { raw.webOrderLineItemID }

    /// Identifies the product the transaction is for.
    @objc public var productID: String { raw.productID }

    /// Identifies the subscription group the transaction is for.
    /// - Note: Only for subscriptions.
    @objc public var subscriptionGroupID: String? { raw.subscriptionGroupID }

    /// Identifies the application the transaction is for.
    @objc public var appBundleID: String { raw.appBundleID }

    /// The date this transaction occurred on.
    @objc public var purchaseDate: Date { raw.purchaseDate }

    /// The date the original transaction for `productID` or`subscriptionGroupID` occurred on.
    @objc public var originalPurchaseDate: Date { raw.originalPurchaseDate }

    /// The date the users access to `productID` expires
    /// - Note: Only for subscriptions.
    @objc public var expirationDate: Date? { raw.expirationDate }

    /// Quantity of `productID` purchased in the transaction.
    /// - Note: Always 1 for non-consumables and auto-renewable suscriptions.
    @objc public var purchasedQuantity: Int { raw.purchasedQuantity }

    /// If this transaction was upgraded to a subscription with a higher level of service.
    /// - Important: If this property is `true`, look for a new transaction for a subscription with a
    ///              higher level of service.
    /// - Note: Only for subscriptions.
    @objc public var isUpgraded: Bool { raw.isUpgraded }

    /// The offer applied to this transaction.
    /// - Note: Only for subscriptions.
    @available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
    @objc public var offer: RvmTransaction.Offer? { raw.offer?.toRvm() }

    /// The type of subscription offer applied to this transaction.
    /// - Note: Only for subscriptions.
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.type", message: "Use the offer property instead")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.type", message: "Use the offer property instead")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.type", message: "Use the offer property instead")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.type", message: "Use the offer property instead")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.type", message: "Use the offer property instead")
    @objc public var offerType: RvmTransaction.OfferType? { raw.offerType?.toRvm() }

    /// Identifies the offer applied to this transaction for `promotional` and `code` offer types.
    ///
    /// If `offerType` is `promotional`, this will be the offer identifier. If `offerType` is `code`,
    /// this will be the offer code reference name. This will be `nil` for `introductory` offers and if
    /// there is no offer applied.
    /// - Note: Only for subscriptions.
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.id", message: "Use the offer property instead")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.id", message: "Use the offer property instead")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.id", message: "Use the offer property instead")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.id", message: "Use the offer property instead")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.id", message: "Use the offer property instead")
    @objc public var offerID: String? { raw.offerID }

    /// The string representation of the payment mode applied to the subscription offer for this transaction.
    ///
    /// - Note: Only for subscriptions and when there is an `offer`.
    ///         The payment mode may be unknown for transactions created before the release of App Store Server API 1.10.
    ///         If the payment mode is unknown, the property is nil.
    ///
    /// - Important: The property may return a sentinel nil value in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS),
    ///              or (2) a critical server error.
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead")
    @objc public var offerPaymentModeStringRepresentation: String? { raw.offerPaymentModeStringRepresentation }

    /// The date the transaction was revoked, or `nil` if it was not revoked.
    @objc public var revocationDate: Date? { raw.revocationDate }

    /// The reason the transaction was revoked, or `nil` if it was not revoked.
    @objc public var revocationReason: RvmTransaction.RevocationReason? { raw.revocationReason?.toRvm() }

    /// The type of `productID`.
    @objc public var productType: RvmProduct.ProductType { raw.productType.toRvm() }

    /// If an app account token was added as a purchase option when purchasing, this property will
    /// be the token provided. If no token was provided, this will be `nil`.
    @objc public var appAccountToken: UUID? { raw.appAccountToken }

    /// The server environment the transaction was created in.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @objc public var environment: RvmAppStore.Environment { raw.environment.toRvm() }

    /// The server environment the transaction was created in.
    ///
    /// The possible values this can return are "Production" for apps downloaded from the App Store,
    /// "Sandbox" for the App Store Sandbox and apps downloaded from TestFlight, and "Xcode" for
    /// StoreKit Testing in Xcode.
    /// - Important: The property may return a sentinel empty string in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error. If possible, use the
    ///              ``Transaction/environment`` property to guarantee a valid value.
    @available(iOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
    @available(macOS, introduced: 12.0, deprecated: 13.0, message: "Use the environment property instead")
    @available(tvOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
    @available(watchOS, introduced: 8.0, deprecated: 9.0, message: "Use the environment property instead")
    @available(macCatalyst, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
    @available(visionOS, unavailable)
    @objc public var environmentStringRepresentation: String { raw.environmentStringRepresentation }

    /// The reason for the transaction.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @objc public var reason: RvmTransaction.Reason { raw.reason.toRvm() }

    /// The reason for the transaction.
    ///
    /// The possible values this can return are "PURCHASE" when a transaction is the result of a change of service,
    /// or "RENEWAL" when a transaction is the result of a subscription renewing.
    /// - Important: When using `reasonStringRepresentation` on systems earlier than
    ///              iOS 17.0, macOS 14.0, tvOS 17.0 or watchOS 10.0, the property may return
    ///              a sentinel string equal to "PURCHASE" in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error. If possible, use the
    ///              ``Transaction/reason`` property to guarantee a valid value.
    @available(iOS, introduced: 15.0, deprecated: 17.0, message: "Use the reason property instead")
    @available(macOS, introduced: 12.0, deprecated: 14.0, message: "Use the reason property instead")
    @available(tvOS, introduced: 15.0, deprecated: 17.0, message: "Use the reason property instead")
    @available(watchOS, introduced: 8.0, deprecated: 10.0, message: "Use the reason property instead")
    @available(macCatalyst, introduced: 15.0, deprecated: 17.0, message: "Use the reason property instead")
    @available(visionOS, unavailable)
    @objc public var reasonStringRepresentation: String { raw.reasonStringRepresentation }

    /// The `Storefront` the transaction was completed in.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    @objc public var storefront: RvmStorefront { raw.storefront.toRvm() }

    /// The  ISO alpha-3 country code of the `Storefront` the transaction was completed in.
    ///
    /// - Important: When using `storefrontCountryCode` on systems earlier than
    ///              iOS 17.0, macOS 14.0, tvOS 17.0 or watchOS 10.0, the property may return
    ///              a sentinel empty string in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error. If possible, use the
    ///              ``Transaction/storefront`` property to guarantee a valid value.
    @available(iOS, introduced: 15.0, deprecated: 17.0, message: "Use the storefront property instead")
    @available(macOS, introduced: 12.0, deprecated: 14.0, message: "Use the storefront property instead")
    @available(tvOS, introduced: 15.0, deprecated: 17.0, message: "Use the storefront property instead")
    @available(watchOS, introduced: 8.0, deprecated: 10.0, message: "Use the storefront property instead")
    @available(macCatalyst, introduced: 15.0, deprecated: 17.0, message: "Use the storefront property instead")
    @available(visionOS, unavailable)
    @objc public var storefrontCountryCode: String { raw.storefrontCountryCode }

    /// Amount charged to the customer when purchasing this offer.
    ///
    /// - Important: The property may return a `nil` value in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS)
    ///              or (2) a critical server error.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var price: NSDecimalNumber? { raw.price as? NSDecimalNumber }

    /// The `Locale.Currency` used for the purchase.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @objc public var currencyIdentifier: String? { raw.currency?.identifier }

    /// ISO3A code for the currency used for the purchase.
    ///
    /// - Important: The property may return a `nil` value in some uncommon cases:
    ///              (1) The price is also `nil`, (2) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS)
    ///              or (3) a critical server error.
    @available(iOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(macOS, introduced: 12.0, deprecated: 13.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(tvOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(watchOS, introduced: 8.0, deprecated: 9.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "currency.identifier", message: "Use the currency property instead")
    @objc public var currencyCode: String? { raw.currencyCode }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    @objc public var deviceVerification: Data { raw.deviceVerification }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    @objc public var deviceVerificationNonce: UUID { raw.deviceVerificationNonce }

    /// Whether the user purchased this transaction, or has access to it via family sharing.
    @objc public var ownershipType: RvmTransaction.OwnershipType { raw.ownershipType.toRvm() }

    /// The date this transaction was generated and signed.
    @objc public var signedDate: Date { raw.signedDate }

    /// Call this method after giving the user access to `productID`.
    @objc public func finish(completionHandler: @escaping () -> Void) -> RvmTask {
        return Task.detached {
            await self.raw.finish()
            completionHandler()
            return
        }.toRvm()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmTransaction {

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
extension RvmTransaction {

    /// A sequence of every transaction for this user and app.
    @objc public static var all: RvmAsyncSequence<VerificationResultTransaction> { return Transaction.all.toRvm() }

    /// Returns all transactions for products the user is currently entitled to
    ///
    /// i.e. all currently-subscribed transactions, and all purchased (and not refunded) non-consumables
    @objc public static var currentEntitlements: RvmAsyncSequence<VerificationResultTransaction> { Transaction.currentEntitlements.toRvm() }

    /// Get the transaction that entitles the user to a product.
    /// - Parameter productID: Identifies the product to check entitlements for.
    /// - Returns: A transaction if the user is entitled to the product, or `nil` if they are not.
    @objc public static func currentEntitlement(for productID: String, completionHandler: @escaping (VerificationResultTransaction?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await Transaction.currentEntitlement(for: productID)?.toRvm()) }.toRvm()
    }

    /// The user's latest transaction for a product.
    /// - Parameter productID: Identifies the product to check entitlements for.
    /// - Returns: A verified transaction, or `nil` if the user has never purchased this product.
    @objc public static func latest(for productID: String, completionHandler: @escaping (VerificationResultTransaction?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await Transaction.latest(for: productID)?.toRvm()) }.toRvm()
    }

    /// A sequence of every unfinished transaction for this user and app.
    @objc public static var unfinished: RvmAsyncSequence<VerificationResultTransaction> { return Transaction.unfinished.toRvm() }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmTransaction {

    /// A sequence that emits a transaction each time it is created or updated.
    /// - Important: Create a `Task` to iterate this sequence as early as possible when your app
    ///              launches. This is important, for example, to handle transactions that may have
    ///              occured after `purchase` returns, like an adult approving a child's purchase
    ///              request or a purchase made on another device.
    /// - Note: Any unfinished transactions will be emitted from `updates` when you first iterate the
    ///         sequence.
    @objc public static var updates: RvmAsyncSequence<VerificationResultTransaction> { return Transaction.updates.toRvm() }
}

@available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension RvmTransaction {

    @objc public static let RefundRequestErrorDomain = "TransactionRvm.RefundRequestErrorDomain"

    @available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    @objc(RvmTransaction_RefundRequestError)
    public enum RefundRequestError : Int {
        case unknown = -1

        case duplicateRequest
        case failed
    }

    @available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    @objc(RvmTransaction_RefundRequestStatus)
    public enum RefundRequestStatus: Int {
        case unknown = -1

        /// The user successfully requested a refund
        /// - Note: This does not mean the refund was approved yet.
        case success

        /// The user cancelled the refund request.
        case userCancelled
    }

    /// Display the refund request sheet for this transaction.
    /// - Parameter scene: The window scene to present the refund request sheet in.
    /// - Returns: The result of the refund request.
    /// - Throws: `RefundRequestError` or `StoreKitError`.
    @available(iOS 15.0, visionOS 1.0, *)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc public func beginRefundRequest(
        in scene: UIWindowScene,
        completionHandler: @escaping (RvmTransaction.RefundRequestStatus, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await self.raw.beginRefundRequest(in: scene).toRvm(), nil)
            } catch let e {
                completionHandler(RefundRequestStatus.unknown, e.toRvmError())
            }
            return
        }.toRvm()
    }

    /// Display the refund request sheet.
    /// - Parameters:
    ///   - transactionID: The transaction ID to request a refund for.
    ///   - scene: The window scene to present the refund request sheet in.
    /// - Returns: The result of the refund request.
    /// - Throws: `RefundRequestError` or `StoreKitError`.
    @available(iOS 15.0, visionOS 1.0, *)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc @MainActor public static func beginRefundRequest(
        for transactionID: UInt64,
        in scene: UIWindowScene,
        completionHandler: @escaping (RvmTransaction.RefundRequestStatus, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await Transaction.beginRefundRequest(for: transactionID, in: scene).toRvm(), nil)
            } catch let e {
                completionHandler(RefundRequestStatus.unknown, e.toRvmError())
            }
            return
        }.toRvm()
    }    
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmTransaction {

    /// The full subscription status for the transaction.
    ///
    /// If the transaction is not for a subscription (i.e. ``Transaction/productType`` is not
    /// ``Product/ProductType/autoRenewable``), the value will always be `nil`. The value
    /// may be `nil` if there is an error retrieving the subscription status.
    ///
    /// - Note: The value's ``Product/SubscriptionInfo/Status/transaction`` property
    ///         represents the latest transaction for the subscription, which is not necessarily the same
    ///         as this transaction.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public func subscriptionStatus(completionHandler: @escaping (RvmProduct.SubscriptionInfo.Status?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await self.raw.subscriptionStatus?.toRvm()) }.toRvm()
    }
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmTransaction.RevocationReason {
    public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmTransaction.RevocationReason {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmTransaction.OfferType {
    public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmTransaction.OfferType {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension RvmTransaction.OwnershipType {
    public var localizedDescription: String { raw.localizedDescription }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmTransaction.OwnershipType {
    @objc public override var description: String {
        return if #available(iOS 15.4, *) { localizedDescription } else { super.description }
    }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc(RvmVerificationResult_Transaction)
public class VerificationResultTransaction: NSObject {
    let raw: VerificationResult<Transaction>
    @objc public let isVerified: Bool

    init(raw: VerificationResult<Transaction>) {
        self.raw = raw
        if case .verified(_) = raw { self.isVerified = true } else { self.isVerified = false }
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? VerificationResultTransaction { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }

    
    /// Get the payload value from this verification result.
    /// - Throws: `VerificationResult.VerificationError` if the value is unverified.
    @objc public func getPayloadValue() throws -> RvmTransaction {
        return try raw.payloadValue.toRvm()
    }
    
    /// Ignore the result of StoreKit's verification, and get the payload value.
    /// - SeeAlso: In order to check whether StoreKit was able to verify the signature,  use the
    ///           `payloadValue` property or a pattern matching technique such as a switch
    ///            statement.
    @objc public var unsafePayloadValue: RvmTransaction { raw.unsafePayloadValue.toRvm() }
    
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
    @objc public var signatureData: Data { raw.signedData }

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


