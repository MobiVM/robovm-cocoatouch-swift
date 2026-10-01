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

        /// The transaction was revoked because the customer switched to a subscription bundle.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @objc public static var upgradedToBundle: RevocationReason {
            Transaction.RevocationReason.upgradedToBundle.toRvm()
        }
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    @objc(RvmTransaction_RevocationType)
    public final class RevocationType: NSObject {
        let raw: Transaction.RevocationType
        init(raw: Transaction.RevocationType) { self.raw = raw }
        public override func isEqual(_ object: Any?) -> Bool { (object as? RevocationType)?.raw == raw }
        public override var hash: Int { raw.hashValue }
        @objc public var rawValue: String { raw.rawValue }
        @objc public init(rawValue: String) { raw = .init(rawValue: rawValue) }
        /// The transaction was revoked due to a family sharing revocation.
        @objc public static var familyRevocation: RevocationType { Transaction.RevocationType.familyRevocation.toRvm() }
        /// The transaction was fully refunded.
        @objc public static var fullRefund: RevocationType { Transaction.RevocationType.fullRefund.toRvm() }
        /// The transaction was partially refunded based on consumption.
        @objc public static var proratedRefund: RevocationType { Transaction.RevocationType.proratedRefund.toRvm() }
        /// The transaction was revoked by the organization administrator.
        @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
        @objc public static var assignmentRevocation: RevocationType {
            RevocationType(raw: .assignmentRevocation)
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

        /// The user has access to this transaction through an organization.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @objc public static var assigned: OwnershipType {
            Transaction.OwnershipType.assigned.toRvm()
        }
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

            @objc public static var oneTime: RvmTransaction.Offer.PaymentMode {
                PaymentMode(raw: .oneTime)
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

        /// The duration of the offer applied to a transaction.
        @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
        @objc public var period: RvmProduct.SubscriptionPeriod? { raw.period?.toRvm() }
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    @objc(RvmTransaction_CommitmentInfo)
    public final class CommitmentInfo: NSObject {
        let raw: Transaction.CommitmentInfo
        init(raw: Transaction.CommitmentInfo) { self.raw = raw }
        public override func isEqual(_ object: Any?) -> Bool {
            (object as? CommitmentInfo)?.raw == raw
        }
        public override var hash: Int { raw.hashValue }
        @objc public var billingPeriodNumber: UInt64 { raw.billingPeriodNumber }
        @objc public var totalBillingPeriods: UInt64 { raw.totalBillingPeriods }
        @objc public var expirationDate: Date { raw.expirationDate }
        @objc public var price: NSDecimalNumber { raw.price as NSDecimalNumber }
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
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.type", message: "Use the offer property instead.")
    @objc public var offerType: RvmTransaction.OfferType? { raw.offerType?.toRvm() }

    /// Identifies the offer applied to this transaction for `promotional` and `code` offer types.
    ///
    /// If `offerType` is `promotional`, this will be the offer identifier. If `offerType` is `code`,
    /// this will be the offer code reference name. This will be `nil` for `introductory` offers and if
    /// there is no offer applied.
    /// - Note: Only for subscriptions.
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.id", message: "Use the offer property instead.")
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
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @objc public var offerPaymentModeStringRepresentation: String? { raw.offerPaymentModeStringRepresentation }

    /// The string representation of the offer period applied to the subscription offer for this transaction.
    ///
    /// - Note: Only for subscriptions and when there is an `offer`.
    ///
    /// - Important: The property may return a sentinel nil value in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS),
    ///              or (2) a critical server error.
    /// @DeprecationSummary { Use the ``offer`` property instead. }
    @available(iOS, introduced: 15.0, deprecated: 18.4, message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 15.4, message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 18.4, message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 11.4, message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the offer property instead.")
    @objc public var offerPeriodStringRepresentation: String? {
        raw.offerPeriodStringRepresentation
    }

    /// The date the transaction was revoked, or `nil` if it was not revoked.
    @objc public var revocationDate: Date? { raw.revocationDate }

    /// The reason the transaction was revoked, or `nil` if it was not revoked.
    @objc public var revocationReason: RvmTransaction.RevocationReason? { raw.revocationReason?.toRvm() }

    ///	 The type of refund or revocation that applies to the transaction.
    ///
    ///	 This property indicates whether the transaction has a full refund, a prorated refund, or is revoked from Family Sharing.
    ///	 This property is `nil` for transactions that are not revoked.
    ///
    ///	 - Note: This property is not present for Advanced Commerce transactions, which use
    ///	         ``AdvancedCommerceInfo/Item/refunds`` instead.
    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    @objc public var revocationType: RevocationType? { raw.revocationType?.toRvm() }

    /// The string representation of the ``revocationType``, or `nil` if the transaction was not revoked.
    /// @DeprecationSummary { Use the ``revocationType`` property instead. }
    @available(iOS, introduced: 15.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(macOS, introduced: 12.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(tvOS, introduced: 15.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(watchOS, introduced: 8.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(visionOS, introduced: 1.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @objc public var revocationTypeStringRepresentation: String? {
        raw.revocationTypeStringRepresentation
    }

    ///     The percentage of the transaction amount that the App Store has refunded or revoked, expressed as a decimal.
    ///
    ///     This property indicates the rounded percentage of the purchase amount that the App Store has refunded or revoked.
    ///
    ///     The value is present only for transactions with a non-reversed refund. Valid values range from 0.0 to 100.0:
    ///     - For auto-renewable subscriptions: 0.0-100.0% based on time remaining in the subscription period
    ///     - For consumables, non-consumables, and non-renewing subscriptions: 0.0-100.0% based on consumption data
    ///
    ///     If the purchase had a quantity greater than 1, this percentage applies to the full quantity.
    ///     For example, if 1 of 3 items was refunded, the value would be approximately 33.333.
    /**
         The following table shows several examples of revocation percentages, and their milliunit equivalents:

         | Percentage | Integer equivalent, in milliunits |
         |-----------|---------------------------|
         | 67.932%  | 67932 |
         | 0.015%  | 15  |
         | 40%    | 40000 |
         | 100%   | 100000|     **/
    ///     - Note: This property is not present for Advanced Commerce transactions, which use
    ///             ``AdvancedCommerceInfo/Refund/amount`` instead.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var revocationPercentage: NSDecimalNumber? {
        raw.revocationPercentage as NSDecimalNumber?
    }

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

    /// Identifies the bundle product the transaction is for.
    /// If this transaction is created as a result of a subscription bundle purchase or renewal, this field will be populated with the product ID of the bundle.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var bundleProductID: String? { raw.bundleProductID }

    /// Identifies the subscription bundle group the transaction is for.
    /// - Note: Only for transactions of subscriptions included in a bundle.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var bundleSubscriptionGroupID: String? {
        raw.bundleSubscriptionGroupID
    }

    /// The original transaction ID of the subscription this one replaced when a customer switched between a standalone auto-renewable subscription and a subscription bundle (in either direction).
    ///
    /// For a bundle transaction, this is the standalone subscription's original transaction ID, while for a standalone transaction, this is the bundle's original transaction ID.
    /// This field is `nil` if no such switch occurred.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var previousOriginalTransactionID: NSNumber? {
        raw.previousOriginalTransactionID.map { NSNumber(value: $0) }
    }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var bundleTransactionID: String? { raw.bundleTransactionID }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var bundleOriginalTransactionID: String? {
        raw.bundleOriginalTransactionID
    }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @objc public var appTransactionID: String { raw.appTransactionID }

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

    /// Metadata specific to Advanced Commerce.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc public var advancedCommerceInfo: AdvancedCommerceInfo? { raw.advancedCommerceInfo?.toRvm() }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    @objc public var billingPlanType: RvmProduct.SubscriptionInfo.BillingPlanType? {
        raw.billingPlanType?.toRvm()
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    @objc public var commitmentInfo: CommitmentInfo? { raw.commitmentInfo?.toRvm() }

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

extension RvmTransaction {
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc(RvmTransaction_AdvancedCommerceInfo)
    public final class AdvancedCommerceInfo: NSObject {
        let raw: Transaction.AdvancedCommerceInfo
        init(raw: Transaction.AdvancedCommerceInfo) { self.raw = raw }
        public override func isEqual(_ object: Any?) -> Bool {
            (object as? AdvancedCommerceInfo)?.raw == raw
        }
        public override var hash: Int { raw.hashValue }
        @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
        @objc(RvmTransaction_AdvancedCommerceInfo_Item)
        public final class Item: NSObject {
            let raw: Transaction.AdvancedCommerceInfo.Item
            init(raw: Transaction.AdvancedCommerceInfo.Item) { self.raw = raw }
            public override func isEqual(_ object: Any?) -> Bool {
                (object as? Item)?.raw == raw
            }
            public override var hash: Int { raw.hashValue }
            @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
            @objc(RvmTransaction_AdvancedCommerceInfo_Item_Details)
            public final class Details: NSObject {
                let raw: Transaction.AdvancedCommerceInfo.Item.Details
                init(raw: Transaction.AdvancedCommerceInfo.Item.Details) { self.raw = raw }
                public override func isEqual(_ object: Any?) -> Bool {
                    (object as? Details)?.raw == raw
                }
                public override var hash: Int { raw.hashValue }
                @objc public var sku: String { raw.sku }
                @objc public var displayName: String { raw.displayName }
                @objc public var productDescription: String { raw.description }
                @objc public var offer: Offer? { raw.offer?.toRvm() }
                @objc public var price: NSDecimalNumber { raw.price as NSDecimalNumber }

                /// The partners associated with this item.
                @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
                @objc public var partners: [Partner] { raw.partners.map { $0.toRvm() } }
            }

            @objc public var details: Details { raw.details.toRvm() }
            @objc public var refunds: [Refund]? { raw.refunds?.map { $0.toRvm() } }
            @objc public var revocationDate: Date? { raw.revocationDate }
        }

        @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
        @objc(RvmTransaction_AdvancedCommerceInfo_Partner)
        public final class Partner: NSObject {
            let raw: Transaction.AdvancedCommerceInfo.Partner
            init(raw: Transaction.AdvancedCommerceInfo.Partner) { self.raw = raw }
            public override func isEqual(_ object: Any?) -> Bool {
                (object as? Partner)?.raw == raw
            }
            public override var hash: Int { raw.hashValue }

            /// The unique identifier you set for the app partner across your developer account.
            @objc public var id: String { raw.id }

            /// The unique identifier you set for the app partner across your developer account.
            @objc public var name: String? { raw.name }
        }

        @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
        @objc(RvmTransaction_AdvancedCommerceInfo_Offer)
        public final class Offer: NSObject {
            let raw: Transaction.AdvancedCommerceInfo.Offer
            init(raw: Transaction.AdvancedCommerceInfo.Offer) { self.raw = raw }
            public override func isEqual(_ object: Any?) -> Bool {
                (object as? Offer)?.raw == raw
            }
            public override var hash: Int { raw.hashValue }
            @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
            @objc(RvmTransaction_AdvancedCommerceInfo_Offer_Reason)
            public final class Reason: NSObject {
            let raw: Transaction.AdvancedCommerceInfo.Offer.Reason
            init(raw: Transaction.AdvancedCommerceInfo.Offer.Reason) { self.raw = raw }
                public override func isEqual(_ object: Any?) -> Bool { (object as? Reason)?.raw == raw }
                public override var hash: Int { raw.hashValue }
                @objc public var rawValue: String { raw.rawValue }
                @objc public init(rawValue: String) { raw = .init(rawValue: rawValue) }
                @objc public static var acquisition: Reason { Reason(raw: .acquisition) }
                @objc public static var retention: Reason { Reason(raw: .retention) }
                @objc public static var winBack: Reason { Reason(raw: .winBack) }
            }

            @objc public var price: NSDecimalNumber { raw.price as NSDecimalNumber }
            @objc public var period: RvmProduct.SubscriptionPeriod { raw.period.toRvm() }
            @objc public var periodCount: Int { raw.periodCount }
            @objc public var reason: Reason { raw.reason.toRvm() }
        }

        @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
        @objc(RvmTransaction_AdvancedCommerceInfo_Refund)
        public final class Refund: NSObject {
            let raw: Transaction.AdvancedCommerceInfo.Refund
            init(raw: Transaction.AdvancedCommerceInfo.Refund) { self.raw = raw }
            public override func isEqual(_ object: Any?) -> Bool {
                (object as? Refund)?.raw == raw
            }
            public override var hash: Int { raw.hashValue }
            @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
            @objc(RvmTransaction_AdvancedCommerceInfo_Refund_Reason)
            public final class Reason: NSObject {
                let raw: Transaction.AdvancedCommerceInfo.Refund.Reason
                init(raw: Transaction.AdvancedCommerceInfo.Refund.Reason) { self.raw = raw }
                public override func isEqual(_ object: Any?) -> Bool { (object as? Reason)?.raw == raw }
                public override var hash: Int { raw.hashValue }
                @objc public var rawValue: String { raw.rawValue }
                @objc public init(rawValue: String) { raw = .init(rawValue: rawValue) }
                @objc public static var legal: Reason { Transaction.AdvancedCommerceInfo.Refund.Reason.legal.toRvm() }
                @objc public static var modifyItems: Reason { Reason(raw: .modifyItems) }
                @objc public static var unintended: Reason { Reason(raw: .unintended) }
                @objc public static var unfulfilled: Reason { Reason(raw: .unfulfilled) }
                @objc public static var unsatisfied: Reason { Reason(raw: .unsatisfied) }
                @objc public static var other: Reason { Transaction.AdvancedCommerceInfo.Refund.Reason.other.toRvm() }
            }

            @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
            @objc(RvmTransaction_AdvancedCommerceInfo_Refund_RefundType)
            public final class RefundType: NSObject {
                let raw: Transaction.AdvancedCommerceInfo.Refund.RefundType
                init(raw: Transaction.AdvancedCommerceInfo.Refund.RefundType) { self.raw = raw }
                public override func isEqual(_ object: Any?) -> Bool { (object as? RefundType)?.raw == raw }
                public override var hash: Int { raw.hashValue }
                @objc public var rawValue: String { raw.rawValue }
                @objc public init(rawValue: String) { raw = .init(rawValue: rawValue) }
                @objc public static var custom: RefundType { RefundType(raw: .custom) }
                @objc public static var proRated: RefundType { RefundType(raw: .proRated) }
                @objc public static var full: RefundType { RefundType(raw: .full) }
            }

            @objc public var reason: Reason { raw.reason.toRvm() }
            @objc public var type: RefundType { raw.type.toRvm() }
            @objc public var date: Date { raw.date }
            @objc public var amount: NSDecimalNumber { raw.amount as NSDecimalNumber }
        }

        @objc public var requestReferenceID: String { raw.requestReferenceID }
        @objc public var estimatedTax: NSDecimalNumber { raw.estimatedTax as NSDecimalNumber }
        @objc public var taxRate: NSDecimalNumber { raw.taxRate as NSDecimalNumber }
        @objc public var taxCode: String { raw.taxCode }
        @objc public var taxExclusivePrice: NSDecimalNumber { raw.taxExclusivePrice as NSDecimalNumber }
        @objc public var productDescription: String? { raw.description }
        @objc public var displayName: String? { raw.displayName }
        @objc public var period: RvmProduct.SubscriptionPeriod? { raw.period?.toRvm() }
        @objc public var items: [Item] { raw.items.map { $0.toRvm() } }
    }
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
    @available(iOS, introduced: 15.0, deprecated: 18.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(macOS, introduced: 12.0, deprecated: 15.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(tvOS, introduced: 15.0, deprecated: 18.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(watchOS, introduced: 8.0, deprecated: 11.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the currentEntitlements(for:) method instead.")
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

extension RvmTransaction {
    /// Gets all the transactions associated with this product ID.
    /// - Parameter productID: Identifies the product to filter the transaction cache against.
    /// - Returns: A sequence containing all transactions for the given product.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc public static func all(for productID: String) -> RvmAsyncSequence<VerificationResultTransaction> {
        Transaction.all(for: productID).toRvm()
    }

    /// Gets the transactions that entitle the user to items purchased under a product ID.
    ///
    /// If a generic SKU is provided, the returned sequence will yield all transactions that entitle the user
    /// to Advanced Commerce Items purchased using the generic product's ID.
    ///
    /// If an ID for a regular IAP is provided, the returned sequence will contain no more than one transaction.
    ///
    /// - Parameter productID: Identifies the product to check entitlements for.
    /// - Returns: A sequence containing all transactions that entitle the user to the product.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc public static func currentEntitlements(
        for productID: String
    ) -> RvmAsyncSequence<VerificationResultTransaction> {
        Transaction.currentEntitlements(for: productID).toRvm()
    }
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

        @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
        case ineligible
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

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResultTransaction {
    @objc public override var debugDescription: String { raw.debugDescription }
}

// MARK: Converters

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.RefundRequestError {
    func toRvm() -> NSError {
        let code = switch self {
            case .duplicateRequest: RvmTransaction.RefundRequestError.duplicateRequest.rawValue
            case .failed: RvmTransaction.RefundRequestError.failed.rawValue
            default:
                if #available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *),
                   case .ineligible = self {
                    RvmTransaction.RefundRequestError.ineligible.rawValue
                } else {
                    RvmTransaction.RefundRequestError.unknown.rawValue
                }
        }
        return NSError(domain: RvmTransaction.RefundRequestErrorDomain, code: code, userInfo: (self as NSError).userInfo)
    }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.RefundRequestStatus {
    func toRvm() -> RvmTransaction.RefundRequestStatus {
        switch self {
        case .success: return RvmTransaction.RefundRequestStatus.success
        case .userCancelled: return RvmTransaction.RefundRequestStatus.userCancelled
        @unknown default: return RvmTransaction.RefundRequestStatus.unknown
        }
    }
}


@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Transaction.Reason {
    func toRvm() -> RvmTransaction.Reason { RvmTransaction.Reason(raw: self) }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.RevocationReason {
    func toRvm() -> RvmTransaction.RevocationReason { RvmTransaction.RevocationReason(raw: self) }
}


@available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
extension Transaction.Offer {
    func toRvm() -> RvmTransaction.Offer { RvmTransaction.Offer(raw: self) }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.OfferType {
    func toRvm() -> RvmTransaction.OfferType { RvmTransaction.OfferType(raw: self) }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.OwnershipType {
    func toRvm() -> RvmTransaction.OwnershipType { RvmTransaction.OwnershipType(raw: self) }
}


@available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
extension Transaction.Offer.PaymentMode {
    func toRvm() -> RvmTransaction.Offer.PaymentMode { RvmTransaction.Offer.PaymentMode(raw: self) }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction {
    func toRvm() -> RvmTransaction { RvmTransaction(raw: self) }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult<Transaction> {
    func toRvm() -> VerificationResultTransaction { VerificationResultTransaction(raw: self) }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.Transactions {
    func toRvm() -> RvmAsyncSequence<VerificationResultTransaction> { self.toRvm { $0?.toRvm() } }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo { RvmTransaction.AdvancedCommerceInfo(raw: self) }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo.Item {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Item { RvmTransaction.AdvancedCommerceInfo.Item(raw: self) }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo.Item.Details {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Item.Details {
        RvmTransaction.AdvancedCommerceInfo.Item.Details(raw: self)
    }
}


@available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
extension Transaction.AdvancedCommerceInfo.Partner {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Partner {
        RvmTransaction.AdvancedCommerceInfo.Partner(raw: self)
    }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo.Offer {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Offer { RvmTransaction.AdvancedCommerceInfo.Offer(raw: self) }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo.Offer.Reason {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Offer.Reason {
        RvmTransaction.AdvancedCommerceInfo.Offer.Reason(raw: self)
    }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo.Refund {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Refund { RvmTransaction.AdvancedCommerceInfo.Refund(raw: self) }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo.Refund.Reason {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Refund.Reason {
        RvmTransaction.AdvancedCommerceInfo.Refund.Reason(raw: self)
    }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Transaction.AdvancedCommerceInfo.Refund.RefundType {
    func toRvm() -> RvmTransaction.AdvancedCommerceInfo.Refund.RefundType {
        RvmTransaction.AdvancedCommerceInfo.Refund.RefundType(raw: self)
    }
}


@available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
extension Transaction.RevocationType {
    func toRvm() -> RvmTransaction.RevocationType { RvmTransaction.RevocationType(raw: self) }
}


@available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
extension Transaction.CommitmentInfo {
    func toRvm() -> RvmTransaction.CommitmentInfo { RvmTransaction.CommitmentInfo(raw: self) }
}
