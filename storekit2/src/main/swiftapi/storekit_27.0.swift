import BackgroundAssets
import Combine
import CoreFoundation
import CryptoKit
import DeveloperToolsSupport
import Foundation
import OSLog
import Security
import StoreKit.SKANError
import StoreKit.SKAdImpression
import StoreKit.SKAdNetwork
import StoreKit.SKArcadeService
import StoreKit.SKCloudServiceController
import StoreKit.SKCloudServiceSetupViewController
import StoreKit.SKDownload
import StoreKit.SKDownloaderExtension
import StoreKit.SKError
import StoreKit.SKOverlay
import StoreKit.SKOverlayConfiguration
import StoreKit.SKOverlayTransitionContext
import StoreKit.SKPayment
import StoreKit.SKPaymentDiscount
import StoreKit.SKPaymentQueue
import StoreKit.SKPaymentTransaction
import StoreKit.SKProduct
import StoreKit.SKProductDiscount
import StoreKit.SKProductStorePromotionController
import StoreKit.SKProductsRequest
import StoreKit.SKReceiptRefreshRequest
import StoreKit.SKRequest
import StoreKit.SKStoreProductViewController
import StoreKit.SKStoreReviewController
import StoreKit.SKStorefront
import StoreKit.StoreKitDefines
import UIKit
import os
import os.log

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
public struct AdvancedCommerceProduct : Identifiable {

    public typealias ProductType = Product.ProductType

    /// The product identifier that represents the generic product ID used with the Advanced Commerce API.
    public let id: AdvancedCommerceProduct.ID

    public let type: AdvancedCommerceProduct.ProductType

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    public typealias ID = String

    public init(id: AdvancedCommerceProduct.ID) async throws
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct {

    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    public struct PurchaseOption : Equatable, Hashable, Sendable {

        public static func onStorefrontChange(shouldContinuePurchase: @escaping @Sendable (Storefront) -> Bool) -> AdvancedCommerceProduct.PurchaseOption

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: AdvancedCommerceProduct.PurchaseOption, b: AdvancedCommerceProduct.PurchaseOption) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct {

    public typealias PurchaseResult = Product.PurchaseResult

    @available(iOS 18.4, tvOS 18.4, visionOS 2.4, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func purchase(compactJWS: String, confirmIn viewController: UIViewController, options: Set<AdvancedCommerceProduct.PurchaseOption> = []) async throws -> AdvancedCommerceProduct.PurchaseResult
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct {

    @inlinable public var latestTransaction: VerificationResult<Transaction>? { get async }

    public var allTransactions: Transaction.Transactions { get }

    public var currentEntitlements: Transaction.Transactions { get }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct : CustomDebugStringConvertible {

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
    @inlinable public var debugDescription: String { get }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (lhs: AdvancedCommerceProduct, rhs: AdvancedCommerceProduct) -> Bool
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    @inlinable public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct : Sendable {
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct.PurchaseOption : CustomDebugStringConvertible {

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
    public var debugDescription: String { get }
}

/// Contains properties and methods to facilitate interactions between your app and the App Store.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public enum AppStore {

    public static var canMakePayments: Bool { get }

    /// Identifies the current device to help detect fraud.
    ///
    /// To verify a `Transaction` or `Product.SubscriptionInfo.RenewalInfo` is valid for
    /// the current device:
    /// * Append the lowercased UUID string representation of this property after the lowercased UUID
    /// string representation of `deviceVerificationNonce`
    /// * Compute the SHA-384 hash of the appended UUID strings
    /// * Verify the SHA-384 digest is equal to the `deviceVerification` property
    public static var deviceVerificationID: UUID? { get }
}

extension AppStore {

    /// Displays a sheet in the window scene that enables users to redeem a subscription offer code that
    /// you configure in App Store Connect
    ///
    /// - Important: The resulting transaction from redeeming an offer code
    ///              is emitted in `Transaction.updates`. Set up a transaction
    ///              listener as soon as your app launches to receive new
    ///              transactions while the app is running.
    ///
    /// - Note: On apps built with Mac Catalyst, this method will return an error on versions prior to macOS 15.0.
    ///
    /// - Parameters:
    ///   - scene: The `UIWindowScene` used to display the offer code redemption sheet.
    ///
    /// - Throws: `StoreKitError`
    @available(iOS, introduced: 16.0, deprecated: 27.0, message: "Use `presentOfferCodeRedeemSheet(from:options:)` instead.")
    @available(macCatalyst, introduced: 16.0, deprecated: 27.0, message: "Use `presentOfferCodeRedeemSheet(from:options:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 27.0, message: "Use `presentOfferCodeRedeemSheet(from:options:)` instead.")
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor public static func presentOfferCodeRedeemSheet(in scene: UIWindowScene) async throws

    /// Presents a sheet that enables users to redeem subscription offer codes that you configure in App Store Connect.
    ///
    /// - Parameters:
    ///   - viewController: The `UIViewController` that StoreKit uses to display the offer code redemption sheet.
    ///   - options: A set of ``RedeemOption`` values to configure the offer code redemption.
    /// - Returns: A ``VerificationResult`` containing the ``Transaction`` that the redemption produces.
    /// - Throws: ``StoreKitError`` if the system cannot present the sheet or the redemption fails.
    @available(iOS 27.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor public static func presentOfferCodeRedeemSheet(from viewController: UIViewController, options: Set<RedeemOption> = []) async throws -> VerificationResult<Transaction>
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension AppStore {

    /// Represents a server environment used for in-app purchases.
    public struct Environment : RawRepresentable, Equatable, Hashable, Sendable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        /// The environment for apps downloaded from the App Store.
        public static let production: AppStore.Environment

        /// The environment for the App Store Sandbox or apps downloaded from TestFlight.
        public static let sandbox: AppStore.Environment

        /// The environment for StoreKit Testing in Xcode, including unit tests with StoreKitTest.
        public static let xcode: AppStore.Environment

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
        public typealias RawValue = String
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension AppStore {

    /// Sync signed transaction and renewal info with the App Store.
    ///
    /// StoreKit automatically keeps signed transaction and renewal info up to date, so this should only be
    /// used if the user indicates they are missing access to a product they have already purchased.
    /// - Important: This will prompt the user to authenticate, only call this function on user interaction.
    /// - Throws: If the user does not authenticate successfully, or if StoreKit cannot connect to the
    ///           App Store.
    public static func sync() async throws
}

@available(iOS 15.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension AppStore {

    @available(iOS 15.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor public static func showManageSubscriptions(in scene: UIWindowScene) async throws

    @available(iOS 17.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor public static func showManageSubscriptions(in scene: UIWindowScene, subscriptionGroupID: String) async throws
}

extension AppStore {

    /// Display a merchandising view.
    ///
    /// - Parameters:
    ///   - kind: The merchandising kind to merchandise.
    ///   - controller: The view controller to show the merchandising UI in proximity to.
    /// - Returns: The result of the App Store merchandising presentation.
    /// - Throws: A `StoreKitError`.
    @available(iOS 26.0, tvOS 26.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @MainActor public static func presentMerchandising(_ kind: AppStoreMerchandisingKind, from controller: UIViewController) async throws -> AppStoreMerchandisingKind.PresentationResult
}

extension AppStore {

    @available(iOS 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor public static func requestReview(in scene: UIWindowScene)
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AppStore {

    public struct Platform : RawRepresentable, Equatable, Hashable, Sendable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        public static let iOS: AppStore.Platform

        public static let macOS: AppStore.Platform

        public static let tvOS: AppStore.Platform

        public static let visionOS: AppStore.Platform

        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public static var managed: AppStore.Platform { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 15.4, iOS 18.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
        public typealias RawValue = String
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension AppStore : Sendable {
}

extension AppStore {

    /// The current age rating code for your app.
    ///
    /// Use this property to fetch the age rating for your app and compare it with the last known age rating to check if it has changed.
    ///
    /// The following is an example of getting the age rating for an app:
    ///
    /// ```swift
    /// func getAgeRatingCode() async -> Int? {
    ///     guard let ageRatingCode = await AppStore.ageRatingCode else {
    ///         print("Age rating code unavailable")
    ///         return nil
    ///     }
    ///     return ageRatingCode
    /// }
    /// ```
    /// If your app's age rating has changed, consider informing parents or guardians by using the
    /// [Significant Change API](https://developer.apple.com/documentation/PermissionKit/SignificantAppUpdateTopic).
    ///
    /// - Returns: An integer representing the current age rating code, or `nil` if the
    ///   age rating is unavailable.
    @available(iOS 26.2, macOS 26.2, tvOS 26.2, watchOS 26.2, *)
    public static var ageRatingCode: Int? { get async }
}

/// A merchandising kind to display in a merchandising view.
@available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct AppStoreMerchandisingKind : Sendable {

    /// The result of the App Store merchandising presentation.
    public enum PresentationResult : Sendable {

        /// The App Store merchandising view was dismissed.
        case dismissed

        /// The App Store merchandising view resulted in a purchase.
        case purchaseCompleted(Product.PurchaseResult)
    }

    /// Merchandise subscription bundle products in a subscription group.
    ///
    /// The group identifier must belong to a subscription bundle group.
    ///
    /// - Parameters:
    ///   - groupID: The subscription group identifier to merchandise in an App Store merchandising view.
    public static func subscriptionBundle(_ groupID: String) -> AppStoreMerchandisingKind
}

/// Represents signed transaction information for an app purchase.
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
public struct AppTransaction : Sendable {

    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    public struct StoreType : RawRepresentable, Equatable, Hashable, Sendable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        public static let consumer: AppTransaction.StoreType

        public static let education: AppTransaction.StoreType

        public static let enterprise: AppTransaction.StoreType

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 27.0, iOS 27.0, tvOS 27.0, watchOS 27.0, *)
        public typealias RawValue = String
    }

    /// The JSON representation of the transaction.
    public var jsonRepresentation: Data { get }

    /// A number the App Store uses to uniquely identify the application.
    public let appID: UInt64?

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
    public var appTransactionID: String { get }

    /// The application version the transaction is for.
    public let appVersion: String

    /// A number the App Store uses to uniquely identify the version of the application.
    public let appVersionID: UInt64?

    /// Identifies the application the transaction is for.
    public let bundleID: String

    /// The server environment this transaction was created in.
    public let environment: AppStore.Environment

    /// The version of the app originally purchased.
    public let originalAppVersion: String

    /// The date this original app purchase occurred on.
    public let originalPurchaseDate: Date

    /// The platform where the original purchase of the app.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    public let originalPlatform: AppStore.Platform

    /// The string representation of the platform where the original purchase of the app was made.
    /// @DeprecationSummary { Use the  ``originalPlatform`` property instead.}
    @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
    @available(iOS, introduced: 16.0, deprecated: 18.4, message: "Use the originalPlatform property instead.")
    @available(macOS, introduced: 13.0, deprecated: 15.4, message: "Use the originalPlatform property instead.")
    @available(tvOS, introduced: 16.0, deprecated: 18.4, message: "Use the originalPlatform property instead.")
    @available(watchOS, introduced: 9.0, deprecated: 11.4, message: "Use the originalPlatform property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the originalPlatform property instead.")
    public var originalPlatformStringRepresentation: String { get }

    /// The date this app was preordered.
    public let preorderDate: Date?

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    public let deviceVerification: Data

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    public let deviceVerificationNonce: UUID

    /// The revocation date of the app purchase.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
    public var revocationDate: Date? { get }

    /// The date this transaction was generated and signed.
    public let signedDate: Date

    /// The store where the original purchase of the app was made.
    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    public let storeType: AppTransaction.StoreType

    /// The string representation of the store where the original purchase of the app was made.
    /// @DeprecationSummary { Use the  ``storeType`` property instead.}
    @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
    @available(iOS, introduced: 16.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(macOS, introduced: 13.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(tvOS, introduced: 16.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(watchOS, introduced: 9.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 27.0, message: "Use the storeType property instead.")
    public var storeTypeStringRepresentation: String { get }

    /// Returns all the `AppTransaction`s for this version of the app.
    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    public static var all: AppTransaction.AppTransactions { get }

    /// Get the cached `AppTransaction` for this version of the app or make
    /// a request to get one from the App Store server if one has not been cached yet.
    public static var shared: VerificationResult<AppTransaction> { get async throws }

    /// Refreshes the shared `AppTransaction` from the App Store server.
    /// Calling this function will force an authentication dialog to display to the user.
    public static func refresh() async throws -> VerificationResult<AppTransaction>
}

extension AppTransaction {

    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    public struct AppTransactions : AsyncSequence, Sendable {

        /// The type of element produced by this asynchronous sequence.
        public typealias Element = VerificationResult<AppTransaction>

        /// The type of asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        public struct AsyncIterator : AsyncIteratorProtocol {

            /// Asynchronously advances to the next element and returns it, or ends the
            /// sequence if there is no next element.
            ///
            /// - Returns: The next element, if it exists, or `nil` to signal the end of
            ///   the sequence.
            public mutating func next() async -> VerificationResult<AppTransaction>?

            @available(macOS 27.0, iOS 27.0, tvOS 27.0, watchOS 27.0, *)
            public typealias Element = VerificationResult<AppTransaction>
        }

        /// Creates the asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        ///
        /// - Returns: An instance of the `AsyncIterator` type used to produce
        /// elements of the asynchronous sequence.
        public func makeAsyncIterator() -> AppTransaction.AppTransactions.AsyncIterator
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension AppTransaction : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: AppTransaction, rhs: AppTransaction) -> Bool
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension AppTransaction : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension AppTransaction : CustomDebugStringConvertible {

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
    @inlinable public var debugDescription: String { get }
}

@available(iOS 16.0, tvOS 16.4, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public enum ExternalLinkAccount : Sendable {

    /// Whether the app can open the external link account.
    ///
    /// Check this property before showing any UI controls that the user can use to open the external link
    /// account.
    /// You may want to check the value of this property again when the App Store storefront changes.
    /// - Important: If this property is `false`, do not show UI controls that call `open()` as the
    ///              method will always fail.
    public static var canOpen: Bool { get async }

    /// Opens the external link account in the user's default browser.
    ///
    /// Only call this method as a result of deliberate user interaction, such as tapping a button. If
    /// `canOpen` is `false`, this method will always throw an error. Returning without throwing an error
    /// does not guarantee the user was redirected to the external link account.
    /// - Throws: A `StoreKitError`
    public static func open() async throws
}

@available(iOS 15.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
public enum ExternalPurchase : Sendable {

    /// The result of presenting the external purchase notice sheet.
    public enum NoticeResult : Hashable, Sendable {

        /// The user chose to cancel and **not** view external purchases.
        case cancelled

        /// The user chose to continue to view external purchases.
        @available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
        case continuedWithExternalPurchaseToken(token: String)

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: ExternalPurchase.NoticeResult, b: ExternalPurchase.NoticeResult) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    /// Whether the app can present the external notice sheet.
    ///
    /// Check this property before showing any UI for external purchases
    /// Check the value of this property again and update your UI if
    /// `Storefront.current` changes.
    /// - Important: If this property is `false`, do not call `presentNoticeSheet()` as the method
    ///              will always fail.
    @available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
    public static var canPresent: Bool { get async }

    /// Present a notice sheet to users before showing external purchases.
    ///
    /// Only call this method as a result of deliberate user interaction, such as tapping a button.
    /// - Returns: Whether the user chose to continue to view the external purchases. Only show
    ///            external purchases if the result is `NoticeResult.continuedWithExternalPurchaseToken`
    ///            or `NoticeResult.continued`.
    /// - Throws: A `StoreKitError`
    public static func presentNoticeSheet() async throws -> ExternalPurchase.NoticeResult
}

@available(iOS 18.1, macOS 15.1, tvOS 18.1, watchOS 11.1, visionOS 2.1, *)
public enum ExternalPurchaseCustomLink : Sendable {

    /// The result of presenting the external purchase notice sheet.
    public enum NoticeResult : Hashable, Sendable {

        /// The user chose to cancel and **not** view external purchases.
        case cancelled

        /// The user chose to continue to view external purchases.
        case continued

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: ExternalPurchaseCustomLink.NoticeResult, b: ExternalPurchaseCustomLink.NoticeResult) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    /// How the impression result will be displayed to the user.
    public enum NoticeType : Int, Hashable, Sendable {

        /// The link out will happen inside the app.
        case withinApp

        /// The link out will happen in a browser and leave the app.
        case browser

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: Int)

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 15.1, iOS 18.1, tvOS 18.1, watchOS 11.1, visionOS 2.1, *)
        public typealias RawValue = Int

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
        public var rawValue: Int { get }
    }

    /// The external link token to use for reporting sales.
    public struct Token : Hashable, Sendable {

        public let value: String

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: ExternalPurchaseCustomLink.Token, b: ExternalPurchaseCustomLink.Token) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    /// Whether the app can open an external link.
    ///
    /// Check this property before showing any UI controls that the user can use to open the external link.
    /// Check the value of this property again and update your UI if `Storefront.current` changes.
    /// - Important: If this property is `false`, any methods to show UI or generate
    ///              an external link token method will always fail.
    public static var isEligible: Bool { get async }

    /// Opens the user notice sheet.
    ///
    /// This method provides a result of the user interaction to determine
    /// if the external link should be opened or not.
    /// Only call this method as a result of deliberate user interaction, such as tapping a button.
    /// If `isEligible` is `false`, this method will always fail.
    /// - Parameters:
    ///   - type: The type of notice that will be shown to the user.
    /// - Throws: A `StoreKitError`.
    public static func showNotice(type: ExternalPurchaseCustomLink.NoticeType) async throws -> ExternalPurchaseCustomLink.NoticeResult

    /// Returns an external link token of the specified type.
    ///
    /// If `isEligible` is `false`, this method will always fail.
    /// - Parameters:
    ///   - tokenType: The type of token to generate.
    ///           Consult the Apple Developer Documentation for more information on which types of tokens are accepted.
    /// - Throws: A `StoreKitError`.
    public static func token(for tokenType: String) async throws -> ExternalPurchaseCustomLink.Token?
}

@available(iOS 18.1, macOS 15.1, tvOS 18.1, watchOS 11.1, visionOS 2.1, *)
extension ExternalPurchaseCustomLink.NoticeType : RawRepresentable {
}

@available(iOS 15.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
public enum ExternalPurchaseLink : Sendable {

    /// Whether the app can open the external link.
    ///
    /// Check this property before showing any UI controls that the user can use to open the external link
    /// Check the value of this property again and update your UI if `Storefront.current` changes.
    /// - Important: If this property is `false`, do not show UI controls that call `open()` as the
    ///              method will always fail.
    public static var canOpen: Bool { get async }

    @available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.2, *)
    public static var eligibleURLs: [URL]? { get async }

    /// Opens the external link in the user's default browser.
    ///
    /// Only call this method as a result of deliberate user interaction, such as tapping a button. If
    /// `canOpen` is `false`, this method will always fail. This method does not guarantee
    /// the user was redirected to the external link if an error is not thrown.
    /// - Throws: A `StoreKitError`
    public static func open() async throws

    @available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.2, *)
    public static func open(url: URL) async throws
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
public struct InvalidRequestError : Error {

    public let code: Int64

    public let message: String
}

/// A message to be displayed.
@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Message : Sendable {

    /// The reason for the message.
    public let reason: Message.Reason

    @available(iOS 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public struct Reason : RawRepresentable, Equatable, Hashable, Sendable {

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
        public let rawValue: Int

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Int)

        public static let generic: Message.Reason

        public static let priceIncreaseConsent: Message.Reason

        @available(iOS 16.4, visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static let billingIssue: Message.Reason

        @available(iOS 18.0, visionOS 2.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static let winBackOffer: Message.Reason

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(iOS 16.0, visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public typealias RawValue = Int
    }
}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Message : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Message, rhs: Message) -> Bool
}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Message : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Message {

    /// Asks the system to display the message.
    /// - Throws: A `StoreKitError`
    @MainActor public func display(in scene: UIWindowScene) throws
}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Message {

    /// An asynchronous sequence of pending messages to be displayed.
    public struct Messages : AsyncSequence, Sendable {

        /// The type of element produced by this asynchronous sequence.
        public typealias Element = Message

        /// The type of asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        public struct AsyncIterator : AsyncIteratorProtocol {

            /// Asynchronously advances to the next element and returns it, or ends the
            /// sequence if there is no next element.
            ///
            /// - Returns: The next element, if it exists, or `nil` to signal the end of
            ///   the sequence.
            public mutating func next() async -> Message.Messages.Element?

            @available(iOS 16.0, visionOS 1.0, *)
            @available(macOS, unavailable)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            public typealias Element = Message.Messages.Element
        }

        /// Creates the asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        ///
        /// - Returns: An instance of the `AsyncIterator` type used to produce
        /// elements of the asynchronous sequence.
        public func makeAsyncIterator() -> Message.Messages.AsyncIterator
    }

    /// Use `messages` to listen for pending messages. You may want to delay
    /// showing the message if it would interrupt your user's interaction
    /// with your app. By default, the system will display pending
    /// messages at app launch.
    public static var messages: Message.Messages { get }
}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Message.Reason {

    public var localizedDescription: String { get }
}

/// Binds a third-party payment method to a user's App Store account.
@available(iOS 16.4, visionOS 1.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct PaymentMethodBinding : Sendable, Hashable, Identifiable {

    @available(iOS 16.4, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public enum PaymentMethodBindingError : LocalizedError {

        case notEligible

        case invalidPinningID

        case failed

        /// A localized message describing what error occurred.
        public var errorDescription: String? { get }

        /// A localized message describing the reason for the failure.
        public var failureReason: String? { get }

        /// A localized message describing how one might recover from the failure.
        public var recoverySuggestion: String? { get }

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: PaymentMethodBinding.PaymentMethodBindingError, b: PaymentMethodBinding.PaymentMethodBindingError) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    ///The `inAppPinningId` returned from your server
    public let id: String

    /// Check binding eligibility and initialize the `PaymentMethodBinding`.
    /// 
    /// - Parameter id: The `inAppPinningId` returned from your server.
    /// - Throws: An error if StoreKit is unable to check if the user is eligible or if the user is not eligible to bind a third party payment method.
    public init(id: String) async throws

    /// Bind the payment method to the user's App Store account.
    ///
    /// - Throws: An error if the bind process fails.
    public func bind() async throws

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: PaymentMethodBinding, b: PaymentMethodBinding) -> Bool

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(iOS 16.4, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias ID = String

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 16.4, visionOS 1.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PaymentMethodBinding.PaymentMethodBindingError : Equatable {
}

@available(iOS 16.4, visionOS 1.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PaymentMethodBinding.PaymentMethodBindingError : Hashable {
}

/// Information about a product configured in App Store Connect.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public struct Product : Identifiable {

    public struct ProductType : RawRepresentable, Equatable, Hashable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        public static let consumable: Product.ProductType

        public static let nonConsumable: Product.ProductType

        public static let nonRenewable: Product.ProductType

        public static let autoRenewable: Product.ProductType

        @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
        public static let subscriptionBundle: Product.ProductType

        @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
        public static let subscriptionSuite: Product.ProductType

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        public typealias RawValue = String
    }

    /// The raw JSON representation of the product.
    public var jsonRepresentation: Data { get }

    /// The unique product identifier.
    public let id: String

    /// The type of the product.
    public let type: Product.ProductType

    /// A localized display name of the product.
    public let displayName: String

    /// A localized description of the product.
    public let description: String

    /// The price of the product in local currency.
    public let price: Decimal

    /// A localized string representation of `price`.
    public let displayPrice: String

    /// Whether the product is available for family sharing.
    public let isFamilyShareable: Bool

    /// Properties and functionality specific to auto-renewable subscriptions.
    /// 
    /// This is never `nil` if `type` is `.autoRenewable`, and always `nil` for all other product
    /// types.
    public let subscription: Product.SubscriptionInfo?

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    public typealias ID = String
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    /// Represents the duration of time between subscription renewals.
    public struct SubscriptionPeriod : Equatable, Hashable {

        /// A unit of time.
        public enum Unit : Equatable, Hashable {

            case day

            case week

            case month

            case year

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Product.SubscriptionPeriod.Unit, b: Product.SubscriptionPeriod.Unit) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        /// The unit of time that this period represents.
        public let unit: Product.SubscriptionPeriod.Unit

        /// The number of units that the period represents.
        public let value: Int

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionPeriod, b: Product.SubscriptionPeriod) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    /// Properties and functionality specific to auto-renewable subscriptions.
    public struct SubscriptionInfo : Equatable, Hashable {

        /// An optional introductory offer that will automatically be applied if the user is eligible.
        public let introductoryOffer: Product.SubscriptionOffer?

        /// An array of all the promotional offers configured for this subscription.
        public let promotionalOffers: [Product.SubscriptionOffer]

        /// An array of all win-back offers configured for this subscription
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public let winBackOffers: [Product.SubscriptionOffer]

        /// The group identifier for this subscription.
        public let subscriptionGroupID: String

        /// The duration that this subscription lasts before auto-renewing.
        public let subscriptionPeriod: Product.SubscriptionPeriod

        @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
        public let pricingTerms: [Product.SubscriptionInfo.PricingTerms]

        /// Properties and functionality specific to auto-renewable subscriptions included in a subscription bundle.
        ///
        /// This list is only populated if `type` is `.subscriptionBundle`, and always empty for all other product types.
        @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
        public let bundledSubscriptions: [Product.SubscriptionInfo.BundledSubscription]

        /// Whether the user is eligible to have an introductory offer applied to their purchase.
        @inlinable public var isEligibleForIntroOffer: Bool { get async }

        /// Whether the user is eligible to have an introductory offer applied to a purchase in this
        /// subscription group.
        /// - Parameter groupID: The group identifier to check eligibility for.
        public static func isEligibleForIntroOffer(for groupID: String) async -> Bool

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionInfo, b: Product.SubscriptionInfo) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

extension Product {

    @available(iOS 16.4, *)
    @available(visionOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public struct PromotionInfo : Equatable {

        /// Product promotion visibility gives information on the current status of a promotion
        public enum Visibility : Int, Equatable, Hashable {

            /// Indicates product visibility is the same as the default value set in App Store Connect.
            case appStoreConnectDefault

            /// Indicates product is shown.
            case visible

            /// Indicates product is hidden.
            case hidden

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
            ///     // Prints "Optional(PaperSize.Legal)"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init?(rawValue: Int)

            /// The raw type that can be used to represent all values of the conforming
            /// type.
            ///
            /// Every distinct value of the conforming type has a corresponding unique
            /// value of the `RawValue` type, but there may be values of the `RawValue`
            /// type that don't have a corresponding value of the conforming type.
            @available(iOS 16.4, *)
            @available(macOS, unavailable, introduced: 12.0)
            @available(tvOS, unavailable, introduced: 15.0)
            @available(watchOS, unavailable, introduced: 8.0)
            @available(visionOS, unavailable)
            public typealias RawValue = Int

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
            public var rawValue: Int { get }
        }

        /// The product this promotion is associated with
        public let productID: Product.ID

        /// The visibility for this promotion for the current user (i.e.: visible, hidden)
        public var visibility: Product.PromotionInfo.Visibility

        /// Update the properties associated with this promotion, such as the visibility
        public func update() async throws

        /// Fetch all the available product promotions in the order that should be displayed and with their current visibility status
        public static var currentOrder: [Product.PromotionInfo] { get async throws }

        /// Update the order of the promotions with a new list of product identifiers
        public static func updateProductOrder(byID order: some Collection<String>) async throws

        /// Update the visibility status for a product ID
        public static func updateProductVisibility(_ visibility: Product.PromotionInfo.Visibility, for productID: Product.ID) async throws

        /// Update both the promotion order and visibility using the data in the provided `PromotionInfo` sequence
        public static func updateAll(_ promotions: some Collection<Product.PromotionInfo>) async throws

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.PromotionInfo, b: Product.PromotionInfo) -> Bool
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    public struct PurchaseOption : Equatable, Hashable, Sendable {

        /// Apply an app account token to a purchase.
        ///
        /// The app account token will persist in the resulting `Transaction` from a purchase.
        /// - Parameter token: A UUID that associates the purchase with an account in your system.
        public static func appAccountToken(_ token: UUID) -> Product.PurchaseOption

        @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
        public static func billingPlanType(_ type: Product.SubscriptionInfo.BillingPlanType) -> Product.PurchaseOption

        /// Add a custom string option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        public static func custom(key: String, value: String) -> Product.PurchaseOption

        /// Add a custom number option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        public static func custom(key: String, value: Double) -> Product.PurchaseOption

        /// Add a custom Boolean option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        public static func custom(key: String, value: Bool) -> Product.PurchaseOption

        /// Add a custom data option to a purchase.
        /// - Parameters:
        ///   - key: The key for this custom option.
        ///   - value: The value for this custom option.
        public static func custom(key: String, value: Data) -> Product.PurchaseOption

        /// A closure that determines whether the transaction should continue if the device's App Store storefront has changed during a transaction.
        ///
        /// The default is `true` if this option is not added.
        /// - Parameter shouldContinuePurchase: A closure that returns a boolean to determine if the
        ///                                     purchase should continue when the storefront has
        ///                                     changed to `Storefront` during the purchase process.
        @preconcurrency public static func onStorefrontChange(shouldContinuePurchase: @escaping @Sendable (Storefront) -> Bool) -> Product.PurchaseOption

        /// Apply a promotional offer to a purchase.
        /// - Parameters:
        ///   - offerID: The `id` property of the `SubscriptionOffer` to apply.
        ///   - keyID: The key ID of the private key used to generate `signature`. The private key
        ///            and key ID can be generated on App Store Connect.
        ///   - nonce: The nonce used in `signature`.
        ///   - signature: The cryptographic signature of the offer parameters, generated on your
        ///                server.
        ///   - timestamp: The time the signature was generated in milliseconds since 1970.
        ///   @DeprecationSummary { Sign promotional offers with JWS and use  ``promotionalOffer(_:compactJWS:)``  instead. }
        @available(iOS, introduced: 15.0, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(macOS, introduced: 12.0, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(tvOS, introduced: 15.0, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(watchOS, introduced: 8.0, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(visionOS, introduced: 1.0, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        public static func promotionalOffer(offerID: String, keyID: String, nonce: UUID, signature: Data, timestamp: Int) -> Product.PurchaseOption

        /// Apply a promotional offer to a purchase.
        ///
        /// - Parameters:
        ///    - offerID: The `id` property of the `SubscriptionOffer` to apply.
        ///    - signature: The metadata of the signature used to validate a promotional offer.
        ///    @DeprecationSummary { Sign promotional offers with JWS and use  ``promotionalOffer(_:compactJWS:)``  instead. }
        @available(iOS, introduced: 17.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(macOS, introduced: 14.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(tvOS, introduced: 17.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(watchOS, introduced: 10.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        @available(visionOS, introduced: 1.1, deprecated: 26.0, message: "Sign promotional offers with JWS and use promotionalOffer(_:compactJWS:) instead")
        public static func promotionalOffer(offerID: String, signature: Product.SubscriptionOffer.Signature) -> Product.PurchaseOption

        /// Apply a promotional offer to a purchase.
        ///
        /// - Parameters:
        ///    - offerID: The `id` property of the `SubscriptionOffer` to apply.
        ///    - compactJWS: The JWS signature used to validate a promotional offer.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0)
        public static func promotionalOffer(_ offerID: String, compactJWS: String) -> [Product.PurchaseOption]

        /// The quantity of this product to purchase.
        ///
        /// The default is 1 if this option is not added. This option can only be applied to consumable
        /// products and non-renewing subscriptions.
        /// - Parameter quantity: The quantity to purchase.
        public static func quantity(_ quantity: Int) -> Product.PurchaseOption

        /// Toggle ask to buy when testing in the App Store Sandbox environment.
        ///
        /// The default is `false` if this option is not added.
        /// - Parameter simulateAskToBuy: Set as `true` to simulate a child's account asking
        ///                               permission to purchase from a family member.
        public static func simulatesAskToBuyInSandbox(_ simulateAskToBuy: Bool) -> Product.PurchaseOption

        /// Apply a win-back offer to a purchase.
        /// - Parameters:
        ///   - offer: The `SubscriptionOffer` of type win-back to apply to the purchase.
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public static func winBackOffer(_ offer: Product.SubscriptionOffer) -> Product.PurchaseOption

        /// Set the eligibility of an introductory offer for a purchase.
        ///
        /// - Parameters:
        ///    - compactJWS: The signed JWT string with the introductory offer eligibility for the purchase.
        @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
        public static func introductoryOfferEligibility(compactJWS: String) -> Product.PurchaseOption

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.PurchaseOption, b: Product.PurchaseOption) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    public enum PurchaseResult : Sendable {

        /// The purchase succeeded with a `Transaction`.
        case success(VerificationResult<Transaction>)

        /// The user cancelled the purchase.
        case userCancelled

        /// The purchase is pending some user action.
        ///
        /// These purchases may succeed in the future, and the resulting `Transaction` will be
        /// delivered via `Transaction.updates`
        case pending
    }

    public enum PurchaseError : Error {

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

        case invalidOfferSignature

        /// Necessary promotional offer parameters were missing.
        case missingOfferParameters

        /// The customer needs to add a payment method to their Apple Account before making a purchase; use ``PaymentMethodBinding`` to prompt the customer and bind the payment method.
        @available(iOS 26.5, macOS 26.5, tvOS 26.5, watchOS 26.5, *)
        case paymentMethodBindingConfigurationRequired

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.PurchaseError, b: Product.PurchaseError) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    /// Processes a purchase for the product.
    /// - Parameter options: A set of options to configure the purchase.
    /// - Returns: The result of the purchase.
    /// - Throws: A `PurchaseError` or `StoreKitError`.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @available(visionOS, unavailable)
    @MainActor public func purchase(options: Set<Product.PurchaseOption> = []) async throws -> Product.PurchaseResult

    /// Processes a purchase for the product.
    /// - Parameters:
    ///   - scene: The scene to show purchase confirmation UI in proximity to.
    ///   - options: A set of options to configure the purchase.
    /// - Returns: The result of the purchase
    /// - Throws: A `PurchaseError` or `StoreKitError`.
    @available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @MainActor public func purchase(confirmIn scene: some UIScene, options: Set<Product.PurchaseOption> = []) async throws -> Product.PurchaseResult

    /// Processes a purchase for the product.
    /// - Parameters:
    ///   - viewController: The view controller to show purchase confirmation UI in proximity to.
    ///   - options: A set of options to configure the purchase.
    /// - Returns: The result of the purchase
    /// - Throws: A `PurchaseError` or `StoreKitError`.
    @available(iOS 18.2, tvOS 18.2, visionOS 2.2, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func purchase(confirmIn viewController: UIViewController, options: Set<Product.PurchaseOption> = []) async throws -> Product.PurchaseResult
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (lhs: Product, rhs: Product) -> Bool
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    @inlinable public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product : CustomDebugStringConvertible {

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
    @inlinable public var debugDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    /// Requests product data from the App Store.
    /// - Parameter identifiers: A set of product identifiers to load from the App Store. If any
    ///                          identifiers are not found, they will be excluded from the return
    ///                          value.
    /// - Returns: An array of all the products received from the App Store.
    /// - Throws: `StoreKitError`
    public static func products<Identifiers>(for identifiers: Identifiers) async throws -> [Product] where Identifiers : Collection, Identifiers.Element == String
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    /// The most recent transaction for the product, or `nil` if the user has never purchased this product.
    @inlinable public var latestTransaction: VerificationResult<Transaction>? { get async }

    /// The transaction that entitles the user to this product, or `nil` if the user is not currently entitled to
    /// this product.
    /// @DeprecationSummary { Use  the ``currentEntitlements`` property instead. }
    @available(iOS, introduced: 15.0, deprecated: 18.4, message: "Use the currentEntitlements property instead.")
    @available(macOS, introduced: 12.0, deprecated: 15.4, message: "Use the currentEntitlements property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 18.4, message: "Use the currentEntitlements property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 11.4, message: "Use the currentEntitlements property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the currentEntitlements property instead.")
    @inlinable public var currentEntitlement: VerificationResult<Transaction>? { get async }
}

extension Product {

    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @backDeployed(before: iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0)
    @inlinable public var currentEntitlements: Transaction.Transactions { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    /// The format style to use when formatting numbers derived from the price for the product.
    ///
    /// Use `displayPrice` when possible. Use `priceFormatStyle` only for localizing numbers
    /// derived from the `price` property, such as "2 products for $(`price * 2`)".
    /// - Important: When using `priceFormatStyle` on systems earlier than iOS 16.0,
    ///              macOS 13.0, tvOS 16.0 or watchOS 9.0, the property may return a format style
    ///              with a sentinel locale with identifier "xx\_XX" in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, macCatalyst 16.0)
    public var priceFormatStyle: Decimal.FormatStyle.Currency { get }

    /// The format style to use when formatting subscription periods for the subscription.
    ///
    /// Use the `formatted(_:referenceDate:)` method on `Product.SubscriptionPeriod`
    /// with this style to format the subscription period for the App Store locale for the subscription.
    /// - Important: When using `subscriptionPeriodFormatStyle` on systems earlier than
    ///              iOS 16.0, macOS 13.0, tvOS 16.0 or watchOS 9.0, the property may return a
    ///              format style with a sentinel locale with identifier "xx\_XX" in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, macCatalyst 16.0)
    public var subscriptionPeriodFormatStyle: Date.ComponentsFormatStyle { get }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension Product {

    /// The format style to use when formatting subscription period units for the subscription.
    ///
    /// Use the `formatted(_:)` method on `Product.SubscriptionPeriod.Unit` with this
    /// style to format the subscription period for the App Store locale for the subscription.
    public var subscriptionPeriodUnitFormatStyle: Product.SubscriptionPeriod.Unit.FormatStyle { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {

    /// Information about a subscription offer configured in App Store Connect.
    public struct SubscriptionOffer : Equatable, Hashable {

        public struct OfferType : RawRepresentable, Equatable, Hashable {

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
            public let rawValue: String

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
            ///     // Prints "Optional(PaperSize.Legal)"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: String)

            public static let introductory: Product.SubscriptionOffer.OfferType

            public static let promotional: Product.SubscriptionOffer.OfferType

            @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
            public static let winBack: Product.SubscriptionOffer.OfferType

            /// The raw type that can be used to represent all values of the conforming
            /// type.
            ///
            /// Every distinct value of the conforming type has a corresponding unique
            /// value of the `RawValue` type, but there may be values of the `RawValue`
            /// type that don't have a corresponding value of the conforming type.
            @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
            public typealias RawValue = String
        }

        public struct PaymentMode : RawRepresentable, Equatable, Hashable {

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
            public let rawValue: String

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
            ///     // Prints "Optional(PaperSize.Legal)"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: String)

            public static let payAsYouGo: Product.SubscriptionOffer.PaymentMode

            public static let payUpFront: Product.SubscriptionOffer.PaymentMode

            public static let freeTrial: Product.SubscriptionOffer.PaymentMode

            /// The raw type that can be used to represent all values of the conforming
            /// type.
            ///
            /// Every distinct value of the conforming type has a corresponding unique
            /// value of the `RawValue` type, but there may be values of the `RawValue`
            /// type that don't have a corresponding value of the conforming type.
            @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
            public typealias RawValue = String
        }

        /// The offer identifier.
        ///
        /// This is always `nil` for introductory offers and never `nil` for other offer types.
        public let id: String?

        /// The type of the offer.
        public let type: Product.SubscriptionOffer.OfferType

        /// The discounted price that the offer provides in local currency.
        ///
        /// This is the price per period in the case of `.payAsYouGo`
        public let price: Decimal

        /// A localized string representation of `price`.
        public let displayPrice: String

        /// The duration that this offer lasts before auto-renewing or changing to standard subscription
        /// renewals.
        public let period: Product.SubscriptionPeriod

        /// The number of periods this offer will renew for.
        ///
        /// Always 1 except for `.payAsYouGo`.
        public let periodCount: Int

        /// How the user is charged for this offer.
        public let paymentMode: Product.SubscriptionOffer.PaymentMode

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionOffer, b: Product.SubscriptionOffer) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.ProductType : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.ProductType {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod : CustomDebugStringConvertible {

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
    public var debugDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod {

    /// The range of the subscription period beginning at a reference date.
    ///
    /// Use this method with the `subscriptionPeriodFormatStyle` from a `Product`.
    /// - Parameter referenceDate: The date the range will begin at, default is now.
    /// - Returns: A range starting from `referenceDate` and ending after the subscription period.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, macCatalyst 16.0)
    public func dateRange(referenceDate: Date = .now) -> Range<Date>

    /// Format the subscription period.
    ///
    /// Get a format style for a subscription from the `subscriptionPeriodFormatStyle` property of
    /// `Product`.
    /// - Parameters:
    ///   - format: The format style to use.
    ///   - referenceDate: The date to format in respect to, default is now.
    /// - Returns: The result of formatting the subscription period with `format`.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, macCatalyst 16.0)
    public func formatted<S>(_ format: S, referenceDate: Date = .now) -> S.FormatOutput where S : FormatStyle, S.FormatInput == Range<Date>
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod {

    /// Format the subscription period.
    ///
    /// - Parameters:
    ///   - format: The format style to use.
    ///   - referenceDate: The date to format in respect to, default is now.
    /// - Returns: The result of formatting the subscription period with `format`.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    public func formatted<S>(_ format: S, referenceDate: Date = .now) -> S.FormatOutput where S : FormatStyle, S.FormatInput == Duration
}

extension Product.SubscriptionPeriod {

    /// A period of one week.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var weekly: Product.SubscriptionPeriod { get }

    /// A period of one month.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var monthly: Product.SubscriptionPeriod { get }

    /// A period of one year.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var yearly: Product.SubscriptionPeriod { get }

    /// A period of three days.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var everyThreeDays: Product.SubscriptionPeriod { get }

    /// A period of two weeks.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var everyTwoWeeks: Product.SubscriptionPeriod { get }

    /// A period of two months.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var everyTwoMonths: Product.SubscriptionPeriod { get }

    /// A period of three months.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var everyThreeMonths: Product.SubscriptionPeriod { get }

    /// A period of six months.
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, visionOS 1.0, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
    public static var everySixMonths: Product.SubscriptionPeriod { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo {

    public struct RenewalState : RawRepresentable, Equatable, Hashable {

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
        public let rawValue: Int

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Int)

        public static let subscribed: Product.SubscriptionInfo.RenewalState

        public static let expired: Product.SubscriptionInfo.RenewalState

        public static let inBillingRetryPeriod: Product.SubscriptionInfo.RenewalState

        public static let inGracePeriod: Product.SubscriptionInfo.RenewalState

        public static let revoked: Product.SubscriptionInfo.RenewalState

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        public typealias RawValue = Int
    }

    /// Represents signed renewal information for a purchase.
    public struct RenewalInfo {

        public struct ExpirationReason : RawRepresentable, Equatable, Hashable {

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
            public let rawValue: Int

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
            ///     // Prints "Optional(PaperSize.Legal)"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: Int)

            public static let autoRenewDisabled: Product.SubscriptionInfo.RenewalInfo.ExpirationReason

            public static let billingError: Product.SubscriptionInfo.RenewalInfo.ExpirationReason

            public static let didNotConsentToPriceIncrease: Product.SubscriptionInfo.RenewalInfo.ExpirationReason

            public static let productUnavailable: Product.SubscriptionInfo.RenewalInfo.ExpirationReason

            public static let unknown: Product.SubscriptionInfo.RenewalInfo.ExpirationReason

            /// The subscription expired because the customer left the Subscription Bundle.
            @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
            @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
            public static var unbundled: Product.SubscriptionInfo.RenewalInfo.ExpirationReason { get }

            /// The raw type that can be used to represent all values of the conforming
            /// type.
            ///
            /// Every distinct value of the conforming type has a corresponding unique
            /// value of the `RawValue` type, but there may be values of the `RawValue`
            /// type that don't have a corresponding value of the conforming type.
            @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
            public typealias RawValue = Int
        }

        @frozen public enum PriceIncreaseStatus : Equatable, Hashable {

            case noIncreasePending

            case pending

            case agreed

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus, b: Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
        public struct CommitmentInfo : Sendable, Hashable {

            public let autoRenewPreference: String

            public let renewalBillingPlanType: SubscriptionInfo.BillingPlanType

            public let renewalDate: Date

            public let renewalPrice: Decimal

            public let willAutoRenew: Bool

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Product.SubscriptionInfo.RenewalInfo.CommitmentInfo, b: Product.SubscriptionInfo.RenewalInfo.CommitmentInfo) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        /// The JSON representation of the renewal information.
        public var jsonRepresentation: Data { get }

        /// The original transaction identifier for the subscription group.
        public let originalTransactionID: UInt64

        /// The currently active product identifier, or the most recently active product identifier if the
        /// subscription is expired.
        public let currentProductID: String

        /// Whether the subscription will auto renew at the end of the current billing period.
        public let willAutoRenew: Bool

        /// The product identifier the subscription will auto renew to at the end of the current billing period.
        ///
        /// If the user disabled auto renewing, this property will be `nil`.
        public let autoRenewPreference: String?

        /// The reason the subscription expired.
        public let expirationReason: Product.SubscriptionInfo.RenewalInfo.ExpirationReason?

        /// The status of a price increase for the user.
        public let priceIncreaseStatus: Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus

        /// Whether the subscription is in a billing retry period.
        public let isInBillingRetry: Bool

        /// The date the billing grace period will expire.
        public let gracePeriodExpirationDate: Date?

        /// A subscription offer that applies at the next renewal period.
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public let offer: Transaction.Offer?

        /// Identifies the offer that will be applied to the next billing period.
        ///
        /// If `offerType` is `promotional`, this will be the offer identifier. If `offerType` is
        /// `code`, this will be the offer code reference name. This will be `nil` for `introductory`
        /// offers and if there will be no offer applied for the next billing period.
        /// @DeprecationSummary { Use the ``offer`` property instead. }
        @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.id", message: "Use the offer property instead.")
        @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "offer.id", message: "Use the offer property instead.")
        @available(tvOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.id", message: "Use the offer property instead.")
        @available(watchOS, introduced: 8.0, deprecated: 11.0, renamed: "offer.id", message: "Use the offer property instead.")
        @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "offer.id", message: "Use the offer property instead.")
        public var offerID: String? { get }

        /// The type of the offer that will be applied to the next billing period.
        /// @DeprecationSummary { Use the ``offer`` property instead. }
        @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.type", message: "Use the offer property instead.")
        @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "offer.type", message: "Use the offer property instead.")
        @available(tvOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.type", message: "Use the offer property instead.")
        @available(watchOS, introduced: 8.0, deprecated: 11.0, renamed: "offer.type", message: "Use the offer property instead.")
        @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "offer.type", message: "Use the offer property instead.")
        public var offerType: Transaction.OfferType? { get }

        /// The string representation of the subscription offer payment mode applied to the next billing period.
        ///
        /// - Note: Only when there is an offer applied for this subscription.
        ///
        /// - Important: The property may return a `nil` value in some cases:
        ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS),
        ///              (2) older transaction information where this field is absent, or (3) a critical server error.
        /// @DeprecationSummary { Use the ``offer`` property instead. }
        @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
        @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
        @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
        @available(tvOS, introduced: 15.0, deprecated: 18.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
        @available(watchOS, introduced: 8.0, deprecated: 11.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
        @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
        public var offerPaymentModeStringRepresentation: String? { get }

        /// The string representation of the subscription offer period applied to the next billing period.
        ///
        /// - Note: Only when there is an offer applied for this subscription.
        ///
        /// - Important: The property may return a sentinel nil value in some uncommon cases:
        ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS),
        ///              or (2) a critical server error.
        /// @DeprecationSummary { Use the ``offer`` property instead. }
        @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
        @available(iOS, introduced: 15.0, deprecated: 18.4, message: "Use the offer property instead.")
        @available(macOS, introduced: 12.0, deprecated: 15.4, message: "Use the offer property instead.")
        @available(tvOS, introduced: 15.0, deprecated: 18.4, message: "Use the offer property instead.")
        @available(watchOS, introduced: 8.0, deprecated: 11.4, message: "Use the offer property instead.")
        @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the offer property instead.")
        public var offerPeriodStringRepresentation: String? { get }

        /// The server environment the renewal info was created in.
        @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
        public let environment: AppStore.Environment

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
        /// @DeprecationSummary { Use the ``environment`` property instead. }
        @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, macCatalyst 16.0)
        @available(iOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead.")
        @available(macOS, introduced: 12.0, deprecated: 13.0, message: "Use the environment property instead.")
        @available(tvOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead.")
        @available(watchOS, introduced: 8.0, deprecated: 9.0, message: "Use the environment property instead.")
        @available(macCatalyst, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead.")
        @available(visionOS, unavailable)
        public var environmentStringRepresentation: String { get }

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
        @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, macCatalyst 16.0)
        public var recentSubscriptionStartDate: Date { get }

        /// The date of the next subscription renewal.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0)
        public var renewalDate: Date? { get }

        /// The amount that will be charged to the customer on the next renewal date.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
        public var renewalPrice: Decimal? { get }

        /// The `Locale.Currency` used for the purchase.
        ///
        /// - Important: The currency value is nil if the renewalPrice is unavailable.
        @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
        @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
        public var currency: Locale.Currency? { get }

        /// ISO3A code for the currency used for the purchase.
        ///
        /// - Important: The property may return a `nil` value in some uncommon cases:
        ///              (1) The renewalPrice is also `nil`, (2) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS)
        ///              or (3) a critical server error.
        /// @DeprecationSummary { Use the ``currency`` property instead. }
        @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0)
        @available(iOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead.")
        @available(macOS, introduced: 12.0, deprecated: 13.0, renamed: "currency.identifier", message: "Use the currency property instead.")
        @available(tvOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead.")
        @available(watchOS, introduced: 8.0, deprecated: 9.0, renamed: "currency.identifier", message: "Use the currency property instead.")
        @available(visionOS, unavailable)
        public var currencyCode: String? { get }

        /// List of win-back offers the user is eligible to apply to a purchase for this subscription group.
        /// - Note: The first item in the list is the best fit offer for the current user.
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public let eligibleWinBackOfferIDs: [String]

        /// Identifies the bundle product the next renewal is for.
        /// If the next renewal is created as part of a subscription bundle, this field will be populated with the product ID of the bundle.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public var bundleProductID: String? { get }

        /// Identifies the subscription bundle group the next renewal is for.
        /// - Note: Only for renewals of subscriptions included in a bundle.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public var bundleSubscriptionGroupID: String? { get }

        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public var bundleOriginalTransactionID: String? { get }

        /// Whether the subscription will leave the bundle at the next renewal and renew as a standalone product.
        /// - Note: Only for renewals of subscriptions included in a bundle.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public var willUnbundle: Bool { get }

        /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
        /// `deviceVerificationNonce` (both lowercased UUID strings).
        public let deviceVerification: Data

        /// The nonce used when computing `deviceVerification`.
        /// - SeeAlso: `AppStore.deviceVerificationID`
        public let deviceVerificationNonce: UUID

        /// The date this renewal info was generated and signed.
        public let signedDate: Date

        /// Metadata specific to Advanced Commerce.
        @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
        public let advancedCommerceInfo: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo?

        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
        public var appAccountToken: UUID? { get }

        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
        public var appTransactionID: String { get }

        @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
        public let commitmentInfo: Product.SubscriptionInfo.RenewalInfo.CommitmentInfo?

        @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
        public let renewalBillingPlanType: SubscriptionInfo.BillingPlanType?
    }

    public struct Status : Equatable, Hashable {

        public let state: Product.SubscriptionInfo.RenewalState

        public let transaction: VerificationResult<Transaction>

        public let renewalInfo: VerificationResult<Product.SubscriptionInfo.RenewalInfo>

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionInfo.Status, b: Product.SubscriptionInfo.Status) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    @inlinable public var status: [Product.SubscriptionInfo.Status] { get async throws }

    public static func status(for groupID: String) async throws -> [Product.SubscriptionInfo.Status]

    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    public static func status(transactionID: UInt64) async throws -> SubscriptionStatus?
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo : Sendable {
}

@available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
extension Product.SubscriptionInfo {

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
    @backDeployed(before: iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0)
    public var groupLevel: Int { get }

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
    @backDeployed(before: iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0)
    public var groupDisplayName: String { get }
}

@available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
extension Product.SubscriptionInfo {

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public typealias BillingPeriod = SubscriptionPeriod

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public struct BillingPlanType : Equatable, Hashable, RawRepresentable, Sendable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        public static let monthly: Product.SubscriptionInfo.BillingPlanType

        public static let upFront: Product.SubscriptionInfo.BillingPlanType

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 26.4, iOS 26.4, tvOS 26.4, watchOS 26.4, *)
        public typealias RawValue = String
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public struct CommitmentInfo : Hashable, Sendable {

        public let price: Decimal

        public let displayPrice: String

        public let period: SubscriptionPeriod

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionInfo.CommitmentInfo, b: Product.SubscriptionInfo.CommitmentInfo) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public struct PricingTerms : Hashable, Sendable {

        public let billingPrice: Decimal

        public let billingDisplayPrice: String

        public let billingPeriod: Product.SubscriptionInfo.BillingPeriod

        public let billingPlanType: Product.SubscriptionInfo.BillingPlanType

        public let commitmentInfo: Product.SubscriptionInfo.CommitmentInfo

        public let subscriptionOffers: [Product.SubscriptionOffer]

        public subscript(offers type: Product.SubscriptionOffer.OfferType) -> [Product.SubscriptionOffer] { get }

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionInfo.PricingTerms, b: Product.SubscriptionInfo.PricingTerms) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
extension Product.SubscriptionInfo {

    /// Properties and functionality specific to auto-renewable subscriptions included in a subscription bundle.
    public struct BundledSubscription : Equatable, Hashable, Sendable {

        /// The unique product identifier.
        public let id: Product.ID

        /// A localized display name of the product.
        public let displayName: String

        /// A localized description of the product.
        public let description: String

        /// The price of the product in local currency.
        public let price: Decimal

        /// A localized string representation of `price`.
        public let displayPrice: String

        /// Whether the product is available for family sharing.
        public let isFamilyShareable: Bool

        /// The group identifier for this subscription.
        public let subscriptionGroupID: String

        /// The level of this subscription relative to other subscriptions in the same group.
        public let subscriptionGroupLevel: Int

        /// A localized display name of the subscription's group.
        public let subscriptionGroupDisplayName: String

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionInfo.BundledSubscription, b: Product.SubscriptionInfo.BundledSubscription) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.PurchaseOption : CustomDebugStringConvertible {

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
    public var debugDescription: String { get }
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.PurchaseError : LocalizedError {

    /// A localized message describing what error occurred.
    public var errorDescription: String? { get }

    /// A localized message describing the reason for the failure.
    public var failureReason: String? { get }

    /// A localized message describing how one might recover from the failure.
    public var recoverySuggestion: String? { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.PurchaseError : Equatable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.PurchaseError : Hashable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionOffer : Sendable {
}

extension Product.SubscriptionOffer {

    /// The metadata of the signature used to validate a promotional offer.
    /// @DeprecationSummary { Sign promotional offers with JWS and use  ``Product/PurchaseOption/promotion)``  instead. }
    @available(iOS, introduced: 17.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use PurchaseOption.promotionalOffer(_:compactJWS:) instead.")
    @available(macOS, introduced: 14.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use PurchaseOption.promotionalOffer(_:compactJWS:) instead.")
    @available(tvOS, introduced: 17.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use PurchaseOption.promotionalOffer(_:compactJWS:) instead.")
    @available(watchOS, introduced: 10.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use PurchaseOption.promotionalOffer(_:compactJWS:) instead.")
    @available(visionOS, introduced: 1.1, deprecated: 26.0, message: "Sign promotional offers with JWS and use PurchaseOption.promotionalOffer(_:compactJWS:) instead.")
    public struct Signature : Equatable, Hashable, Sendable {

        /// The key ID of the private key used to generate `signature`. The private key and key ID
        /// can be generated on App Store Connect.
        public var keyID: String

        /// The nonce used in `signature`.
        public var nonce: UUID

        /// The time the signature was generated in milliseconds since 1970.
        public var timestamp: Int

        /// The cryptographic signature of the offer parameters, generated on your server.
        public var signature: Data

        /// Create a new signature to validate a promotional offer.
        ///
        /// - Parameters:
        ///     - keyID: The key ID of the private key used to generate `signature`. The private key and key ID
        ///              can be generated on App Store Connect.
        ///     - nonce: The nonce used in `signature`.
        ///     - timestamp: The time the signature was generated in milliseconds since 1970.
        ///     - signature: The cryptographic signature of the offer parameters, generated on your server.
        public init(keyID: String, nonce: UUID, timestamp: Int, signature: Data)

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionOffer.Signature, b: Product.SubscriptionOffer.Signature) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod.Unit : CustomDebugStringConvertible {

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
    public var debugDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod.Unit : Sendable {
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod.Unit {

    /// A format style used for localizing subscription period units.
    ///
    /// Get the format style for a subscription via the `subscriptionPeriodUnitFormatStyle`
    /// property of `Product`.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    public struct FormatStyle : FormatStyle {

        /// Get a human readable representation of the unit, localized for the subscription the format style
        /// is from.
        public func format(_ value: Product.SubscriptionPeriod.Unit) -> String

        /// Modifies the format style to use the specified locale.
        ///
        /// Use this format style to change the locale used by an existing format style.
        ///
        /// - Parameter locale: The locale to apply to the format style.
        /// - Returns: A format style modified to use the provided locale.
        public func locale(_ locale: Locale) -> Product.SubscriptionPeriod.Unit.FormatStyle

        /// Encodes this value into the given encoder.
        ///
        /// If the value fails to encode anything, `encoder` will encode an empty
        /// keyed container in its place.
        ///
        /// This function throws an error if any values are invalid for the given
        /// encoder's format.
        ///
        /// - Parameter encoder: The encoder to write data to.
        public func encode(to encoder: any Encoder) throws

        /// Creates a new instance by decoding from the given decoder.
        ///
        /// This initializer throws an error if reading from the decoder fails, or
        /// if the data read is corrupted or otherwise invalid.
        ///
        /// - Parameter decoder: The decoder to read data from.
        public init(from decoder: any Decoder) throws

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionPeriod.Unit.FormatStyle, b: Product.SubscriptionPeriod.Unit.FormatStyle) -> Bool

        /// The type this format style accepts as input.
        ///
        /// Swift type inference uses this value to determine which static accessors are available at a
        /// given call point. For example, when you format an `Int32`, you can use the static `number`
        /// property that provides a `IntegerFormatStyle<Int32>`, as seen in the following example. This
        /// works because the style's input type `IntegerFormatStyle.FormatInput` is a `BinaryInteger`
        /// generically constrained to the `Int32` type.
        ///
        /// ```swift
        /// let perihelionDistanceToSunInKm: Int32 = 147098291
        /// perihelionDistanceToSunInKm.formatted(.number
        ///     .notation(.scientific)) // "1.470983E8"
        /// ```
        @available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
        public typealias FormatInput = Product.SubscriptionPeriod.Unit

        /// The type this format style produces as output.
        ///
        /// Conforming types in Foundation define this type as either `String` or `AttributedString`.
        @available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
        public typealias FormatOutput = String

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    /// Format the subscription period unit.
    /// - Parameter format: The format style to use.
    /// - Returns: The result of formatting the subscription period unit with `format`.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    public func formatted<S>(_ format: S) -> S.FormatOutput where S : FormatStyle, S.FormatInput == Product.SubscriptionPeriod.Unit
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod.Unit : Comparable {

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public static func < (lhs: Product.SubscriptionPeriod.Unit, rhs: Product.SubscriptionPeriod.Unit) -> Bool
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.SubscriptionPeriod.Unit {

    /// Get a localized description of the unit for the device's current locale.
    public var localizedDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalState : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalState {

    public var localizedDescription: String { get }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension Product.SubscriptionInfo.RenewalInfo {

    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    public struct AdvancedCommerceInfo : Equatable, Hashable, Sendable {

        public struct Item : Equatable, Hashable, Sendable {

            public typealias Details = Transaction.AdvancedCommerceInfo.Item.Details

            public let details: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.Details

            @available(iOS 26.2, macOS 26.2, tvOS 26.2, watchOS 26.2, *)
            public let priceIncreaseInfo: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.PriceIncreaseInfo?

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item, b: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public let consistencyToken: String

        public let requestReferenceID: String

        public let taxCode: String

        public let description: String

        public let displayName: String

        public let period: SubscriptionPeriod

        public let items: [Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item]

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo, b: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Product.SubscriptionInfo.RenewalInfo, rhs: Product.SubscriptionInfo.RenewalInfo) -> Bool
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo : CustomDebugStringConvertible {

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
    @inlinable public var debugDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.Status {

    public struct Statuses : AsyncSequence {

        /// The type of element produced by this asynchronous sequence.
        public typealias Element = Product.SubscriptionInfo.Status

        /// The type of asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        public struct AsyncIterator : AsyncIteratorProtocol {

            /// Asynchronously advances to the next element and returns it, or ends the
            /// sequence if there is no next element.
            ///
            /// - Returns: The next element, if it exists, or `nil` to signal the end of
            ///   the sequence.
            public mutating func next() async -> Product.SubscriptionInfo.Status.Statuses.Element?

            @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
            public typealias Element = Product.SubscriptionInfo.Status.Statuses.Element
        }

        /// Creates the asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        ///
        /// - Returns: An instance of the `AsyncIterator` type used to produce
        /// elements of the asynchronous sequence.
        public func makeAsyncIterator() -> Product.SubscriptionInfo.Status.Statuses.AsyncIterator
    }

    public static var updates: Product.SubscriptionInfo.Status.Statuses { get }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.Status {

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
    public static var all: AsyncStream<(groupID: String, statuses: [Product.SubscriptionInfo.Status])> { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.Status : Sendable {
}

@available(iOS 16.4, *)
@available(visionOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Product.PromotionInfo.Visibility : RawRepresentable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.SubscriptionOffer.OfferType {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionOffer.OfferType : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.SubscriptionOffer.PaymentMode {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionOffer.PaymentMode : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo.ExpirationReason : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo.ExpirationReason {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus : BitwiseCopyable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.Status.Statuses : Sendable {
}

@available(iOS 26.2, macOS 26.2, tvOS 26.2, watchOS 26.2, *)
extension Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item {

    public struct PriceIncreaseInfo : Equatable, Hashable, Sendable {

        public struct Status : RawRepresentable, Equatable, Hashable, Sendable {

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
            public let rawValue: String

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
            ///     // Prints "Optional(PaperSize.Legal)"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: String)

            public static let pending: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.PriceIncreaseInfo.Status

            public static let accepted: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.PriceIncreaseInfo.Status

            public static let scheduled: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.PriceIncreaseInfo.Status

            /// The raw type that can be used to represent all values of the conforming
            /// type.
            ///
            /// Every distinct value of the conforming type has a corresponding unique
            /// value of the `RawValue` type, but there may be values of the `RawValue`
            /// type that don't have a corresponding value of the conforming type.
            @available(macOS 26.2, iOS 26.2, tvOS 26.2, watchOS 26.2, *)
            public typealias RawValue = String
        }

        public let status: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.PriceIncreaseInfo.Status

        public let price: Decimal

        public let dependentSKUs: [String]

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.PriceIncreaseInfo, b: Product.SubscriptionInfo.RenewalInfo.AdvancedCommerceInfo.Item.PriceIncreaseInfo) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

/// Represents a user's intent to purchase a product. This is created when the user starts a product promotion buy from the App Store.
@available(iOS 16.4, macOS 14.4, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct PurchaseIntent : Equatable, Sendable {

    /// The in-app purchase product associated with this intent
    public let product: Product

    /// The offer to be applied to the purchase
    /// - Note: This is only valid for subscriptions
    @available(iOS 18.0, macOS 15.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public let offer: Product.SubscriptionOffer?

    /// The identifier for the intent
    @available(iOS 16.4, macOS 14.4, *)
    @backDeployed(before: iOS 18.0, macOS 15.0, macCatalyst 18.0)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public var id: Product.ID { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: PurchaseIntent, b: PurchaseIntent) -> Bool
}

@available(iOS 18.0, macOS 15.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension PurchaseIntent : Identifiable {

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 15.0, iOS 18.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public typealias ID = Product.ID
}

@available(iOS 16.4, macOS 14.4, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension PurchaseIntent {

    public struct PurchaseIntents : AsyncSequence {

        /// The type of element produced by this asynchronous sequence.
        public typealias Element = PurchaseIntent

        /// The type of asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        public struct AsyncIterator : AsyncIteratorProtocol {

            /// Asynchronously advances to the next element and returns it, or ends the
            /// sequence if there is no next element.
            ///
            /// - Returns: The next element, if it exists, or `nil` to signal the end of
            ///   the sequence.
            public mutating func next() async -> PurchaseIntent.PurchaseIntents.Element?

            @available(macOS 14.4, iOS 16.4, *)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            @available(visionOS, unavailable)
            public typealias Element = PurchaseIntent.PurchaseIntents.Element
        }

        /// Creates the asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        ///
        /// - Returns: An instance of the `AsyncIterator` type used to produce
        /// elements of the asynchronous sequence.
        public func makeAsyncIterator() -> PurchaseIntent.PurchaseIntents.AsyncIterator
    }

    /// A sequence that emits a purchase intent each time it is created.
    /// - Important: Create a `Task` to iterate this sequence as early as possible when your app
    ///              launches.
    /// - Note: You may want to delay processing this purchase if it would interrupt the user's interaction with your app.
    public static var intents: PurchaseIntent.PurchaseIntents { get }
}

/// An option that customizes the behavior of an offer code redemption.
///
/// Pass a set of these values to ``AppStore/presentOfferCodeRedeemSheet(from:options:)`` to
/// configure the offer code redemption.
@available(anyAppleOS 27.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct RedeemOption : Equatable, Hashable, Sendable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: RedeemOption, b: RedeemOption) -> Bool

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

/// An app extension that uses the system implementation to schedule Apple-hosted asset-pack downloads automatically.
///
/// You can optionally implement the inherited `ManagedDownloaderExtension` requirements, but don’t implement any of the inherited `BADownloaderExtension` requirements for which this protocol provides a default implementation. For more information, see <doc://com.apple.documentation/documentation/backgroundassets>.
@available(iOS 26.0, macOS 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
public protocol StoreDownloaderExtension : ManagedDownloaderExtension {
}

/// Generic StoreKit Errors.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public enum StoreKitError : Error {

    /// Failure due to an unknown, unrecoverable error.
    ///
    /// Usually, trying again at a later time will work.
    case unknown

    /// The action failed because the user did not complete some necessary interaction.
    case userCancelled

    /// A network error occurred when communicating with the App Store.
    case networkError(URLError)

    case systemError(any Error)

    /// The product is not available in the current storefront.
    case notAvailableInStorefront

    /// The application is not entitled to perform the action.
    @available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
    case notEntitled

    /// The product is not supported for this operation.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    case unsupported

    /// StoreKit UI cannot be presented from the current context.
    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    case invalidPresentationContext
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension StoreKitError : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension StoreKitError : LocalizedError {

    /// A localized message describing what error occurred.
    public var errorDescription: String? { get }

    /// A localized message describing the reason for the failure.
    public var failureReason: String? { get }

    /// A localized message describing how one might recover from the failure.
    public var recoverySuggestion: String? { get }
}

/// An App Store storefront.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public struct Storefront : Identifiable, Sendable {

    /// The three-letter code representing the country or region associated with the App Store storefront.
    public let countryCode: String

    /// A value defined by Apple that uniquely identifies an App Store storefront.
    public let id: String

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
    public var currency: Locale.Currency? { get }

    /// The current App Store storefront.
    public static var current: Storefront? { get async }

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    public typealias ID = String
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Storefront {

    public struct Storefronts : AsyncSequence, Sendable {

        /// The type of element produced by this asynchronous sequence.
        public typealias Element = Storefront

        /// The type of asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        public struct AsyncIterator : AsyncIteratorProtocol {

            /// Asynchronously advances to the next element and returns it, or ends the
            /// sequence if there is no next element.
            ///
            /// - Returns: The next element, if it exists, or `nil` to signal the end of
            ///   the sequence.
            public mutating func next() async -> Storefront?

            @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
            public typealias Element = Storefront
        }

        /// Creates the asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        ///
        /// - Returns: An instance of the `AsyncIterator` type used to produce
        /// elements of the asynchronous sequence.
        public func makeAsyncIterator() -> Storefront.Storefronts.AsyncIterator
    }

    /// A sequence that emits a Storefront each time the App Store storefront changes.
    public static var updates: Storefront.Storefronts { get }
}

/// Information about an auto-renewable subscription.
@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
public typealias SubscriptionInfo = Product.SubscriptionInfo

/// Represents the duration of time between subscription renewals.
@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
public typealias SubscriptionPeriod = Product.SubscriptionPeriod

/// The renewal information for an auto-renewable subscription.
@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
public typealias SubscriptionRenewalInfo = Product.SubscriptionInfo.RenewalInfo

/// The renewal states of auto-renewable subscriptions.
@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
public typealias SubscriptionRenewalState = Product.SubscriptionInfo.RenewalState

/// The renewal status information for an auto-renewable subscription.
@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
public typealias SubscriptionStatus = Product.SubscriptionInfo.Status

/// Represents signed transaction information for a purchase.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public struct Transaction : Identifiable {

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public struct Reason : RawRepresentable, Equatable, Hashable, Sendable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        /// The transaction is a purchase
        public static let purchase: Transaction.Reason

        /// The transaction is a subscription renewal
        public static let renewal: Transaction.Reason

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
        public typealias RawValue = String
    }

    public struct RevocationReason : RawRepresentable, Equatable, Hashable {

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
        public let rawValue: Int

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Int)

        /// The user refunded the transaction due to an issue in your app.
        public static let developerIssue: Transaction.RevocationReason

        /// The transaction was revoked for some other reason.
        public static let other: Transaction.RevocationReason

        /// The transaction was revoked because the customer switched to a subscription bundle.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public static var upgradedToBundle: Transaction.RevocationReason { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        public typealias RawValue = Int
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public struct RevocationType : RawRepresentable, Equatable, Hashable, Sendable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        /// The transaction was revoked due to a family sharing revocation.
        public static let familyRevocation: Transaction.RevocationType

        /// The transaction was fully refunded.
        public static let fullRefund: Transaction.RevocationType

        /// The transaction was partially refunded based on consumption.
        public static let proratedRefund: Transaction.RevocationType

        /// The transaction was revoked by the organization administrator.
        @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public static var assignmentRevocation: Transaction.RevocationType { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 26.4, iOS 26.4, tvOS 26.4, watchOS 26.4, *)
        public typealias RawValue = String
    }

    public struct OfferType : RawRepresentable, Equatable, Hashable {

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
        public let rawValue: Int

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Int)

        public static let introductory: Transaction.OfferType

        public static let promotional: Transaction.OfferType

        public static let code: Transaction.OfferType

        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0)
        public static var winBack: Transaction.OfferType { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        public typealias RawValue = Int
    }

    public struct OwnershipType : RawRepresentable, Equatable, Hashable {

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
        public let rawValue: String

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String)

        /// The current user is the purchaser of the transaction.
        public static let purchased: Transaction.OwnershipType

        /// The user has access to this transaction through family sharing.
        public static let familyShared: Transaction.OwnershipType

        /// The user has access to this transaction through an organization.
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
        public static var assigned: Transaction.OwnershipType { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
        public typealias RawValue = String
    }

    /// Details for the offer applied to this transaction.
    @available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
    public struct Offer : Equatable, Hashable, Sendable {

        /// The type of payment used for the offer.
        public struct PaymentMode : RawRepresentable, Equatable, Hashable, Sendable {

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
            public let rawValue: String

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
            ///     // Prints "Optional(PaperSize.Legal)"
            ///
            ///     print(PaperSize(rawValue: "Tabloid"))
            ///     // Prints "nil"
            ///
            /// - Parameter rawValue: The raw value to use for the new instance.
            public init(rawValue: String)

            public static let freeTrial: Transaction.Offer.PaymentMode

            public static let payAsYouGo: Transaction.Offer.PaymentMode

            public static let payUpFront: Transaction.Offer.PaymentMode

            @backDeployed(before: iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0)
            public static var oneTime: Transaction.Offer.PaymentMode { get }

            /// The raw type that can be used to represent all values of the conforming
            /// type.
            ///
            /// Every distinct value of the conforming type has a corresponding unique
            /// value of the `RawValue` type, but there may be values of the `RawValue`
            /// type that don't have a corresponding value of the conforming type.
            @available(macOS 14.2, iOS 17.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
            public typealias RawValue = String
        }

        /// Identifies the offer applied to this transaction for `promotional` and `code` offer types.
        ///
        /// If `offerType` is `promotional`, this will be the offer identifier. If `offerType` is `code`,
        /// this will be the offer code reference name. This will be `nil` for `introductory` offers and if
        /// there is no offer applied.
        public let id: String?

        /// The type of subscription offer applied to this transaction.
        public let type: Transaction.OfferType

        /// The payment mode of the offer applied to a transaction.
        /// - Note: The payment mode may be unknown for transactions created before the release of App Store Server API 1.10.
        ///         If the payment mode is unknown, the property is nil.
        public let paymentMode: Transaction.Offer.PaymentMode?

        /// The duration of the offer applied to a transaction.
        @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
        public let period: Product.SubscriptionPeriod?

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Transaction.Offer, b: Transaction.Offer) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public struct CommitmentInfo : Equatable, Hashable, Sendable {

        public let billingPeriodNumber: UInt64

        public let totalBillingPeriods: UInt64

        public let expirationDate: Date

        public let price: Decimal

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Transaction.CommitmentInfo, b: Transaction.CommitmentInfo) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    /// The JSON representation of the transaction.
    public var jsonRepresentation: Data { get }

    /// Unique ID for the transaction.
    public let id: UInt64

    /// The ID of the original transaction for `productID` or`subscriptionGroupID` if this is a
    /// subscription.
    public let originalID: UInt64

    /// Uniquely identifies a subscription purchase.
    /// - Note: Only for subscriptions.
    public let webOrderLineItemID: String?

    /// Identifies the product the transaction is for.
    public let productID: String

    /// Identifies the subscription group the transaction is for.
    /// - Note: Only for subscriptions.
    public let subscriptionGroupID: String?

    /// Identifies the application the transaction is for.
    public let appBundleID: String

    /// The date this transaction occurred on.
    public let purchaseDate: Date

    /// The date the original transaction for `productID` or`subscriptionGroupID` occurred on.
    public let originalPurchaseDate: Date

    /// The date the users access to `productID` expires
    /// - Note: Only for subscriptions.
    public let expirationDate: Date?

    /// Quantity of `productID` purchased in the transaction.
    /// - Note: Always 1 for non-consumables and auto-renewable suscriptions.
    public let purchasedQuantity: Int

    /// If this transaction was upgraded to a subscription with a higher level of service.
    /// - Important: If this property is `true`, look for a new transaction for a subscription with a
    ///              higher level of service.
    /// - Note: Only for subscriptions.
    public let isUpgraded: Bool

    /// The offer applied to this transaction.
    /// - Note: Only for subscriptions.
    @available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
    public let offer: Transaction.Offer?

    /// The type of subscription offer applied to this transaction.
    /// - Note: Only for subscriptions.
    /// @DeprecationSummary { Use the ``offer`` property instead. }
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.type", message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.type", message: "Use the offer property instead.")
    public var offerType: Transaction.OfferType? { get }

    /// Identifies the offer applied to this transaction for `promotional` and `code` offer types.
    ///
    /// If `offerType` is `promotional`, this will be the offer identifier. If `offerType` is `code`,
    /// this will be the offer code reference name. This will be `nil` for `introductory` offers and if
    /// there is no offer applied.
    /// - Note: Only for subscriptions.
    /// @DeprecationSummary { Use the ``offer`` property instead. }
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.id", message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.id", message: "Use the offer property instead.")
    public var offerID: String? { get }

    /// The string representation of the payment mode applied to the subscription offer for this transaction.
    ///
    /// - Note: Only for subscriptions and when there is an `offer`.
    ///         The payment mode may be unknown for transactions created before the release of App Store Server API 1.10.
    ///         If the payment mode is unknown, the property is nil.
    ///
    /// - Important: The property may return a sentinel nil value in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS),
    ///              or (2) a critical server error.
    /// @DeprecationSummary { Use the ``offer`` property instead. }
    @backDeployed(before: iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2)
    @available(iOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 14.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 17.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 10.2, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "offer.paymentMode.rawValue", message: "Use the offer property instead.")
    public var offerPaymentModeStringRepresentation: String? { get }

    /// The string representation of the offer period applied to the subscription offer for this transaction.
    ///
    /// - Note: Only for subscriptions and when there is an `offer`.
    ///
    /// - Important: The property may return a sentinel nil value in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS),
    ///              or (2) a critical server error.
    /// @DeprecationSummary { Use the ``offer`` property instead. }
    @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
    @available(iOS, introduced: 15.0, deprecated: 18.4, message: "Use the offer property instead.")
    @available(macOS, introduced: 12.0, deprecated: 15.4, message: "Use the offer property instead.")
    @available(tvOS, introduced: 15.0, deprecated: 18.4, message: "Use the offer property instead.")
    @available(watchOS, introduced: 8.0, deprecated: 11.4, message: "Use the offer property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the offer property instead.")
    public var offerPeriodStringRepresentation: String? { get }

    /// The date the transaction was revoked, or `nil` if it was not revoked.
    public let revocationDate: Date?

    /// The reason the transaction was revoked, or `nil` if it was not revoked.
    public let revocationReason: Transaction.RevocationReason?

    ///	 The type of refund or revocation that applies to the transaction.
    ///
    ///	 This property indicates whether the transaction has a full refund, a prorated refund, or is revoked from Family Sharing.
    ///	 This property is `nil` for transactions that are not revoked.
    ///
    ///	 - Note: This property is not present for Advanced Commerce transactions, which use
    ///	         ``AdvancedCommerceInfo/Item/refunds`` instead.
    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public let revocationType: Transaction.RevocationType?

    /// The string representation of the ``revocationType``, or `nil` if the transaction was not revoked.
    /// @DeprecationSummary { Use the ``revocationType`` property instead. }
    @backDeployed(before: iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4)
    @available(iOS, introduced: 15.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(macOS, introduced: 12.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(tvOS, introduced: 15.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(watchOS, introduced: 8.0, deprecated: 26.4, message: "Use the revocationType property instead")
    @available(visionOS, introduced: 1.0, deprecated: 26.4, message: "Use the revocationType property instead")
    public var revocationTypeStringRepresentation: String? { get }

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
    @backDeployed(before: iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4)
    public var revocationPercentage: Decimal? { get }

    /// The type of `productID`.
    public let productType: Product.ProductType

    /// If an app account token was added as a purchase option when purchasing, this property will
    /// be the token provided. If no token was provided, this will be `nil`.
    public let appAccountToken: UUID?

    /// The server environment the transaction was created in.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    public let environment: AppStore.Environment

    /// The server environment the transaction was created in.
    ///
    /// The possible values this can return are "Production" for apps downloaded from the App Store,
    /// "Sandbox" for the App Store Sandbox and apps downloaded from TestFlight, and "Xcode" for
    /// StoreKit Testing in Xcode.
    /// - Important: The property may return a sentinel empty string in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error. If possible, use the
    ///              ``Transaction/environment`` property to guarantee a valid value.
    /// @DeprecationSummary { Use the ``environment`` property instead. }
    @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, macCatalyst 16.0)
    @available(iOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
    @available(macOS, introduced: 12.0, deprecated: 13.0, message: "Use the environment property instead")
    @available(tvOS, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
    @available(watchOS, introduced: 8.0, deprecated: 9.0, message: "Use the environment property instead")
    @available(macCatalyst, introduced: 15.0, deprecated: 16.0, message: "Use the environment property instead")
    @available(visionOS, unavailable)
    public var environmentStringRepresentation: String { get }

    /// The reason for the transaction.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public let reason: Transaction.Reason

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
    @backDeployed(before: iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0)
    @available(iOS, introduced: 15.0, deprecated: 17.0, message: "Use the reason property instead")
    @available(macOS, introduced: 12.0, deprecated: 14.0, message: "Use the reason property instead")
    @available(tvOS, introduced: 15.0, deprecated: 17.0, message: "Use the reason property instead")
    @available(watchOS, introduced: 8.0, deprecated: 10.0, message: "Use the reason property instead")
    @available(macCatalyst, introduced: 15.0, deprecated: 17.0, message: "Use the reason property instead")
    @available(visionOS, unavailable)
    public var reasonStringRepresentation: String { get }

    /// The `Storefront` the transaction was completed in.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public let storefront: Storefront

    /// The  ISO alpha-3 country code of the `Storefront` the transaction was completed in.
    ///
    /// - Important: When using `storefrontCountryCode` on systems earlier than
    ///              iOS 17.0, macOS 14.0, tvOS 17.0 or watchOS 10.0, the property may return
    ///              a sentinel empty string in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a
    ///              more recent OS) or (2) a critical server error. If possible, use the
    ///              ``Transaction/storefront`` property to guarantee a valid value.
    /// @DeprecationSummary { Use the ``storefront`` property instead. }
    /// @available(iOS, introduced: 15.0, deprecated: 17.0, message: "Use the storefront property instead")
    @backDeployed(before: iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0)
    @available(macOS, introduced: 12.0, deprecated: 14.0, message: "Use the storefront property instead")
    @available(tvOS, introduced: 15.0, deprecated: 17.0, message: "Use the storefront property instead")
    @available(watchOS, introduced: 8.0, deprecated: 10.0, message: "Use the storefront property instead")
    @available(macCatalyst, introduced: 15.0, deprecated: 17.0, message: "Use the storefront property instead")
    @available(visionOS, unavailable)
    public var storefrontCountryCode: String { get }

    /// Amount charged to the customer when purchasing this offer.
    ///
    /// - Important: The property may return a `nil` value in some uncommon cases:
    ///              (1) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS)
    ///              or (2) a critical server error.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1)
    public var price: Decimal? { get }

    /// The `Locale.Currency` used for the purchase.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @backDeployed(before: iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1)
    public var currency: Locale.Currency? { get }

    /// ISO3A code for the currency used for the purchase.
    ///
    /// - Important: The property may return a `nil` value in some uncommon cases:
    ///              (1) The price is also `nil`, (2) StoreKit Testing in Xcode (workaround: test your app on a device running a more recent OS)
    ///              or (3) a critical server error.
    /// @DeprecationSummary { Use the ``currency`` property instead. }
    @backDeployed(before: iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0)
    @available(iOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(macOS, introduced: 12.0, deprecated: 13.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(tvOS, introduced: 15.0, deprecated: 16.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(watchOS, introduced: 8.0, deprecated: 9.0, renamed: "currency.identifier", message: "Use the currency property instead")
    @available(visionOS, introduced: 1.0, deprecated: 1.1, renamed: "currency.identifier", message: "Use the currency property instead")
    public var currencyCode: String? { get }

    /// Identifies the bundle product the transaction is for.
    /// If this transaction is created as a result of a subscription bundle purchase or renewal, this field will be populated with the product ID of the bundle.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
    public var bundleProductID: String? { get }

    /// Identifies the subscription bundle group the transaction is for.
    /// - Note: Only for transactions of subscriptions included in a bundle.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
    public var bundleSubscriptionGroupID: String? { get }

    /// The original transaction ID of the subscription this one replaced when a customer switched between a standalone auto-renewable subscription and a subscription bundle (in either direction).
    ///
    /// For a bundle transaction, this is the standalone subscription's original transaction ID, while for a standalone transaction, this is the bundle's original transaction ID.
    /// This field is `nil` if no such switch occurred.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
    public var previousOriginalTransactionID: UInt64? { get }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
    public var bundleTransactionID: String? { get }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0)
    public var bundleOriginalTransactionID: String? { get }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    @backDeployed(before: iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4)
    public var appTransactionID: String { get }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    public let deviceVerification: Data

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    public let deviceVerificationNonce: UUID

    /// Whether the user purchased this transaction, or has access to it via family sharing.
    public let ownershipType: Transaction.OwnershipType

    /// The date this transaction was generated and signed.
    public let signedDate: Date

    /// Metadata specific to Advanced Commerce.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    public let advancedCommerceInfo: Transaction.AdvancedCommerceInfo?

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public let billingPlanType: SubscriptionInfo.BillingPlanType?

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    public let commitmentInfo: Transaction.CommitmentInfo?

    /// Call this method after giving the user access to `productID`.
    public func finish() async

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    public typealias ID = UInt64
}

extension Transaction {

    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    public struct AdvancedCommerceInfo : Equatable, Hashable, Sendable {

        public struct Item : Equatable, Hashable, Sendable {

            public struct Details : Equatable, Hashable, Sendable {

                public let sku: String

                public let displayName: String

                public let description: String

                public let offer: Transaction.AdvancedCommerceInfo.Offer?

                public let price: Decimal

                /// The partners associated with this item.
                @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
                public let partners: [Transaction.AdvancedCommerceInfo.Partner]

                /// Returns a Boolean value indicating whether two values are equal.
                ///
                /// Equality is the inverse of inequality. For any values `a` and `b`,
                /// `a == b` implies that `a != b` is `false`.
                ///
                /// - Parameters:
                ///   - lhs: A value to compare.
                ///   - rhs: Another value to compare.
                public static func == (a: Transaction.AdvancedCommerceInfo.Item.Details, b: Transaction.AdvancedCommerceInfo.Item.Details) -> Bool

                /// Hashes the essential components of this value by feeding them into the
                /// given hasher.
                ///
                /// Implement this method to conform to the `Hashable` protocol. The
                /// components used for hashing must be the same as the components compared
                /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
                /// with each of these components.
                ///
                /// - Important: In your implementation of `hash(into:)`,
                ///   don't call `finalize()` on the `hasher` instance provided,
                ///   or replace it with a different instance.
                ///   Doing so may become a compile-time error in the future.
                ///
                /// - Parameter hasher: The hasher to use when combining the components
                ///   of this instance.
                public func hash(into hasher: inout Hasher)

                /// The hash value.
                ///
                /// Hash values are not guaranteed to be equal across different executions of
                /// your program. Do not save hash values to use during a future execution.
                ///
                /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
                ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
                ///   The compiler provides an implementation for `hashValue` for you.
                public var hashValue: Int { get }
            }

            public let details: Transaction.AdvancedCommerceInfo.Item.Details

            public let refunds: [Transaction.AdvancedCommerceInfo.Refund]?

            public let revocationDate: Date?

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Transaction.AdvancedCommerceInfo.Item, b: Transaction.AdvancedCommerceInfo.Item) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
        public struct Partner : Equatable, Hashable, Sendable {

            /// The unique identifier you set for the app partner across your developer account.
            public let id: String

            /// The unique identifier you set for the app partner across your developer account.
            public let name: String?

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Transaction.AdvancedCommerceInfo.Partner, b: Transaction.AdvancedCommerceInfo.Partner) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public struct Offer : Equatable, Hashable, Sendable {

            public struct Reason : Equatable, Hashable, RawRepresentable, Sendable {

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
                public let rawValue: String

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
                ///     // Prints "Optional(PaperSize.Legal)"
                ///
                ///     print(PaperSize(rawValue: "Tabloid"))
                ///     // Prints "nil"
                ///
                /// - Parameter rawValue: The raw value to use for the new instance.
                public init(rawValue: String)

                public static let acquisition: Transaction.AdvancedCommerceInfo.Offer.Reason

                public static let retention: Transaction.AdvancedCommerceInfo.Offer.Reason

                public static let winBack: Transaction.AdvancedCommerceInfo.Offer.Reason

                /// The raw type that can be used to represent all values of the conforming
                /// type.
                ///
                /// Every distinct value of the conforming type has a corresponding unique
                /// value of the `RawValue` type, but there may be values of the `RawValue`
                /// type that don't have a corresponding value of the conforming type.
                @available(macOS 15.4, iOS 18.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
                public typealias RawValue = String
            }

            public let price: Decimal

            public let period: SubscriptionPeriod

            public let periodCount: Int

            public let reason: Transaction.AdvancedCommerceInfo.Offer.Reason

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Transaction.AdvancedCommerceInfo.Offer, b: Transaction.AdvancedCommerceInfo.Offer) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public struct Refund : Equatable, Hashable, Sendable {

            public struct Reason : Equatable, Hashable, RawRepresentable, Sendable {

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
                public let rawValue: String

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
                ///     // Prints "Optional(PaperSize.Legal)"
                ///
                ///     print(PaperSize(rawValue: "Tabloid"))
                ///     // Prints "nil"
                ///
                /// - Parameter rawValue: The raw value to use for the new instance.
                public init(rawValue: String)

                public static let legal: Transaction.AdvancedCommerceInfo.Refund.Reason

                public static let modifyItems: Transaction.AdvancedCommerceInfo.Refund.Reason

                public static let unintended: Transaction.AdvancedCommerceInfo.Refund.Reason

                public static let unfulfilled: Transaction.AdvancedCommerceInfo.Refund.Reason

                public static let unsatisfied: Transaction.AdvancedCommerceInfo.Refund.Reason

                public static let other: Transaction.AdvancedCommerceInfo.Refund.Reason

                /// The raw type that can be used to represent all values of the conforming
                /// type.
                ///
                /// Every distinct value of the conforming type has a corresponding unique
                /// value of the `RawValue` type, but there may be values of the `RawValue`
                /// type that don't have a corresponding value of the conforming type.
                @available(macOS 15.4, iOS 18.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
                public typealias RawValue = String
            }

            public struct RefundType : Equatable, Hashable, RawRepresentable, Sendable {

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
                public let rawValue: String

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
                ///     // Prints "Optional(PaperSize.Legal)"
                ///
                ///     print(PaperSize(rawValue: "Tabloid"))
                ///     // Prints "nil"
                ///
                /// - Parameter rawValue: The raw value to use for the new instance.
                public init(rawValue: String)

                public static let custom: Transaction.AdvancedCommerceInfo.Refund.RefundType

                public static let proRated: Transaction.AdvancedCommerceInfo.Refund.RefundType

                public static let full: Transaction.AdvancedCommerceInfo.Refund.RefundType

                /// The raw type that can be used to represent all values of the conforming
                /// type.
                ///
                /// Every distinct value of the conforming type has a corresponding unique
                /// value of the `RawValue` type, but there may be values of the `RawValue`
                /// type that don't have a corresponding value of the conforming type.
                @available(macOS 15.4, iOS 18.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
                public typealias RawValue = String
            }

            public let reason: Transaction.AdvancedCommerceInfo.Refund.Reason

            public let type: Transaction.AdvancedCommerceInfo.Refund.RefundType

            public let date: Date

            public let amount: Decimal

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: Transaction.AdvancedCommerceInfo.Refund, b: Transaction.AdvancedCommerceInfo.Refund) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public let requestReferenceID: String

        public let estimatedTax: Decimal

        public let taxRate: Decimal

        public let taxCode: String

        public let taxExclusivePrice: Decimal

        public let description: String?

        public let displayName: String?

        public let period: SubscriptionPeriod?

        public let items: [Transaction.AdvancedCommerceInfo.Item]

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Transaction.AdvancedCommerceInfo, b: Transaction.AdvancedCommerceInfo) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Transaction, rhs: Transaction) -> Bool
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction : CustomDebugStringConvertible {

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
    @inlinable public var debugDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction {

    public struct Transactions : AsyncSequence {

        /// The type of element produced by this asynchronous sequence.
        public typealias Element = VerificationResult<Transaction>

        /// The type of asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        public struct AsyncIterator : AsyncIteratorProtocol {

            /// Asynchronously advances to the next element and returns it, or ends the
            /// sequence if there is no next element.
            ///
            /// - Returns: The next element, if it exists, or `nil` to signal the end of
            ///   the sequence.
            public mutating func next() async -> VerificationResult<Transaction>?

            @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
            public typealias Element = VerificationResult<Transaction>
        }

        /// Creates the asynchronous iterator that produces elements of this
        /// asynchronous sequence.
        ///
        /// - Returns: An instance of the `AsyncIterator` type used to produce
        /// elements of the asynchronous sequence.
        public func makeAsyncIterator() -> Transaction.Transactions.AsyncIterator
    }

    /// A sequence of every transaction for this user and app.
    public static var all: Transaction.Transactions { get }

    /// Returns all transactions for products the user is currently entitled to
    ///
    /// i.e. all currently-subscribed transactions, and all purchased (and not refunded) non-consumables
    public static var currentEntitlements: Transaction.Transactions { get }

    /// Get the transaction that entitles the user to a product.
    /// - Parameter productID: Identifies the product to check entitlements for.
    /// - Returns: A transaction if the user is entitled to the product, or `nil` if they are not.
    /// @DeprecationSummary { Use  ``currentEntitlements(for:)`` method instead. }
    @available(iOS, introduced: 15.0, deprecated: 18.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(macOS, introduced: 12.0, deprecated: 15.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(tvOS, introduced: 15.0, deprecated: 18.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(watchOS, introduced: 8.0, deprecated: 11.4, message: "Use the currentEntitlements(for:) method instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the currentEntitlements(for:) method instead.")
    public static func currentEntitlement(for productID: String) async -> VerificationResult<Transaction>?

    /// The user's latest transaction for a product.
    /// - Parameter productID: Identifies the product to check entitlements for.
    /// - Returns: A verified transaction, or `nil` if the user has never purchased this product.
    public static func latest(for productID: String) async -> VerificationResult<Transaction>?

    /// A sequence of every unfinished transaction for this user and app.
    public static var unfinished: Transaction.Transactions { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction {

    /// A sequence that emits a transaction each time it is created or updated.
    /// - Important: Create a `Task` to iterate this sequence as early as possible when your app
    ///              launches. This is important, for example, to handle transactions that may have
    ///              occured after `purchase` returns, like an adult approving a child's purchase
    ///              request or a purchase made on another device.
    /// - Note: Any unfinished transactions will be emitted from `updates` when you first iterate the
    ///         sequence.
    public static var updates: Transaction.Transactions { get }
}

extension Transaction {

    /// Gets all the transactions associated with this product ID.
    /// - Parameter productID: Identifies the product to filter the transaction cache against.
    /// - Returns: A sequence containing all transactions for the given product.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    public static func all(for productID: String) -> Transaction.Transactions

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
    public static func currentEntitlements(for productID: String) -> Transaction.Transactions
}

@available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction {

    @available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public enum RefundRequestError : Error {

        case duplicateRequest

        case failed

        @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
        case ineligible

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Transaction.RefundRequestError, b: Transaction.RefundRequestError) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    @available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public enum RefundRequestStatus {

        /// The user successfully requested a refund
        /// - Note: This does not mean the refund was approved yet.
        case success

        /// The user cancelled the refund request.
        case userCancelled

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Transaction.RefundRequestStatus, b: Transaction.RefundRequestStatus) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    /// Display the refund request sheet for this transaction.
    /// - Parameter scene: The window scene to present the refund request sheet in.
    /// - Returns: The result of the refund request.
    /// - Throws: `RefundRequestError` or `StoreKitError`.
    @available(iOS 15.0, visionOS 1.0, *)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @inlinable public func beginRefundRequest(in scene: UIWindowScene) async throws -> Transaction.RefundRequestStatus

    /// Display the refund request sheet.
    /// - Parameters:
    ///   - transactionID: The transaction ID to request a refund for.
    ///   - scene: The window scene to present the refund request sheet in.
    /// - Returns: The result of the refund request.
    /// - Throws: `RefundRequestError` or `StoreKitError`.
    @available(iOS 15.0, visionOS 1.0, *)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor public static func beginRefundRequest(for transactionID: UInt64, in scene: UIWindowScene) async throws -> Transaction.RefundRequestStatus
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction {

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
    @backDeployed(before: iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0)
    public var subscriptionStatus: Product.SubscriptionInfo.Status? { get async }
}

@available(iOS 15.0, tvOS 15.0, macOS 12.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction : Sendable {
}

@available(iOS 15.0, tvOS 15.0, macOS 12.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.RevocationReason : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Transaction.RevocationReason {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, tvOS 15.0, macOS 12.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.OfferType : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Transaction.OfferType {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, tvOS 15.0, macOS 12.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.OwnershipType : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension Transaction.OwnershipType {

    public var localizedDescription: String { get }
}

@available(iOS 15.0, tvOS 15.0, macOS 12.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.Transactions : Sendable {
}

@available(iOS 15.0, tvOS 17.0, macOS 12.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction.RefundRequestError : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction.RefundRequestError : LocalizedError {

    /// A localized message describing what error occurred.
    public var errorDescription: String? { get }

    /// A localized message describing the reason for the failure.
    public var failureReason: String? { get }

    /// A localized message describing how one might recover from the failure.
    public var recoverySuggestion: String? { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction.RefundRequestError : Equatable {
}

@available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction.RefundRequestError : Hashable {
}

@available(iOS 15.0, tvOS 17.0, macOS 12.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction.RefundRequestStatus : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction.RefundRequestStatus : Equatable {
}

@available(iOS 15.0, macOS 12.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Transaction.RefundRequestStatus : Hashable {
}

/// Describes the result of verifying the signature for the associated value of `SignedType`.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@frozen public enum VerificationResult<SignedType> {

    /// The associated value failed verification for the provided reason.
    case unverified(SignedType, VerificationResult<SignedType>.VerificationError)

    /// The associated value passed all automatic verification checks.
    case verified(SignedType)

    /// Get the payload value from this verification result.
    /// - Throws: `VerificationResult.VerificationError` if the value is unverified.
    public var payloadValue: SignedType { get throws }

    /// Ignore the result of StoreKit's verification, and get the payload value.
    /// - SeeAlso: In order to check whether StoreKit was able to verify the signature,  use the
    ///           `payloadValue` property or a pattern matching technique such as a switch
    ///            statement.
    public var unsafePayloadValue: SignedType { get }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension VerificationResult where SignedType == AppTransaction {

    /// The raw JSON web signature for the signed value.
    public var jwsRepresentation: String { get }

    /// The data for the header component of the JWS.
    public var headerData: Data { get }

    /// The data for the payload component of the JWS.
    public var payloadData: Data { get }

    /// The data for the signature component of the JWS.
    public var signatureData: Data { get }

    /// The signature of the JWS, converted to a `CryptoKit` value.
    public var signature: P256.Signing.ECDSASignature { get }

    /// The component of the JWS that the signature is computed over.
    public var signedData: Data { get }

    /// The date the signature was generated.
    public var signedDate: Date { get }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    public var deviceVerification: Data { get }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    public var deviceVerificationNonce: UUID { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult where SignedType == Transaction {

    /// The raw JSON web signature for the signed value.
    public var jwsRepresentation: String { get }

    /// The data for the header component of the JWS.
    public var headerData: Data { get }

    /// The data for the payload component of the JWS.
    public var payloadData: Data { get }

    /// The data for the signature component of the JWS.
    public var signatureData: Data { get }

    /// The signature of the JWS, converted to a `CryptoKit` value.
    public var signature: P256.Signing.ECDSASignature { get }

    /// The component of the JWS that the signature is computed over.
    public var signedData: Data { get }

    /// The date the signature was generated.
    public var signedDate: Date { get }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    public var deviceVerification: Data { get }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    public var deviceVerificationNonce: UUID { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult where SignedType == Product.SubscriptionInfo.RenewalInfo {

    /// The raw JSON web signature for the signed value.
    public var jwsRepresentation: String { get }

    /// The data for the header component of the JWS.
    public var headerData: Data { get }

    /// The data for the payload component of the JWS.
    public var payloadData: Data { get }

    /// The data for the signature component of the JWS.
    public var signatureData: Data { get }

    /// The signature of the JWS, converted to a `CryptoKit` value.
    public var signature: P256.Signing.ECDSASignature { get }

    /// The component of the JWS that the signature is computed over.
    public var signedData: Data { get }

    /// The date the signature was generated.
    public var signedDate: Date { get }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    public var deviceVerification: Data { get }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    public var deviceVerificationNonce: UUID { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult {

    public enum VerificationError : Error {

        /// The certificate chain was parsable, but was invalid due to one or more revoked certificates.
        ///
        /// Trying again later may retrieve valid signed data from the App Store.
        case revokedCertificate

        /// The certificate chain was parsable, but it was invalid for signing this data.
        case invalidCertificateChain

        /// The device verification properties were invalid for this device.
        case invalidDeviceVerification

        /// Th JWS header and any data included in it or it's certificate chain had an invalid encoding.
        case invalidEncoding

        /// The certificate chain was valid for signing this data, but the leaf's public key was invalid for the
        /// JWS signature.
        case invalidSignature

        /// Either the JWS header or any certificate in the chain was missing necessary properties for
        /// verification.
        case missingRequiredProperties

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: VerificationResult<SignedType>.VerificationError, b: VerificationResult<SignedType>.VerificationError) -> Bool

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: In your implementation of `hash(into:)`,
        ///   don't call `finalize()` on the `hasher` instance provided,
        ///   or replace it with a different instance.
        ///   Doing so may become a compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        ///   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult : Equatable where SignedType : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: VerificationResult<SignedType>, b: VerificationResult<SignedType>) -> Bool
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult : Hashable where SignedType : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult : CustomDebugStringConvertible where SignedType : CustomDebugStringConvertible {

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
    public var debugDescription: String { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult : Sendable where SignedType : Sendable {
}

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
extension VerificationResult.VerificationError : LocalizedError {

    /// A localized message describing what error occurred.
    public var errorDescription: String? { get }

    /// A localized message describing the reason for the failure.
    public var failureReason: String? { get }

    /// A localized message describing how one might recover from the failure.
    public var recoverySuggestion: String? { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult.VerificationError : Equatable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult.VerificationError : Hashable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension DateComponents {

    /// Convert a `Product.SubscriptionPeriod` to `DateComponents`.
    /// - Parameter period: The subscription period to convert.
    public init(subscriptionPeriod period: Product.SubscriptionPeriod)
}

extension NSXPCConnection : @unchecked @retroactive Sendable {
}


// MARK: - SwiftUI Additions

import CoreGraphics
import SwiftUI
import os.log

// Available when SwiftUI is imported with StoreKit
/// A view representing the automatic placeholder icon for a product view.
///
/// You don't use this type directly. Instead, create an ``ProductView`` or ``StoreView`` by
/// providing product identifiers without a custom placeholder icon.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct AutomaticProductPlaceholderIcon : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension AutomaticProductPlaceholderIcon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// The automatic product view style, based on the view's context.
///
/// You can also use ``ProductViewStyle/automatic`` to construct this style
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct AutomaticProductViewStyle : ProductViewStyle {

    /// Creates an automatic product view style.
    nonisolated public init()

    /// Creates a view that represents the body of a product view.
    /// - Parameter configuration: The properties of a product view.
    @MainActor @preconcurrency public func makeBody(configuration: AutomaticProductViewStyle.Configuration) -> some View


    /// A view that represents the body of a product view.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension AutomaticProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct AutomaticSubscriptionOfferViewStyle : Sendable, SubscriptionOfferViewStyle {

    nonisolated public init()

    @MainActor public func makeBody(configuration: AutomaticSubscriptionOfferViewStyle.Configuration) -> some View


    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
/// A view representing the default label for a subscription option group.
///
/// You don't use this view directly. Instead, StoreKit automatically uses this view to label groups you create
/// using ``SubscriptionOptionGroup`` or ``SubscriptionPeriodGroupSet`` without
/// providing a custom label.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct AutomaticSubscriptionOptionGroupLabel : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension AutomaticSubscriptionOptionGroupLabel : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// The automatic subscrption option group style, based on the group's context.
///
/// You can also use ``automatic`` to construct this style.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct AutomaticSubscriptionOptionGroupStyle : SubscriptionOptionGroupStyle {

    /// Creates an automatic subscription option group style.
    public init()
}

// Available when SwiftUI is imported with StoreKit
/// The system-defined placements of a subscription store view.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct AutomaticSubscriptionStoreControlPlacement : SubscriptionStoreControlPlacement {

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
    public var rawValue: SubscriptionStoreControlPlacementKey { get }

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
    ///     // Prints "Optional(PaperSize.Legal)"
    ///
    ///     print(PaperSize(rawValue: "Tabloid"))
    ///     // Prints "nil"
    ///
    /// - Parameter rawValue: The raw value to use for the new instance.
    public init(rawValue: SubscriptionStoreControlPlacementKey)

    /// A context appropriate placement automatically determined by the system.
    public static var automatic: AutomaticSubscriptionStoreControlPlacement { get }

    /// A placement that locates the subscription controls within the main scroll view of a subscription store view.
    @available(tvOS, unavailable)
    public static var scrollView: AutomaticSubscriptionStoreControlPlacement { get }

    /// A placement that locates the subscription controls within the bottom bar, overlapping the scroll
    /// content if necessary.
    ///
    /// The bottom bar will conditonally apply a special visual treatment when it is overlapping the scroll
    /// content of the subscription store view. Content contained within the bottom bar does not scroll with
    /// the rest of the scroll view's content.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var bottomBar: AutomaticSubscriptionStoreControlPlacement { get }

    /// A hybrid placement that combines elements of the bottom bar and scroll view placements.
    ///
    /// This placement positions the subscriptions controls within the main scroll view of the subscription 
    /// store view, and places the confirmation content and any auxiliary buttons in the bottom bar,
    /// overlapping the scroll content if necessary.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var buttonsInBottomBar: AutomaticSubscriptionStoreControlPlacement { get }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias RawValue = SubscriptionStoreControlPlacementKey
}

// Available when SwiftUI is imported with StoreKit
/// The default subscription store control style, choosing a standard style automatically based on the view's
/// context.
///
/// You can also use ``SubscriptionStoreControlStyle/automatic`` to construct this style.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct AutomaticSubscriptionStoreControlStyle : SubscriptionStoreControlStyle {

    /// The placement of the subscription controls in the subscription store.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public struct Placement : SubscriptionStoreControlPlacement {

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
        public var rawValue: SubscriptionStoreControlPlacementKey { get }

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: SubscriptionStoreControlPlacementKey)

        /// A context appropriate placement automatically determined by the system.
        public static var automatic: AutomaticSubscriptionStoreControlStyle.Placement { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public typealias RawValue = SubscriptionStoreControlPlacementKey
    }

    /// Creates a default subscription store control style.
    @MainActor @preconcurrency public init()

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @MainActor @preconcurrency public func makeBody(configuration: AutomaticSubscriptionStoreControlStyle.Configuration) -> some View


    /// A view that represents the body of a subscription store control.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension AutomaticSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A view representing the default marketing content for a subscription store view.
///
/// You don't use this type directly. Instead, create an ``SubscriptionStoreView`` using an initializer
/// that doesn't take a custom view to use for marketing content.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct AutomaticSubscriptionStoreMarketingContent : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension AutomaticSubscriptionStoreMarketingContent : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// The standard picker option label for a subscription store view.
///
/// You don't create this view directly, instead declare a
/// ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` without a custom label.
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct AutomaticSubscriptionStorePickerOptionLabel : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension AutomaticSubscriptionStorePickerOptionLabel : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A subscription store control style that displays a subscribe button for each subscription plan.
///
/// You can also use ``SubscriptionStoreControlStyle/buttons`` to construct this style.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct ButtonsSubscriptionStoreControlStyle : SubscriptionStoreControlStyle {

    /// The placement of the subscription controls in the subscription store.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public struct Placement : SubscriptionStoreControlPlacement {

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
        public var rawValue: SubscriptionStoreControlPlacementKey { get }

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: SubscriptionStoreControlPlacementKey)

        /// A context appropriate placement automatically determined by the system.
        public static var automatic: ButtonsSubscriptionStoreControlStyle.Placement { get }

        /// A placement that locates the subscription controls within the main scroll view of a subscription store view.
        @available(tvOS, unavailable)
        public static var scrollView: ButtonsSubscriptionStoreControlStyle.Placement { get }

        /// A placement that locates the subscription controls within the bottom bar, overlapping the scroll
        /// content if necessary.
        ///
        /// The bottom bar will conditonally apply a special visual treatment when it is overlapping the
        /// scroll content of the subscription store view. Content contained within the bottom bar does not
        /// scroll with the rest of the scroll view's content.
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static var bottomBar: ButtonsSubscriptionStoreControlStyle.Placement { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public typealias RawValue = SubscriptionStoreControlPlacementKey
    }

    /// Creates a button in-app subscription store control style.
    @MainActor @preconcurrency public init()

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @MainActor @preconcurrency public func makeBody(configuration: ButtonsSubscriptionStoreControlStyle.Configuration) -> some View


    /// A view that represents the body of a subscription store control.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ButtonsSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A subscription store control style that displays subscription plans as a compact picker control, with a single
/// button to subscribe.
///
/// This style prefers to layout picker options in a horizontal stack, but can scroll horizontally if the container
/// width isn't sufficient. It's recommended to only use this style when you expect your store to display two
/// or three subscription options.
///
/// You can also use ``SubscriptionStoreControlStyle/compactPicker`` to construct this style.
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor @preconcurrency public struct CompactPickerSubscriptionStoreControlStyle : SubscriptionStoreControlStyle {

    /// A type that describes the placement of a compact picker in a subscription store view.
    public struct Placement : SubscriptionStoreControlPlacement {

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
        public var rawValue: SubscriptionStoreControlPlacementKey { get }

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: SubscriptionStoreControlPlacementKey)

        /// A context appropriate placement automatically determined by the system.
        public static var automatic: CompactPickerSubscriptionStoreControlStyle.Placement { get }

        /// A placement that locates the subscription controls within the main scroll view of a subscription store view.
        public static var scrollView: CompactPickerSubscriptionStoreControlStyle.Placement { get }

        /// A placement that locates the subscription controls within the bottom bar, overlapping the scroll
        /// content if necessary.
        ///
        /// The bottom bar will conditonally apply a special visual treatment when it is overlapping the
        /// scroll content of the subscription store view. Content contained within the bottom bar does not
        /// scroll with the rest of the scroll view's content.
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static var bottomBar: CompactPickerSubscriptionStoreControlStyle.Placement { get }

        /// A hybrid placement that combines elements of the bottom bar and scroll view placements.
        ///
        /// This placement positions the subscriptions controls within the main scroll view of the subscription
        /// store view, and places the confirmation content and any auxiliary buttons in the bottom bar,
        /// overlapping the scroll content if necessary.
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static var buttonsInBottomBar: CompactPickerSubscriptionStoreControlStyle.Placement { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 15.0, iOS 18.0, visionOS 2.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public typealias RawValue = SubscriptionStoreControlPlacementKey
    }

    /// Creates a compact picker subscription store control style.
    @MainActor @preconcurrency public init()

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @MainActor @preconcurrency public func makeBody(configuration: CompactPickerSubscriptionStoreControlStyle.Configuration) -> some View


    /// A view that represents the body of a subscription store control.
    @available(macOS 15.0, iOS 18.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CompactPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A product view style suitable for layouts where less space is available, or for displaying more items in a
/// small amount of space.
///
/// On iOS and macOS, the style will grow to fit the available width.
///
/// You can also use ``ProductViewStyle/compact`` to construct this style.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
@MainActor @preconcurrency public struct CompactProductViewStyle : ProductViewStyle {

    /// Creates a compact product view style.
    nonisolated public init()

    /// Creates a view that represents the body of a product view.
    /// - Parameter configuration: The properties of a product view.
    @MainActor @preconcurrency public func makeBody(configuration: CompactProductViewStyle.Configuration) -> some View


    /// A view that represents the body of a product view.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, *)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension CompactProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct CompactSubscriptionOfferViewStyle : Sendable, SubscriptionOfferViewStyle {

    nonisolated public init()

    @MainActor public func makeBody(configuration: CompactSubscriptionOfferViewStyle.Configuration) -> some View


    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct DisplayMessageAction {

    @MainActor public func callAsFunction(_ message: Message) throws
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DisplayMessageAction : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// The state of an entitlement task.
///
/// Use `currentEntitlementTask(for:priority:action:)` or
/// `subscriptionStatusTask(for:priority:action:)` on a `View` to get an
/// `EntitlementTaskState`.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public enum EntitlementTaskState<Value> {

    /// The task is loading the entitlement in the background.
    case loading

    /// The task failed with an error.
    case failure(any Error)

    /// The task successfully loaded the entitlement.
    case success(Value)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState : Sendable where Value : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState {

    /// The entitlement value if the task was successful.
    ///
    /// Use this as a convenience to access the entitlement value in code that doesn't depend on the
    /// reason the value can't be accessed. The value is `nil` while the value is loading, or if it fails to
    /// load for any reason.
    public var value: Value? { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState where Value == VerificationResult<Transaction>? {

    /// The entitlement value if the task was successful.
    ///
    /// Use this as a convenience to access the transaction value in code that doesn't depend on the
    /// reason the transaction is not available. The value is `nil` while the transaction is loading, if it fails
    /// to load for any reason, or the customer is not entitled to the product.
    public var transaction: VerificationResult<Transaction>? { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState {

    /// Returns a new state, mapping the entitlement value if successful.
    public func map<NewValue>(_ transform: (Value) throws -> NewValue) rethrows -> EntitlementTaskState<NewValue>

    /// Returns a new state, mapping the entitlement value if successful.
    public func map<NewValue>(_ transform: (Value) async throws -> NewValue) async rethrows -> EntitlementTaskState<NewValue>

    /// Returns a new state, mapping the entitlement value if successful.
    public func flatMap<NewValue>(_ transform: (Value) throws -> EntitlementTaskState<NewValue>) rethrows -> EntitlementTaskState<NewValue>

    /// Returns a new state, mapping the entitlement value if successful.
    public func flatMap<NewValue>(_ transform: (Value) async throws -> EntitlementTaskState<NewValue>) async rethrows -> EntitlementTaskState<NewValue>
}

// Available when SwiftUI is imported with StoreKit
/// You don't use this type directly. Instead, StoreKit uses this type to transform your store's content into a
/// SwiftUI view when when declaring a subscription store view with a custom content structure.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct IdentifiedStoreContent<IdentifiedView> where IdentifiedView : View {
}

// Available when SwiftUI is imported with StoreKit
/// A product view style suitable for layouts where in-app purchase content is prominent.
///
/// You can also use ``ProductViewStyle/large`` to construct this style.
@available(iOS 17.0, macOS 14.0, visionOS 1.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct LargeProductViewStyle : ProductViewStyle {

    /// Creates a large product view style.
    nonisolated public init()

    /// Creates a view that represents the body of a product view.
    /// - Parameter configuration: The properties of a product view.
    @MainActor @preconcurrency public func makeBody(configuration: LargeProductViewStyle.Configuration) -> some View


    /// A view that represents the body of a product view.
    @available(macOS 14.0, iOS 17.0, visionOS 1.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, visionOS 1.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension LargeProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A subscription option group style which displays the first subgroup's content along with links to navigate to
/// each other subgroup.
///
/// Since the first subgroup's content is displayed initially, you don't need to provide a label. StoreKit provides
/// an automatic label for links to other subgroups, but you can provide a label with your subgroups to
/// customize this.
///
/// You can also use ``links`` to construct this style.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct LinksSubscriptionOptionGroupStyle : SubscriptionOptionGroupStyle {

    /// Creates a links subscription option group style.
    public init()
}

// Available when SwiftUI is imported with StoreKit
/// A subscription store control style that displays subscription plans as a paged picker control, with a single
/// button to subscribe.
///
/// On iOS and macOS, the paged picker prefers to use a page style tab view to display picker options in
/// compact containers. For sufficiently wide containers, the paged picker lays out picker options in a
/// horizontal stack.
///
/// On watchOS, the paged picker shows the current selection in a collapsed state. When you focus on the
/// control, you can use the digital crown to change the selection.
///
/// You can also use ``SubscriptionStoreControlStyle/pagedPicker`` to construct this style.
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct PagedPickerSubscriptionStoreControlStyle : SubscriptionStoreControlStyle {

    /// A type that describes the placement of a paged picker in a subscription store view.
    public struct Placement : SubscriptionStoreControlPlacement {

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
        public var rawValue: SubscriptionStoreControlPlacementKey { get }

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: SubscriptionStoreControlPlacementKey)

        /// A context appropriate placement automatically determined by the system.
        public static var automatic: PagedPickerSubscriptionStoreControlStyle.Placement { get }

        /// A placement that locates the subscription controls within the main scroll view of a subscription store view.
        public static var scrollView: PagedPickerSubscriptionStoreControlStyle.Placement { get }

        /// A placement that locates the subscription controls within the bottom bar, overlapping the scroll
        /// content if necessary.
        ///
        /// The bottom bar will conditonally apply a special visual treatment when it is overlapping the
        /// scroll content of the subscription store view. Content contained within the bottom bar does not
        /// scroll with the rest of the scroll view's content.
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static var bottomBar: PagedPickerSubscriptionStoreControlStyle.Placement { get }

        /// A hybrid placement that combines elements of the bottom bar and scroll view placements.
        ///
        /// This placement positions the subscriptions controls within the main scroll view of the subscription
        /// store view, and places the confirmation content and any auxiliary buttons in the bottom bar,
        /// overlapping the scroll content if necessary.
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static var buttonsInBottomBar: PagedPickerSubscriptionStoreControlStyle.Placement { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @available(tvOS, unavailable)
        public typealias RawValue = SubscriptionStoreControlPlacementKey
    }

    /// Creates a paged picker subscription store control style.
    @MainActor @preconcurrency public init()

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @MainActor @preconcurrency public func makeBody(configuration: PagedPickerSubscriptionStoreControlStyle.Configuration) -> some View


    /// A view that represents the body of a subscription store control.
    @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension PagedPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A subscription store control style that displays subscription plans as a paged prominent picker control, with
/// a single button to subscribe.
///
/// The paged prominent picker prefers to use a page style tab view to display picker options in compact
/// containers. For sufficiently wide containers, the paged prominent picker lays out picker options in a
/// horizontal stack.
///
/// You can also use ``SubscriptionStoreControlStyle/pagedProminentPicker`` to construct
/// this style.
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor @preconcurrency public struct PagedProminentPickerSubscriptionStoreControlStyle : SubscriptionStoreControlStyle {

    /// A type that describes the placement of a paged picker in a subscription store view.
    public typealias Placement = PagedPickerSubscriptionStoreControlStyle.Placement

    /// Creates a paged picker subscription store control style.
    @MainActor @preconcurrency public init()

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @MainActor @preconcurrency public func makeBody(configuration: PagedProminentPickerSubscriptionStoreControlStyle.Configuration) -> some View


    /// A view that represents the body of a subscription store control.
    @available(macOS 15.0, iOS 18.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PagedProminentPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A subscription store control style that displays subscription plans as a picker control, with a single
/// button to subscribe.
///
/// You can also use ``SubscriptionStoreControlStyle/picker`` to construct this style.
@available(iOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct PickerSubscriptionStoreControlStyle : SubscriptionStoreControlStyle {

    /// The placement of the subscription controls in the subscription store.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    public struct Placement : SubscriptionStoreControlPlacement {

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
        public var rawValue: SubscriptionStoreControlPlacementKey { get }

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
        ///     // Prints "Optional(PaperSize.Legal)"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: SubscriptionStoreControlPlacementKey)

        /// A context appropriate placement automatically determined by the system.
        public static var automatic: PickerSubscriptionStoreControlStyle.Placement { get }

        /// A placement that locates the subscription controls within the main scroll view of a subscription store view.
        public static var scrollView: PickerSubscriptionStoreControlStyle.Placement { get }

        /// A hybrid placement that combines elements of the bottom bar and scroll view placements.
        ///
        /// This placement positions the subscriptions controls within the main scroll view of the subscription
        /// store view, and places the confirmation content and any auxiliary buttons in the bottom bar,
        /// overlapping the scroll content if necessary.
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public static var buttonsInBottomBar: PickerSubscriptionStoreControlStyle.Placement { get }

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @available(tvOS, unavailable)
        public typealias RawValue = SubscriptionStoreControlPlacementKey
    }

    /// Creates a picker subscription store control style.
    @MainActor @preconcurrency public init()

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @MainActor @preconcurrency public func makeBody(configuration: PickerSubscriptionStoreControlStyle.Configuration) -> some View


    /// A view that represents the body of a subscription store control.
    @available(macOS 14.0, iOS 17.0, watchOS 10.0, visionOS 1.0, *)
    @available(tvOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@available(tvOS, unavailable)
extension PickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// The current phase of the asynchronous loading operation of the promotional image for
/// a given App Store product.
///
/// When you create a ``ProductView`` instance with the phase-based
/// initializer, you define the appearance of the product view's icon using a
/// content closure. StoreKit calls the closure with a phase value at different points
/// during the load operation of the promoted IAP image you've set up in App Store Connect
/// to indicate the current state. Use the phase to decide what to draw. For example,
/// you can draw the loaded image if it exists, a view that indicates an error, or a
/// placeholder:
/// ```
/// ProductView(id: "com.example.product") { phase in
///     switch phase {
///         case .success(let promotedIcon): promotedIcon
///         case .failure(let error): MyErrorView(error)
///         case .unavailable: MyFallbackIcon()
///         case .loading: MyPlaceholderIcon()
///     }
/// }
/// ```
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public enum ProductIconPhase {

    /// The promotional icon successfully loaded
    case success(Image)

    /// The promotional icon failed to load with an error
    case failure(any Error)

    /// The promotional icon is not available for download
    case unavailable

    /// The promotional icon has not yet loaded
    case loading
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductIconPhase {

    /// The promotional image if the loading task was successful.
    ///
    /// Use this as a convenience to access the product value in code that doesn't depend on the reason
    /// the icon can't be accessed. The value is `nil` while the icon is loading, or if the icon
    /// can't be accessed for any reason.
    public var promotionalIcon: Image? { get }

    /// The error if the loading task was unsuccessful.
    ///
    /// Use this as a convenience to access the error value in code that assumes there has
    /// been a promotional image set up for the product in App Store Connect. The value is `nil`
    /// while the icon is loading, if the icon has successfully loaded, or if the promotional image
    /// for the product has not been set up in App Store Connect.
    public var error: (any Error)? { get }
}

// Available when SwiftUI is imported with StoreKit
/// A view that merchandises an invididual in-app purchase product.
///
/// You create a product view by providing a product identifier to load from the App Store, or a
/// ``StoreKit/Product`` value you've already loaded. If you provide a product identifier, the view will 
/// load the product's information from the App Store automatically, and update the view when the product is
/// available. The product view shows information about the product, and displays a button for someone to
/// purchase the product.
///
/// You can also provide a view to use as an icon for the product view. If you provide a product identifier,
/// you can optionally provide a different placeholder for your icon other than the automatic placeholder icon.
/// If you set up a promoted image for the product in App Store Connect, you can choose to use that image
/// as the icon.
///
/// You can customize the product view's appearance using one of the standard styles, like
/// ``ProductViewStyle/compact``, and apply the style with the
/// ``productViewStyle(_:)-8by3`` modifier.
///
/// You can also create custom styles. To create a custom style, create a style that conforms to the
/// ``ProductViewStyle`` protocol.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct ProductView<Icon, PlaceholderIcon> : View where Icon : View, PlaceholderIcon : View {

    /// Creates a view to load an individual product from the App Store, and merchandise it
    /// with a promotional icon and custom placeholder icon.
    ///
    /// The product view will show the placeholder icon until the product finishes loading.
    /// After the product has finished loading, the view will asynchronously load and display
    /// the product's promotional image. Use the `ProductIconPhase` to monitor the
    /// current loading state of the product's promotional image.
    ///
    /// If the product is unavailable, the view provided by the `placeholderIcon` closure is used
    /// as a fallback.
    ///
    /// If the promotional image is unavailable, the phase is ``ProductIconPhase.unavailable``.
    /// If the promotional image is available, but the loading operation has not yet finished, the
    /// phase is ``ProductIconPhase.loading``. After the promotional image's loading operation
    /// completes, the phase becomes either ``ProductIconPhase.failure(_:)`` or
    /// ``ProductIconPhase.success(_:)``. In the first case, the phase’s ``ProductIconPhase.error``
    /// value indicates the reason for failure. In the second case, the phase’s
    /// ``ProductIconPhase.promotionalIcon`` property contains the loaded image.
    ///
    /// Use the phase to drive the output of the icon closure, which defines the view’s icon
    /// appearance after the initial loading of the product's metadata. Consider returning the view
    /// provided in the `placeholderIcon` closure for the ``ProductIconPhase.loading`` value:
    /// ```
    /// ProductView(id: "com.example.product") { phase in
    ///     switch phase {
    ///     case .loading: MyPlaceholder()
    ///     case .failure(let error): MyErrorView(error)
    ///     case .unavailable: MyFallbackIcon()
    ///     case .success(let promotedIcon): promotedIcon
    ///     }
    /// } placeholderIcon: {
    ///     // When product is loading/unavailable
    ///     MyPlaceholder()
    /// }
    /// ```
    /// - Parameters:
    ///   - productID: The product identifier to load from the App Store.
    ///   - icon: A closure that receives a ``ProductIconPhase`` as an input
    ///           to indicate the state of the loading operation of the product's promotional
    ///           image. Returns the view to display for the specified phase.
    ///   - placeholderIcon: The icon to use until the product finishes loading from the App Store.
    nonisolated public init(id productID: Product.ID, @ViewBuilder icon: @escaping (ProductIconPhase) -> Icon, @ViewBuilder placeholderIcon: () -> PlaceholderIcon)

    /// Creates a view to load an individual product from the App Store, and merchandise it using an icon
    /// and custom placeholder icon.
    ///
    /// The product view will show the custom placeholder icon until the product finishes loading.
    /// After the product finishes loading, the view you provide will be used as the icon by default. If you set
    /// `prefersPromotionalIcon` to `true` and the product has a promotional image
    /// available, the promotional image will be used as the icon instead of the view you provide.
    ///
    /// To gain more control over the loading process of the icon used to decorate this view, use the
    /// ``init(id:icon:placeholderIcon:)`` initializer, which takes an icon closure that receives a
    /// ``ProductIconPhase`` to indicate the state of the loading operation of the
    /// promotional icon.
    ///
    /// The following example shows how to create a product view using an icon and custom placeholder icon:
    /// ```
    /// ProductView(id: "com.example.product") {
    ///     Image(systemName: "star.fill")
    ///         .foregroundStyle(.yellow)
    /// } placeholderIcon: {
    ///     Image(systemName: "star.fill")
    ///         .foregroundStyle(.gray)
    /// }
    /// ```
    /// - Parameters:
    ///   - productID: The product identifier to load from the App Store.
    ///   - prefersPromotionalIcon: Whether to use the promotional image from the App Store if
    ///                             it is available. If a promotional image for the product is
    ///                             available, it will be displayed instead of the view you provide
    ///                             for `icon`.
    ///   - icon: The icon to use when the product sucessfully finishes loading from the App Store.
    ///   - placeholderIcon: The icon to use until the product finishes loading from the App Store.
    nonisolated public init(id productID: Product.ID, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: () -> Icon, @ViewBuilder placeholderIcon: () -> PlaceholderIcon)

    /// Creates a view to load an individual product from the App Store, and merchandise it using a custom
    /// icon.
    ///
    /// The product view will show a placeholder icon until the product finishes loading. After the product
    /// finishes loading, the view you provide will be used as the icon by default. If you set
    /// `prefersPromotionalIcon` to `true` and the product has a promotional image
    /// available, the promotional image will be used as the icon instead of the view you provide.
    ///
    /// To gain more control over the loading process of the icon used to decorate this view, use the
    /// ``init(id:icon:placeholderIcon:)`` initializer, which takes an icon closure that receives a
    /// ``ProductIconPhase`` to indicate the state of the loading operation of the
    /// promotional icon.
    /// - Parameters:
    ///   - productID: The product identifier to load from the App Store.
    ///   - prefersPromotionalIcon: Whether to use the promotional image from the App Store if
    ///                             it is available. If a promotional image for the product is
    ///                             available, it will be displayed instead of the view you
    ///                             provide for `icon`.
    ///   - icon: The icon to use when the product sucessfully finishes loading from the App Store.
    nonisolated public init(id productID: Product.ID, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: () -> Icon) where PlaceholderIcon == AutomaticProductPlaceholderIcon

    /// Creates a view to load an individual product from the App Store, and merchandise it.
    ///
    /// By default, the view doesn't show any icon. If you set `prefersPromotionalIcon` to
    /// `true`, the view will show a placeholder icon while loading, and replace the placeholder icon with
    /// the promotional image for the product.
    ///
    /// To gain more control over the loading process of the icon used to decorate this view, use the
    /// ``init(id:icon:placeholderIcon:)`` initializer, which takes an icon closure that receives a
    /// ``ProductIconPhase`` to indicate the state of the loading operation of the
    /// promotional icon.
    /// - Parameters:
    ///   - productID: The product identifier to load from the App Store.
    ///   - prefersPromotionalIcon: Whether to use the promotional image from the
    ///                             App Store if it is available. If this is `false`, any
    ///                             promotional image will be ignored.
    nonisolated public init(id productID: Product.ID, prefersPromotionalIcon: Bool = false) where Icon == EmptyView, PlaceholderIcon == EmptyView

    /// Creates a view to display an already loaded product from the App Store, and merchandise
    /// it with a promotional icon.
    ///
    /// The product view will asynchronously load and display the product's promotional image.
    /// Use the `ProductIconPhase` to monitor the current loading state of the product's
    /// promotional image.
    ///
    /// If the promotional image is unavailable, the phase is ``ProductIconPhase.unavailable``.
    /// If the promotional image is available, but the loading operation has not yet finished, the
    /// phase is ``ProductIconPhase.loading``. After the promotional image's loading operation
    /// completes, the phase becomes either ``ProductIconPhase.failure(_:)`` or
    /// ``ProductIconPhase.success(_:)``. In the first case, the phase’s ``ProductIconPhase.error``
    /// value indicates the reason for failure. In the second case, the phase’s
    /// ``ProductIconPhase.promotionalIcon`` property contains the loaded image.
    ///
    /// Use the phase to drive the output of the icon closure, which defines the view’s icon
    /// appearance:
    /// ```
    /// ProductView(product) { phase in
    ///     switch phase {
    ///     case .loading: MyPlaceholder()
    ///     case .failure(let error): MyErrorView(error)
    ///     case .unavailable: MyFallbackIcon()
    ///     case .success(let promotedIcon): promotedIcon
    ///     }
    /// }
    /// ```
    /// - Parameters:
    ///   - product: The product to merchandise.
    ///   - icon: A closure that receives a ``ProductIconPhase`` as an input
    ///           to indicate the state of the loading operation of the product's promoted
    ///           icon. Returns the view to display for the specified phase.
    nonisolated public init(_ product: Product, @ViewBuilder icon: @escaping (ProductIconPhase) -> Icon) where PlaceholderIcon == EmptyView

    /// Creates a view to merchandise an individual product using a custom icon.
    ///
    /// If you set `prefersPromotionalIcon` to `true` and the product has a promotional
    /// image available, the promotional image will be used as the icon instead of the view you provide.
    ///
    /// To gain more control over the loading process of the icon used to decorate this view, use the
    /// ``init(_:icon:)`` initializer, which takes an icon closure that receives a
    /// ``ProductIconPhase`` to indicate the state of the loading operation of the
    /// promotional icon.
    ///
    /// The following example shows how to create a product view using a custom icon:
    /// ```
    /// ProductView(product) {
    ///     Image(systemName: "star.fill")
    ///         .foregroundStyle(.yellow)
    /// }
    /// ```
    /// - Parameters:
    ///   - product: The product to merchandise.
    ///   - prefersPromotionalIcon: Whether to use the promotional image from the
    ///                             App Store if it is available. If a promotional image
    ///                             for the product is available, it will be displayed
    ///                             instead of the view you provide for `icon`.
    ///   - icon: The icon to use for decorating the product view.
    nonisolated public init(_ product: Product, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: () -> Icon) where PlaceholderIcon == EmptyView

    /// Creates a view to merchandise an individual product.
    ///
    /// If the product has a promotional image available, the promotional image will be used as the icon.
    /// Otherwise, the view doesn't show any icon. If you set `prefersPromotionalIcon` to
    /// `false`, the view will never show an icon even if there is a promotional image available for the
    /// product.
    ///
    /// To gain more control over the loading process of the icon used to decorate this view, use the
    /// ``init(_:icon:)`` initializer, which takes an icon closure that receives a
    /// ``ProductIconPhase`` to indicate the state of the loading operation of the
    /// promotional icon.
    /// - Parameters:
    ///   - product: The product to merchandise.
    ///   - prefersPromotionalIcon: Whether to use the promotional image from the
    ///                             App Store if it is available.
    nonisolated public init(_ product: Product, prefersPromotionalIcon: Bool = true) where Icon == EmptyView, PlaceholderIcon == EmptyView

    /// Creates a view to merchandise an invididual product based on a configuration for product view style.
    ///
    /// Use this initializer within the ``ProductViewStyle/makeBody(configuration:)``
    /// method of a ``ProductViewStyle`` to create an instance of the product view you want to style.
    /// This is useful for custom product view styles that only modify the current style, instead of
    /// implementing a brand new style
    ///
    /// The following example shows how to create and use custom styles by composing standard styles:
    /// ```
    /// struct SpinnerWhenLoadingStyle: ProductViewStyle {
    ///     public func makeBody(configuration: Configuration) -> some View {
    ///         switch configuration.state {
    ///         case .loading:
    ///             ProgressView()
    ///                 .progressView(.circular)
    ///         default:
    ///             ProductView(configuration)
    ///         }
    ///     }
    /// }
    ///
    /// ...
    ///
    /// ProductView(id: "com.example.product")
    ///     .productViewStyle(SpinnerWhenLoadingStyle())
    /// ```
    /// - Parameter configuration: A configuration for product view style.
    nonisolated public init(_ configuration: ProductViewStyleConfiguration) where Icon == ProductViewStyleConfiguration.Icon, PlaceholderIcon == ProductViewStyleConfiguration.Icon

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A type that specifies the appearance and interaction of product views within the view hierarchy.
///
/// To configure the product view style for a view hierarchy, use the
/// ``SwiftUI/View/productViewStyle(_:)-4c803`` modifier.
///
/// To create a custom style, declare a type that conforms to ``ProductViewStyle``. Implement
/// the ``makeBody(configuration:)`` method to return a view that composes the elements of the
/// configuration the system provides to your method.
/// ```
/// struct CustomProductViewStyle: ProductViewStyle {
///     func makeBody(configuration: Configuration) -> some View {
///         switch configuration.state {
///         ...
///         case .success(let product):
///             VStack(alignment: .center) {
///                 configuration.icon
///                 Text(product.displayName)
///                 Button(product.displayPrice) { ... }
///             }
///         }
///     }
/// }
///
/// ...
///
/// ProductView(id: "com.example.product")
///     .productViewStyle(CustomProductViewStyle())
/// ```
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public protocol ProductViewStyle {

    /// The properties of product view.
    typealias Configuration = ProductViewStyleConfiguration

    /// A view that represents the body of a product view.
    associatedtype Body : View

    /// Creates a view that represents the body of a product view.
    /// - Parameter configuration: The properties of a product view.
    @ViewBuilder @MainActor @preconcurrency func makeBody(configuration: Self.Configuration) -> Self.Body
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductViewStyle where Self == AutomaticProductViewStyle {

    /// The automatic product view style, based on the view's context.
    @MainActor @preconcurrency public static var automatic: AutomaticProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductViewStyle where Self == RegularProductViewStyle {

    /// A product view style using a standard, platform appropriate layout.
    ///
    /// On tvOS, the style will grow to fit the available width.
    @MainActor @preconcurrency public static var regular: RegularProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, visionOS 1.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ProductViewStyle where Self == LargeProductViewStyle {

    /// A product view style suitable for layouts where in-app purchase content is prominent.
    @MainActor @preconcurrency public static var large: LargeProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension ProductViewStyle where Self == CompactProductViewStyle {

    /// A product view style suitable for layouts where less space is available, or for displaying more items in
    /// a small amount of space.
    ///
    /// On iOS and macOS, the style will grow to fit the available width.
    @MainActor @preconcurrency public static var compact: CompactProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
/// The properties of a product view.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public struct ProductViewStyleConfiguration {

    /// A type erased icon of a product view.
    @MainActor @preconcurrency public struct Icon : View {

        /// The content and behavior of the view.
        ///
        /// When you implement a custom view, you must implement a computed
        /// `body` property to provide the content for your view. Return a view
        /// that's composed of built-in views that SwiftUI provides, plus other
        /// composite views that you've already defined:
        ///
        ///     struct MyView: View {
        ///         var body: some View {
        ///             Text("Hello, World!")
        ///         }
        ///     }
        ///
        /// For more information about composing views and a view hierarchy,
        /// see <doc:Declaring-a-Custom-View>.
        @MainActor @preconcurrency public var body: some View { get }

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required ``View/body-swift.property`` property.
        @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
        public typealias Body = some View
    }

    /// The state of loading the product from the App Store.
    public let state: Product.TaskState

    /// A decorative view for merchandising the product.
    public let icon: ProductViewStyleConfiguration.Icon

    /// Whether an in-app purchase transaction exists for the product's current entitlement.
    ///
    /// - Important: Don't use this property to determine whether to allow access to service for the
    ///              product. Always check the full in-app purchase transaction information. This
    ///              property is useful for quickly determining whether a purchase for a product that
    ///              cannot be purchased more than once will succeed.
    public let hasCurrentEntitlement: Bool

    /// The visibility of the product's description.
    ///
    /// This property is available if you choose to support configuring the description visibility in your
    /// custom control style. It reflects the value set with the ``SwiftUI/View/productDescription(_:)``
    /// view modifier on an ancestor view.
    ///
    /// For standard styles which typically display the `description` property of the `Product`, this
    /// label is not displayed when the visibility is `hidden`.
    @available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
    public let descriptionVisibility: Visibility

    /// The product to merchandise.
    ///
    /// The value is `nil` unless the value of the ``state`` property is ``StoreKit/Product/TaskState/success(_:)``.
    public var product: Product? { get }

    /// Initiates a purchase action for the product.
    ///
    /// Use this method instead of calling `purchase(options:)` directly on the product.
    public func purchase()
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductViewStyleConfiguration.Icon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A subscription store control style that displays subscription plans as a prominent picker control,
/// with a single button to subscribe.
///
/// You can also use ``SubscriptionStoreControlStyle/prominentPicker`` to construct this style.
@available(iOS 17.0, macOS 14.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
@MainActor @preconcurrency public struct ProminentPickerSubscriptionStoreControlStyle : SubscriptionStoreControlStyle {

    /// The placement of the subscription controls in the subscription store.
    @available(iOS 18.0, macOS 15.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public typealias Placement = PickerSubscriptionStoreControlStyle.Placement

    /// Creates a prominent picker subscription store control style.
    @MainActor @preconcurrency public init()

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @MainActor @preconcurrency public func makeBody(configuration: ProminentPickerSubscriptionStoreControlStyle.Configuration) -> some View


    /// A view that represents the body of a subscription store control.
    @available(macOS 14.0, iOS 17.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension ProminentPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// An action that starts an in-app purchase.
///
/// Read this environment value to get an ``PurchaseAction``
/// instance for a given ``Environment``. Call the
/// instance to start an in-app purchase. You call the instance directly because it
/// defines a ``PurchaseAction/callAsFunction(_:options:)`` method that Swift
/// calls when you call the instance.
///
/// For example, you can start an in-app purchase when the user taps a button:
///
///     struct PurchaseExample: View {
///         @Environment(\.purchase) private var purchase
///         let product: Product
///         let purchaseOptions: [Product.PurchaseOption]
///
///         var body: some View {
///             Button {
///                 Task {
///                     let purchaseResult = try? await purchase(product, options: purchaseOptions)
///                     // Process purchase result.
///                 }
///             } label: {
///                 Text(product.displayName)
///             }
///         }
///     }
@available(iOS 17.0, tvOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct PurchaseAction {

    /// Starts an in-app purchase for the given product, with the given purchase options.
    ///
    /// Don't call this method directly. SwiftUI calls it when you
    /// call the ``PurchaseAction`` structure that you get from the
    /// ``Environment``, using the product and purchase options as arguments:
    ///
    ///     struct PurchaseExample: View {
    ///         @Environment(\.purchase) private var purchase
    ///         let product: Product
    ///         let purchaseOptions: [Product.PurchaseOption]
    ///
    ///         var body: some View {
    ///             Button {
    ///                 Task {
    ///                     let purchaseResult = try? await purchase(product, options: purchaseOptions)
    ///                     // Process purchase result.
    ///                 }
    ///             } label: {
    ///                 Text(product.displayName)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - product: The product to purchase.
    ///   - options: A set of options to configure the purchase.
    /// - Returns: The result of the purchase
    /// - Throws: A `PurchaseError` or `StoreKitError`.
    @MainActor @preconcurrency public func callAsFunction(_ product: Product, options: Set<Product.PurchaseOption> = []) async throws -> Product.PurchaseResult
}

// Available when SwiftUI is imported with StoreKit
extension PurchaseAction {

    @available(iOS 18.4, tvOS 18.4, macOS 15.4, watchOS 11.4, visionOS 2.4, *)
    @MainActor @preconcurrency public func callAsFunction(_ advancedCommerceProduct: AdvancedCommerceProduct, compactJWS: String, options: Set<AdvancedCommerceProduct.PurchaseOption> = []) async throws -> AdvancedCommerceProduct.PurchaseResult
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, tvOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
extension PurchaseAction : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A product view style using a standard, platform appropriate layout.
///
/// On tvOS, the style will grow to fit the available width.
///
/// You can also use ``ProductViewStyle/regular`` to construct this style
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct RegularProductViewStyle : ProductViewStyle {

    /// Creates a regular product view style.
    nonisolated public init()

    /// Creates a view that represents the body of a product view.
    /// - Parameter configuration: The properties of a product view.
    @MainActor @preconcurrency public func makeBody(configuration: RegularProductViewStyle.Configuration) -> some View


    /// A view that represents the body of a product view.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension RegularProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 16.0, visionOS 1.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct RequestReviewAction {

    @MainActor public func callAsFunction()
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 16.0, visionOS 1.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension RequestReviewAction : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A kind of button managed by a store view or subscription store view.
///
/// Use the `storeButton(_:for:)` modifier on a view to set the visibility of specific button kinds.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public struct StoreButtonKind {

    /// Refers to buttons which restore potential missing in-app purchase content.
    ///
    /// Restore purchases buttons are never visible when the visibility is `automatic`.
    /// These buttons call the `AppStore.sync()` method. Both the ``StoreView`` and
    /// ``SubscriptionStoreView`` are capable of displaying this kind of button.
    public static var restorePurchases: StoreButtonKind { get }

    /// Refers to buttons which cancel the current presentation.
    ///
    /// When the visibility is `automatic`, cancellation buttons are visible only when the
    /// `isPresented` environment value is `true`. These buttons call the `dismiss`
    /// action environment value.  Both the ``StoreView`` and ``SubscriptionStoreView``
    /// are capable of displaying this kind of button.
    @available(tvOS, unavailable)
    public static var cancellation: StoreButtonKind { get }

    /// Refers to buttons which present a form to redeem an offer code for a subscription.
    ///
    /// Buttons with this purpose are always hidden when the visibility is `automatic`.
    /// ``SubscriptionStoreView`` can display buttons with this purpose.
    @available(macOS 15.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var redeemCode: StoreButtonKind { get }

    /// Refers to buttons which run a sign in action.
    ///
    /// When the visibility is `automatic`, buttons with this purpose are visible only when you set a
    /// sign in action using the `subscriptionStoreSignInAction(_:)` modifier.
    /// ``SubscriptionStoreView`` can display buttons with this purpose.
    public static var signIn: StoreButtonKind { get }

    /// Refers to buttons which present a subscription's terms of service or privacy policy.
    ///
    /// Buttons with this purpose are always hidden when the visibility is `automatic`.
    /// ``SubscriptionStoreView`` can display buttons with this purpose.
    public static var policies: StoreButtonKind { get }
}

// Available when SwiftUI is imported with StoreKit
/// A type that represents the content of a store.
///
/// You don't usually need to create custom types that conform to this protocol. For simple structures,
/// it's sufficient to compose values of standard types like ``SubscriptionOptionGroup`` directly within
/// the initializer of a ``SubscriptionStoreView``.
///
/// If you require a more complex structure, you may find it useful to create reusable types which represent
/// the content of a store. Similar to a SwiftUI view, conform your type to this
/// `StoreContent` protocol, and implement the `body` property. Instead of a type
/// conforming to `View`, the type of your `body` property should conform to
/// `StoreContent`. Most of the time you can just spell the type of `body` as
/// `some StoreContent`.
///
/// You compose your first custom store content using standard content types from StoreKit, like
/// ``SubscriptionOptionGroup``. Then, you can use your custom store content to initialize a
/// ``SubscriptionStoreView``, or even as a component of another custom content type.
///
/// When creating custom ``StoreContent``, you can use SwiftUI dynamic properties
/// like `@Environment` and `@State`.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public protocol StoreContent {

    /// The type of content representing the body of this subscription store view content.
    associatedtype Body : StoreContent

    /// The composition of content that comprise the subscription store view content.
    @StoreContentBuilder @MainActor @preconcurrency var body: Self.Body { get }
}

// Available when SwiftUI is imported with StoreKit
extension StoreContent {

    /// Specifies the visibility of auxiliary buttons that store view and subscription store view instances may use.
    ///
    /// - Parameters:
    ///   - visibility: The preferred visibility of the buttons.
    ///   - buttonKinds: The type of store button.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func storeButton(_ visibility: Visibility, for buttonKinds: StoreButtonKind...) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StoreContent {

    /// Set the control style and placement for groups of subscription options within the content.
    ///
    /// - Parameters:
    ///    - style: The ``SubscriptionStoreControlStyle`` to use when drawing the
    ///             controls of a group of subscription options.
    ///    - placement: The desired region of the subscription store view to place the controls.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStoreControlStyle<S>(_ style: S, placement: S.Placement = .automatic) -> some StoreContent where S : SubscriptionStoreControlStyle

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension StoreContent {

    /// Set a shape style to use for the background of subscription controls within the content.
    @available(iOS 18.0, macOS 15.0, *)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    nonisolated public func subscriptionStoreControlBackground(_ backgroundStyle: some ShapeStyle) -> some StoreContent


    /// Set a standard effect to use for the background of subscription controls within the content.
    @available(iOS 18.0, macOS 15.0, *)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    nonisolated public func subscriptionStoreControlBackground(_ backgroundStyle: SubscriptionStoreControlBackground) -> some StoreContent


    /// Sets the background style for picker items of the subscription store view instances within a view.
    ///
    /// You can also control the shape of the picker item background using
    /// ``subscriptionStorePickerItemBackground(_:in:)``.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStorePickerItemBackground(_ backgroundStyle: some ShapeStyle) -> some StoreContent


    /// Sets the background shape and style for subscription store view picker items within a view.
    ///
    /// Use this view modifier to customize the shape of the picker options in a subscription store view,
    /// as well as the background style.
    ///
    /// - Parameters:
    ///   - backgroundStyle: A ``ShapeStyle`` that determines the background style for the
    ///                      subscription store view picker items.
    ///   - shape: An instance of a type that conforms to ``Shape`` and determines the shape of
    ///            the subscription store view picker items. Omit the shape parameter to use the
    ///            default shape.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStorePickerItemBackground(_ backgroundStyle: some ShapeStyle, in shape: some Shape) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
extension StoreContent {

    /// Sets the style subscription option groups within this content use to display child groups.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @MainActor @preconcurrency public func subscriptionStoreOptionGroupStyle(_ style: some SubscriptionOptionGroupStyle) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StoreContent {

    /// Configure the visibility of labels displaying subscription's description within the content.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @MainActor @preconcurrency public func productDescription(_ visibility: Visibility) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension StoreContent {

    /// Configures subscription store view instances within a view to use the provided button label.
    ///
    /// The button label is not always respected in every context. For example, if you have a subscription
    /// store that shows multiple subscribe buttons, setting
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstorebuttonlabel/action-swift.type.property>
    /// as the button label will fall back to each subscription's display name.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStoreButtonLabel(_ label: SubscriptionStoreButtonLabel) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
/// A result builder that creates store content from closures you provide.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@resultBuilder public struct StoreContentBuilder {

    public static func buildBlock<each Content>(_ content: repeat each Content) -> TupleStoreContent<repeat each Content> where repeat each Content : StoreContent

    public static func buildExpression<Content>(_ content: Content) -> some StoreContent where Content : StoreContent


    public static func buildIf<Content>(_ section: Content?) -> Content? where Content : StoreContent

    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : StoreContent, FalseContent : StoreContent

    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : StoreContent, FalseContent : StoreContent

    public static func buildLimitedAvailability(_ content: any StoreContent) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
/// A view that merchandises a collection of in-app purchase products.
///
/// You create a store view by providing a collection of product identifiers to load from the App Store, or a
/// collection of ``StoreKit/Product`` values you've already loaded. If you provide product identifiers,
/// the store will automatically load the product information from the App Store, and update the view when the 
/// products are available.
///
/// You can also provide a view to use as an icon for each individual product. If you provide product
/// identifiers, you can optionally provide a different placeholder for your icon than the automatic placeholder
/// icon. If you set up promoted images for your products in App Store Connect, you can choose to use those
/// images as the icons for your products.
///
/// ### Layout
///
/// The store arranges products as rows. If there is enough horizontal space available, the store
/// will add columns. On tvOS, products are arranged in columns and rows are added as space permits.
///
/// The store grows to fit its container, and scrolls when there is not enough space in the container
/// to display all products. Use the ``fixedSize(horizontal:vertical:)`` modifier to change this
/// behavior.
///
/// To achieve a custom layout, you can compose ``ProductView``s with other container views instead of
/// using the store view.
///
/// ### Configuring the store
///
/// The store view can display a button to sync in-app purchase entitlements with the App Store. If you want
/// to display this button, modify the store view or an ancestor using the ``storeButton(_:for:)-2k9lq``
/// modifier, passing `.visible` and ``StoreButtonKind/restorePurchases`` as parameters.
///
/// You can customize the appearance of the products using a product view style, like
/// ``ProductViewStyle/compact``, and apply the style with the
/// ``productViewStyle(_:)-58obm`` modifier.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct StoreView<Icon, PlaceholderIcon> : View where Icon : View, PlaceholderIcon : View {

    /// Creates a view to load a collection of products from the App Store, and merchandise them using
    /// promotional icons and a custom placeholder icon.
    ///
    /// The store view will show the custom placeholder icon until all products finish loading.
    /// After the products have finished loading, the view will asynchronously load and display
    /// each product's promotional image. Use the `ProductIconPhase` to monitor the current loading
    /// state of the product's promotional image.
    ///
    /// If a product is unavailable, the view provided by the `placeholderIcon` closure is used
    /// as a fallback.
    ///
    /// If the promotional image for a product is unavailable, the phase is
    /// ``ProductIconPhase.unavailable``. If the promotional image is available, but the loading
    /// operation has not yet finished, the phase is ``ProductIconPhase.loading``. After the
    /// promotional image's loading operation completes, the phase becomes either
    /// ``ProductIconPhase.failure(_:)`` or ``ProductIconPhase.success(_:)``. In the first case,
    /// the phase’s ``ProductIconPhase.error`` value indicates the reason for failure. In the
    /// second case, the phase’s ``ProductIconPhase.promotionalIcon`` property contains the loaded
    /// image.
    ///
    /// Use the phase to drive the output of the icon closure, which defines the icon appearance for a
    /// given product after the initial loading of the product's metadata. Consider returning the view
    /// provided in the `placeholderIcon` closure for the ``ProductIconPhase.loading`` value:
    /// ```
    /// StoreView(ids: [
    ///     "com.example.product1",
    ///     "com.example.product2",
    ///     ...
    /// ]) { product, phase in
    ///     switch phase {
    ///     case .loading: MyPlaceholder()
    ///     case .failure(let error): MyErrorView(error)
    ///     case .unavailable: MyFallbackIcon()
    ///     case .success(let promotedIcon): promotedIcon
    ///     }
    /// } placeholderIcon: {
    ///     // When product is loading/unavailable
    ///     MyPlaceholder()
    /// }
    /// ```
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    ///   - icon: A closure that receives a ``StoreKit/Product`` and a
    ///           ``ProductIconPhase`` as input. The phase
    ///           indicates the state of the loading operation of the product's promotional
    ///           image. Returns the view to display for the specified phase.
    ///   - placeholderIcon: The icon to use until the products are finished loading.
    nonisolated public init(ids productIDs: some Collection<String>, @ViewBuilder icon: @escaping (Product, ProductIconPhase) -> Icon, @ViewBuilder placeholderIcon: () -> PlaceholderIcon)

    /// Creates a view to load a collection of products from the App Store, and merchandise them using an
    /// icon and custom placeholder icon.
    ///
    /// The store view will show the custom placeholder icon until all products finish loading. After loading
    /// is finished, the view you provide will be used as the icon by default. If you set
    /// `prefersPromotionalIcon` to `true`, any products with a promotional image
    /// available will use that image for its icon, instead of the view you provide.
    ///
    /// The following example shows how to create a store view using an icon and custom placeholder icon:
    /// ```
    /// StoreView(ids: [
    ///     "com.example.product1",
    ///     "com.example.product2",
    ///     ...
    /// ]) { product in
    ///     Image(systemName: "star.fill")
    ///         .foregroundStyle(.yellow)
    /// } placeholderIcon: {
    ///     Image(systemName: "star.fill")
    ///         .foregroundStyle(.gray)
    /// }
    /// ```
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    ///   - prefersPromotionalIcon: Whether to use promotional images from the App Store if
    ///                             available. If a promotional image for a product is available, it
    ///                             will be displayed instead of the view you provide for `icon`.
    ///   - icon: An icon to use when the products finish loading from the App Store. Use the parameter
    ///           to determine which icon to display for a given product.
    ///   - placeholderIcon: The icon to use until the products are finished loading.
    nonisolated public init(ids productIDs: some Collection<String>, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: @escaping (Product) -> Icon, @ViewBuilder placeholderIcon: () -> PlaceholderIcon)

    /// Creates a view to load a collection of products from the App Store, and merchandise them using a
    /// custom icon.
    ///
    /// The store view will show a placeholder icon until all products finish loading. After loading is
    /// finished, the view you provide will be used as the icon by default. If you set
    /// `prefersPromotionalIcon` to `true`, any products with a promotional image
    /// available will use that image for its icon, instead of the view you provide.
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    ///   - prefersPromotionalIcon: Whether to use promotional images from the App Store if
    ///                             available. If a promotional image for a product is available, it
    ///                             will be displayed instead of the view you provide for `icon`.
    ///   - icon: An icon to use when the products finish loading from the App Store. Use the parameter
    ///           to determine which icon to display for a given product.
    nonisolated public init(ids productIDs: some Collection<String>, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: @escaping (Product) -> Icon) where PlaceholderIcon == AutomaticProductPlaceholderIcon

    /// Creates a view to merchandise a collection of products with promotional icons.
    ///
    /// The store view will asynchronously load and display each product's promotional
    /// image. Use the `ProductIconPhase` to monitor the current loading state of the
    /// product's promotional image.
    ///
    /// If the promotional image for a product is unavailable, the phase is
    /// ``ProductIconPhase.unavailable``. If the promotional image is available, but the loading
    /// operation has not yet finished, the phase is ``ProductIconPhase.loading``. After the
    /// promotional image's loading operation completes, the phase becomes either
    /// ``ProductIconPhase.failure(_:)`` or ``ProductIconPhase.success(_:)``. In the first case,
    /// the phase’s ``ProductIconPhase.error`` value indicates the reason for failure. In the
    /// second case, the phase’s ``ProductIconPhase.promotionalIcon`` property contains the loaded
    /// image.
    ///
    /// Use the phase to drive the output of the icon closure, which defines the icon appearance for a
    /// given product:
    /// ```
    /// StoreView(products: [
    ///     product1,
    ///     product2,
    ///     ...
    /// ]) { product, phase in
    ///     switch phase {
    ///     case .loading: MyPlaceholder()
    ///     case .failure(let error): MyErrorView(error)
    ///     case .unavailable: MyFallbackIcon()
    ///     case .success(let promotedIcon): promotedIcon
    ///     }
    /// }
    /// ```
    /// - Parameters:
    ///   - products: The products to merchandise.
    ///   - icon: A closure that receives a ``StoreKit/Product`` and a
    ///           ``ProductIconPhase`` as input. The phase
    ///           indicates the state of the loading operation of the product's promoted
    ///           icon. Returns the view to display for the specified phase.
    nonisolated public init(products: some Collection<Product>, @ViewBuilder icon: @escaping (Product, ProductIconPhase) -> Icon) where PlaceholderIcon == EmptyView

    /// Creates a view to merchandise a collection of products using a custom icon.
    ///
    /// If you set `prefersPromotionalIcon` to `true`, any products with a promotional
    /// image available will use that image for its icon, instead of the view you provide.
    ///
    /// The following example shows how to create a store view using a custom icon:
    /// ```
    /// StoreView(products: [
    ///     product1,
    ///     product2,
    ///     ...
    /// ]) { product in
    ///     Image(systemName: "star.fill")
    ///         .foregroundStyle(.yellow)
    /// }
    /// ```
    /// - Parameters:
    ///   - products: The products to merchandise.
    ///   - prefersPromotionalIcon: Whether to use promotional images from the App Store if
    ///                             available. If a promotional image for a product is available, it
    ///                             will be displayed instead of the view you provide for `icon`.
    ///   - icon: An icon to use to decorate each product. Use the parameter to determine which icon
    ///           to display for a given product.
    nonisolated public init(products: some Collection<Product>, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: @escaping (Product) -> Icon) where PlaceholderIcon == EmptyView

    /// Creates a view to load a collection of products from the App Store, and merchandise them.
    ///
    /// By default, the store doesn't show any icons. If you set `prefersPromotionalIcon`
    /// to `true`, the store will show placeholder icons while loading, and replace the placeholder icons
    /// with each product's promotional image.
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    ///   - prefersPromotionalIcon: Whether to use promotional images from the App Store if
    ///                             available. If this is `false`, any promotional image will be
    ///                             ignored.
    nonisolated public init(ids productIDs: some Collection<String>, prefersPromotionalIcon: Bool = false) where Icon == EmptyView, PlaceholderIcon == EmptyView

    /// Creates a view to merchandise a collection of products.
    ///
    /// By default, the store doesn't show any icons. If you set `prefersPromotionalIcon`
    /// to `true`, the store will use each product's promotional image as its icon.
    /// - Parameters:
    ///   - products: The products to merchandise.
    ///   - prefersPromotionalIcon: Whether to use the promotional image from the App Store if
    ///                             it is available.
    nonisolated public init(products: some Collection<Product>, prefersPromotionalIcon: Bool = false) where Icon == EmptyView, PlaceholderIcon == EmptyView

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension StoreView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor @preconcurrency public struct SubscriptionOfferView<Icon, PlaceholderIcon> : View where Icon : View, PlaceholderIcon : View {

    nonisolated public init(id subscriptionID: Product.ID, @ViewBuilder icon: @escaping (ProductIconPhase) -> Icon, @ViewBuilder placeholderIcon: () -> PlaceholderIcon)

    nonisolated public init(id subscriptionID: Product.ID, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: () -> Icon, @ViewBuilder placeholderIcon: () -> PlaceholderIcon)

    nonisolated public init(id subscriptionID: Product.ID, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: () -> Icon) where PlaceholderIcon == AutomaticProductPlaceholderIcon

    nonisolated public init(id subscriptionID: Product.ID, prefersPromotionalIcon: Bool = false) where Icon == EmptyView, PlaceholderIcon == EmptyView

    nonisolated public init(_ subscription: Product, @ViewBuilder icon: @escaping (ProductIconPhase) -> Icon) where PlaceholderIcon == EmptyView

    nonisolated public init(_ subscription: Product, prefersPromotionalIcon: Bool = false, @ViewBuilder icon: () -> Icon) where PlaceholderIcon == EmptyView

    nonisolated public init(_ subscription: Product, prefersPromotionalIcon: Bool = true) where Icon == EmptyView, PlaceholderIcon == EmptyView

    nonisolated public init(_ configuration: SubscriptionOfferViewStyleConfiguration) where Icon == SubscriptionOfferViewStyleConfiguration.Icon, PlaceholderIcon == SubscriptionOfferViewStyleConfiguration.Icon

    nonisolated public init(groupID: String, visibleRelationship: Product.SubscriptionRelationship, @ViewBuilder icon: () -> Icon, @ViewBuilder placeholderIcon: () -> PlaceholderIcon)

    nonisolated public init(groupID: String, visibleRelationship: Product.SubscriptionRelationship, @ViewBuilder icon: () -> Icon) where PlaceholderIcon == AutomaticProductPlaceholderIcon

    nonisolated public init(groupID: String, visibleRelationship: Product.SubscriptionRelationship) where Icon == EmptyView, PlaceholderIcon == EmptyView

    nonisolated public init(groupID: String, visibleRelationship: Product.SubscriptionRelationship, useAppIcon: Bool) where Icon == EmptyView, PlaceholderIcon == EmptyView

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SubscriptionOfferViewButtonKind {

    public static var detailLink: SubscriptionOfferViewButtonKind { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public protocol SubscriptionOfferViewStyle {

    typealias Configuration = SubscriptionOfferViewStyleConfiguration

    associatedtype Body : View

    @ViewBuilder @MainActor func makeBody(configuration: Self.Configuration) -> Self.Body
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferViewStyle where Self == AutomaticSubscriptionOfferViewStyle {

    nonisolated public static var automatic: AutomaticSubscriptionOfferViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferViewStyle where Self == CompactSubscriptionOfferViewStyle {

    nonisolated public static var compact: CompactSubscriptionOfferViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SubscriptionOfferViewStyleConfiguration {

    @MainActor @preconcurrency public struct Icon : View {

        /// The content and behavior of the view.
        ///
        /// When you implement a custom view, you must implement a computed
        /// `body` property to provide the content for your view. Return a view
        /// that's composed of built-in views that SwiftUI provides, plus other
        /// composite views that you've already defined:
        ///
        ///     struct MyView: View {
        ///         var body: some View {
        ///             Text("Hello, World!")
        ///         }
        ///     }
        ///
        /// For more information about composing views and a view hierarchy,
        /// see <doc:Declaring-a-Custom-View>.
        @MainActor @preconcurrency public var body: some View { get }

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required ``View/body-swift.property`` property.
        @available(iOS 26.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macCatalyst, unavailable)
        public typealias Body = some View
    }

    public let activeOffer: Product.SubscriptionOffer?

    public let icon: SubscriptionOfferViewStyleConfiguration.Icon

    public let state: Product.CollectionTaskState

    public var subscriptionGroupDisplayName: String { get }

    public let subscriptionStatus: [Product.SubscriptionInfo.Status]

    public var subscriptions: [Product]? { get }

    public var visibleSubscription: Product?

    public func subscribe()

    public func displayDetails()
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferViewStyleConfiguration.Icon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A group of subscription options within a store.
///
/// There are two ways to declare the content of a subscription option group:
/// - A predicate describing which subscription options the group contains
/// - A collection of child groups
///
/// When declaring groups containing subscription options, you may find it convenient to use
/// ``SubscriptionOptionGroupSet`` instead. By using a subscription option group set, you can
/// create several subscription option groups in a single declaration.
///
/// If you choose to declare a group containing other subscription option groups, you should generally provide
/// a group containing subscription options at some point in the hierarchy. Otherwise, there won't be any
/// meaningful content to present when the group is displayed.
///
/// When a group is composed of other groups, you can choose to set the style in which the group displays
/// its child groups using ``subscriptionStoreOptionGroupStyle(_:)``. In lieu of an explicit style,
/// subscription option groups will choose an appropriate style automatically.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct SubscriptionOptionGroup<Content, Label, MarketingContent> : StoreContent where Content : StoreContent, Label : View, MarketingContent : View {

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameters:
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - label: A view that describes the section.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool, @ViewBuilder label: () -> Label, @ViewBuilder marketingContent: () -> MarketingContent) where Content == Never

    /// Creates a group of other subscription option groups.
    ///
    /// - Parameters:
    ///   - content: The items representing the content of the subscription store view group.
    ///   - label: A view that describes the section.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(@StoreContentBuilder content: () -> Content, @ViewBuilder label: () -> Label, @ViewBuilder marketingContent: () -> MarketingContent)

    /// The composition of content that comprise the subscription store view content.
    @MainActor @preconcurrency public var body: Never { get }

    /// The type of content representing the body of this subscription store view content.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = Never
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where MarketingContent == AutomaticSubscriptionStoreMarketingContent {

    /// Creates a group of subscription options matching a predicate, merchandised with
    /// automatic marketing content.
    ///
    /// - Parameters:
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - label: A view that describes the section.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool, @ViewBuilder label: () -> Label) where Content == Never

    /// Creates a group of other subscription option groups, merchandised with
    /// automatic marketing content.
    ///
    /// - Parameters:
    ///   - content: The items representing the content of the subscription store view group.
    ///   - label: A view that describes the section.
    @MainActor @preconcurrency public init(@StoreContentBuilder content: () -> Content, @ViewBuilder label: () -> Label)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == AutomaticSubscriptionOptionGroupLabel {

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameters:
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool, @ViewBuilder marketingContent: () -> MarketingContent) where Content == Never

    /// Creates a group of other subscription option groups.
    ///
    /// - Parameters:
    ///   - content: The items representing the content of the subscription store view group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(@StoreContentBuilder content: () -> Content, @ViewBuilder marketingContent: () -> MarketingContent)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == AutomaticSubscriptionOptionGroupLabel, MarketingContent == AutomaticSubscriptionStoreMarketingContent {

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameter isIncluded: A closure that takes a StoreKit product as its argument and returns
    ///                         a Boolean value indicating whether the product should be included
    ///                         in the group.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool) where Content == Never

    /// Creates a group of other subscription option groups, merchandised with
    /// automatic marketing content.
    ///
    /// - Parameter content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(@StoreContentBuilder content: () -> Content)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == Text {

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, isIncluded: @escaping (Product) -> Bool, @ViewBuilder marketingContent: () -> MarketingContent) where Content == Never

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, isIncluded: @escaping (Product) -> Bool, @ViewBuilder marketingContent: () -> MarketingContent) where Content == Never

    /// Creates a group of other subscription option groups.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, @StoreContentBuilder content: () -> Content, @ViewBuilder marketingContent: () -> MarketingContent)

    /// Creates a group of other subscription option groups.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, @StoreContentBuilder content: () -> Content, @ViewBuilder marketingContent: () -> MarketingContent)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == Text, MarketingContent == AutomaticSubscriptionStoreMarketingContent {

    /// Creates a group of subscription options matching a predicate, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, isIncluded: @escaping (Product) -> Bool) where Content == Never

    /// Creates a group of subscription options matching a predicate, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, isIncluded: @escaping (Product) -> Bool) where Content == Never

    /// Creates a group of other subscription option groups, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, @StoreContentBuilder content: () -> Content)

    /// Creates a group of other subscription option groups, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, @StoreContentBuilder content: () -> Content)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A set of subscription option groups.
///
/// You can create a subscription option group set instead of creating multiple
/// ``SubscriptionOptionGroup`` instances directly. This may be convenient in cases where the
/// number of groups your store contains depends on the subscriptions contained within the store, or in cases
/// where creating individual groups is cumbersome.
///
/// If the group ID type you provide conforms to `Comparable`, the groups the set represents are ordered
/// according to their ID. Otherwise, the groups are ordered according to the order in which each distinct
/// value is first returned from your transform.
///
/// If your set creates groups identified by a subscription period, you may want to use
/// ``SubscriptionPeriodGroupSet`` instead. The subscription period group set automatically
/// groups options by their period, and provides an automatic label representing a localized description of the
/// respective subscription period.
///
/// The groups represented by a group set must only contain subscription options. To declare a group
/// composed of child groups, you must use ``SubscriptionOptionGroup`` directly.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct SubscriptionOptionGroupSet<GroupID, Label, MarketingContent> : StoreContent where GroupID : Hashable, Label : View, MarketingContent : View {

    /// Creates a set of subscription option groups using a custom transform to assign products to groups.
    ///
    /// - Parameters:
    ///   - idType: The type to use to identify subscription option groups.
    ///   - transform: A function which transforms subscription product values into their
    ///                corresponding group ID.
    ///   - label: A view that describes the group identified by the provided ID.
    ///   - marketingContent: A view to display as marketing content when the group identified by
    ///                       the provided ID is visible.
    @MainActor @preconcurrency public init(idType: GroupID.Type = GroupID.self, groupedBy transform: @escaping (Product) -> GroupID, @ViewBuilder label: @escaping (GroupID) -> Label, @ViewBuilder marketingContent: @escaping (GroupID) -> MarketingContent)

    /// Creates a set of subscription option groups using a custom transform to assign products to groups,
    /// and automatic marketing content.
    ///
    /// - Parameters:
    ///   - idType: The type to use to identify subscription option groups.
    ///   - transform: A function which transforms subscription product values into their
    ///                corresponding group ID.
    ///   - label: A view that describes the group identified by the provided ID.
    @MainActor @preconcurrency public init(idType: GroupID.Type = GroupID.self, groupedBy transform: @escaping (Product) -> GroupID, @ViewBuilder label: @escaping (GroupID) -> Label) where MarketingContent == AutomaticSubscriptionStoreMarketingContent

    /// The composition of content that comprise the subscription store view content.
    @MainActor @preconcurrency public var body: Never { get }

    /// The type of content representing the body of this subscription store view content.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = Never
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroupSet : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A type that specifies the appearance and interaction of a nested groups of subscription options.
///
/// Subscription option groups may be composed of subgroups of subscription options. The style specifies the
/// way these subgroups are displayed. If a group doesn't contain subgroups, the style doesn't have any effect.
///
/// You don't create types that conform to this protocol directly. Instead, use one of the standard
/// styles like ``link`` or ``tab``.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public protocol SubscriptionOptionGroupStyle {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroupStyle where Self == AutomaticSubscriptionOptionGroupStyle {

    /// The automatic subscrption option group style, based on the group's context.
    public static var automatic: AutomaticSubscriptionOptionGroupStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, *)
@available(watchOS, unavailable)
extension SubscriptionOptionGroupStyle where Self == TabsSubscriptionOptionGroupStyle {

    /// A subscription option group style which displays a tab view containing tabs for each subgroup.
    ///
    /// The subgroup's label is displayed within the tab views selection control. Make sure you provide a 
    /// label for each subgroup with a tab style group, or an error will be logged at runtime.
    public static var tabs: TabsSubscriptionOptionGroupStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroupStyle where Self == LinksSubscriptionOptionGroupStyle {

    /// A subscription option group style which displays the first subgroup's content along with links to 
    /// navigate to each other subgroup.
    ///
    /// Since the first subgroup's content is displayed initially, you don't need to provide a label. StoreKit 
    /// provides an automatic label for links to other subgroups, but you can provide a label with your
    /// subgroups to customize this.
    public static var links: LinksSubscriptionOptionGroupStyle { get }
}

// Available when SwiftUI is imported with StoreKit
/// You don't use this type directly. Instead, StoreKit uses this type internally to understand what appearance
/// and interactions a style value indicates.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SubscriptionOptionGroupStyleOutput {
}

// Available when SwiftUI is imported with StoreKit
/// Contains subscription options to add visual hierarchy within a subscription store view's controls.
///
/// Use one of the ``SubscriptionStoreView`` initializers which take a store content builder to declare
/// sections of a subscription store. When you declare adjacent subscription option sections, they form an
/// group with a default label and marketing content. To customize the label and marketing content of the
/// group, declare an explicit ``SubscriptionOptionGroup`` which contains the sections to include
/// in the group.
///
/// Not all subscription store control styles support sections.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct SubscriptionOptionSection<Header, Content, Footer> : StoreContent where Header : View, Content : StoreContent, Footer : View {

    /// The composition of content that comprise the subscription store view content.
    @MainActor @preconcurrency public var body: Never { get }

    /// The type of content representing the body of this subscription store view content.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = Never
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionSection where Content == Never {

    /// Creates a section of subscription options matching a predicate, with optional header and footer
    /// views.
    /// - Parameters:
    ///   - isIncluded: A predicate indicating which subscription options to include in the section.
    ///   - header: A decorative view to display before the options in the section. You can omit this
    ///             parameter to exclude a header.
    ///   - footer: A decorative view to display after the options in the section. You can omit this
    ///             parameter to exclude a footer.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool, @ViewBuilder header: () -> Header = EmptyView.init, @ViewBuilder footer: () -> Footer = EmptyView.init)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionSection where Header == Text, Content == Never {

    /// Creates a section of subscription options matching a predicate, with a localized title and an optional
    /// footer view.
    /// - Parameters:
    ///   - title: The key for a localized string to display before the section.
    ///   - isIncluded: A predicate indicating which subscription options to include in the section.
    ///   - footer: A decorative view to display after the options in the section. You can omit this
    ///             parameter to exclude a footer.
    @MainActor @preconcurrency public init(_ title: LocalizedStringKey, isIncluded: @escaping (Product) -> Bool, @ViewBuilder footer: () -> Footer = EmptyView.init)

    /// Creates a section of subscription options matching a predicate, with a title and an optional footer
    /// view.
    /// - Parameters:
    ///   - title: A string to display before the section.
    ///   - isIncluded: A predicate indicating which subscription options to include in the section.
    ///   - footer: A decorative view to display after the options in the section. You can omit this
    ///             parameter to exclude a footer.
    @MainActor @preconcurrency public init(_ title: some StringProtocol, isIncluded: @escaping (Product) -> Bool, @ViewBuilder footer: () -> Footer = EmptyView.init)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionSection : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A set of subscription option groups, where each group represents subscription options with a common
/// period.
///
/// Use this type as a convenience over creating a ``SubscriptionOptionGroupSet`` directly. The
/// subscription period group set handles identifying its groups automatically, and can optionally generate a
/// localized label for its groups.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct SubscriptionPeriodGroupSet<Label, MarketingContent> : StoreContent where Label : View, MarketingContent : View {

    /// Creates a set of subscription option groups, each group containing subscription options with a
    /// common period.
    ///
    /// - Parameters:
    ///   - marketingContent: The marketing content to display with the contents of each group.
    ///   - label: The label to use for each group, instead of the automatic label.
    @MainActor @preconcurrency public init(@ViewBuilder marketingContent: @escaping (Product.SubscriptionPeriod?) -> MarketingContent, @ViewBuilder label: @escaping (Product.SubscriptionPeriod?) -> Label)

    /// Creates a set of subscription option groups, each group containing subscription options with a
    /// common period.
    ///
    /// When you use this initializer, the automatic label represents a localized description of the
    /// subscription period of options within each group.
    /// - Parameter marketingContent: The marketing content to display with the contents of each
    ///                               group.
    @MainActor @preconcurrency public init(@ViewBuilder marketingContent: @escaping (Product.SubscriptionPeriod?) -> MarketingContent) where Label == AutomaticSubscriptionOptionGroupLabel

    /// Creates a set of subscription option groups, each group containing subscription options with a
    /// common period.
    ///
    /// When you use this initializer, the automatic label represents a localized description of the
    /// subscription period of options within each group.
    @MainActor @preconcurrency public init() where Label == AutomaticSubscriptionOptionGroupLabel, MarketingContent == AutomaticSubscriptionStoreMarketingContent

    /// The composition of content that comprise the subscription store view content.
    @MainActor @preconcurrency public var body: some StoreContent { get }

    /// The type of content representing the body of this subscription store view content.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = some StoreContent
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionPeriodGroupSet : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A button for subscribing to an in-app subscription.
///
/// This button is used by standard subscription store control styles. If you implement a custom
/// subscription store control style, you can use this button as part of your style by providing a
/// `SubscriptionStoreControlStyle.Configuration.Option`` value.
///
/// On iOS, macOS, watchOS, and visionOS you can configure the label of the button by modifying it with
/// `subscriptionStoreButtonLabel(_:)`. Some button label configurations cause the button
/// to have a caption, for example: `.displayName.singleLine`.
///
/// You can configure the button's style by modifying it with `buttonStyle(_:)`.
///
/// You don't use this directly except when implementing a
/// `SubscriptionStoreControlStyle`.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct SubscriptionStoreButton : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreButton {

    /// Creates a button that with an automatic label describing the subscription option, beginning a
    /// subscribe interaction when someone triggers the button.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.Option)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreButton : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// The label of a subscribe button used by a subscription store view.
///
/// You can configure ``SubscriptionStoreView`` instances within a view to use a certain button
/// label by modifying the view with ``subscriptionStoreButtonLabel(_:)``.
///
/// You can compose label preferences into one value, for example you could create a value that prefers to
/// display an action verb and the price of the subscription as two lines within the same label by spelling
/// `.multiline.action`.
@available(iOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@available(tvOS, unavailable)
public struct SubscriptionStoreButtonLabel : Hashable {

    /// A context appropriate label automatically determined by the system.
    public static var automatic: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to keep to a single line.
    public static var singleLine: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to display two lines.
    @available(watchOS, unavailable)
    public static var multiline: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to primarily display an action verb, like "Subscribe".
    public static var action: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to primarily display the plan's display name.
    public static var displayName: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to primarily display the plan's price.
    public static var price: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to keep to a single line.
    public var singleLine: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to display two lines.
    @available(watchOS, unavailable)
    public var multiline: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to primarily display an action verb, like "Subscribe".
    public var action: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to primarily display the plan's display name.
    public var displayName: SubscriptionStoreButtonLabel { get }

    /// A button label that prefers to primarily display the plan's price.
    public var price: SubscriptionStoreButtonLabel { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SubscriptionStoreButtonLabel, b: SubscriptionStoreButtonLabel) -> Bool

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

// Available when SwiftUI is imported with StoreKit
/// A view representation of a subscription store view's content.
///
/// You don't use this type directly. Instead, StoreKit creates instances of this type automatically to transform
/// your store content into a SwiftUI view.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct SubscriptionStoreContentView<Content> : View where Content : StoreContent {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreContentView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// The background layer below the subscribe controls, and above any background in an in-app subscription
/// store.
///
/// Use the ``subscriptionStoreControlBackground(_:)`` modifier to configure the
/// control background style for subscription stores within a view.
///
/// You can also use some `ShapeStyle` value instead of one of these styles.
@available(iOS 17.0, macOS 14.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
public struct SubscriptionStoreControlBackground {

    /// An automatic control background, based on the subscription store's context.
    public static var automatic: SubscriptionStoreControlBackground { get }

    /// A material background, where the material effect fades into the background.
    public static var gradientMaterial: SubscriptionStoreControlBackground { get }

    /// A gradient material background which only appears after someone scrolls the subscription store.
    @available(macOS, unavailable)
    public static var gradientMaterialOnScroll: SubscriptionStoreControlBackground { get }
}

// Available when SwiftUI is imported with StoreKit
/// A type that describes the placement of subscription controls in a subscription store view.
///
/// You can configure ``SubscriptionStoreView`` instances within a view to place their controls in a specific
/// location in the subscription store view by modifying the view with ``subscriptionStoreControlStyle(_:placement:)``.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public protocol SubscriptionStoreControlPlacement : RawRepresentable where Self.RawValue == SubscriptionStoreControlPlacementKey {

    /// The default placement of this type.
    static var automatic: Self { get }
}

// Available when SwiftUI is imported with StoreKit
/// The system-defined placements of subscription controls in a subscription store view.
///
/// The regions that comprise a ``SubscriptionStoreView``. Values of this type are used to define the placements available to
/// ``SubscriptionStoreControlPlacement`` instances.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SubscriptionStoreControlPlacementKey : Hashable, Sendable {

    /// A placement that locates the subscription controls within the main scroll view of a subscription store view.
    @available(tvOS, unavailable)
    public static var scrollView: SubscriptionStoreControlPlacementKey { get }

    /// A placement that locates the subscription controls within the bottom bar, overlapping the scroll
    /// content if necessary.
    ///
    /// The bottom bar will conditonally apply a special visual treatment when it is overlapping the scroll
    /// content of the subscription store view. Content contained within the bottom bar does not scroll with
    /// the rest of the scroll view's content.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var bottomBar: SubscriptionStoreControlPlacementKey { get }

    /// A hybrid placement that combines elements of the bottom bar and scroll view placements.
    ///
    /// This placement positions the subscriptions controls within the main scroll view of the subscription
    /// store view, and places the confirmation content and any auxiliary buttons in the bottom bar,
    /// overlapping the scroll content if necessary.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var buttonsInBottomBar: SubscriptionStoreControlPlacementKey { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SubscriptionStoreControlPlacementKey, b: SubscriptionStoreControlPlacementKey) -> Bool

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

// Available when SwiftUI is imported with StoreKit
/// A type that specifies the appearance and interaction of subscribe controls for subscription store views
/// within the view hierarchy.
///
/// To configure the subscription store control style for a view hierarchy, use the
/// ``SwiftUI/View/subscriptionStoreControlStyle(_:)-9re4m``
/// or ``SwiftUI/View/subscriptionStoreControlStyle(_:placement:)`` modifier.
///
/// To create a custom style, declare a type conforming to ``SubscriptionStoreControlStyle``.
/// Implement the ``makeBody(configuration:)`` method to return a view that composes the
/// elements of the configuration the system provides to your method.
///
/// You can create custom styles composed of a standard style's components:
/// + Use the standard button label and optional captions with ``SubscribeButton``
/// + Create a control similar to ``picker`` with ``SubscriptionPicker``
/// + Use the standard picker option label with ``SubscriptionPickerOption``
/// + Style your buttons as standard picker options using
///   ``SwiftUI/PrimitiveButtonStyle/subscriptionPickerOption`` and
///   ``SwiftUI/PrimitiveButtonStyle/subscriptionPickerOptionProminent``
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public protocol SubscriptionStoreControlStyle {

    /// A view that represents the body of a subscription store control.
    associatedtype Body : View

    /// The placement of the subscription controls in the subscription store.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    associatedtype Placement : SubscriptionStoreControlPlacement = AutomaticSubscriptionStoreControlPlacement

    /// The properties of a subscription store control.
    ///
    /// You don't create a configuration value directly. Instead, declare a type conforming to
    /// ``SubscriptionStoreControlStyle`` and use the configuration provided to the required
    /// ``makeBody(configuration:)`` method.
    typealias Configuration = SubscriptionStoreControlStyleConfiguration

    /// Creates a view that represents the body of a subscription store control.
    /// - Parameter configuration: The properties of a subscription store control.
    @ViewBuilder @MainActor @preconcurrency func makeBody(configuration: Self.Configuration) -> Self.Body
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionStoreControlStyle where Self == PagedProminentPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a paged prominent picker 
    /// control, with a single button to subscribe.
    ///
    /// The paged prominent picker prefers to use a page style tab view to display picker options in compact
    /// containers. For sufficiently wide containers, the paged prominent picker lays out picker options in a
    /// horizontal stack.
    ///
    /// You can also use ``SubscriptionStoreControlStyle/pagedProminentPicker`` to 
    /// construct this style.
    @MainActor @preconcurrency public static var pagedProminentPicker: PagedProminentPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle where Self == PagedPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a paged picker control, with a single
    /// button to subscribe.
    ///
    /// On iOS and macOS, the paged picker prefers to use a page style tab view to display picker options in
    /// compact containers. For sufficiently wide containers, the paged picker lays out picker options in a
    /// horizontal stack.
    ///
    /// On watchOS, the paged picker shows the current selection in a collapsed state. When you focus on the
    /// control, you can use the digital crown to change the selection.
    @MainActor @preconcurrency public static var pagedPicker: PagedPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension SubscriptionStoreControlStyle where Self == AutomaticSubscriptionStoreControlStyle {

    /// The default subscription store control style, choosing a standard style automatically based on the 
    /// view's context.
    @MainActor @preconcurrency public static var automatic: AutomaticSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle {

    /// A subscription option within a subscription picker control.
    ///
    /// Since subscription picker options are composed of buttons, you can style the options with button
    /// styles. Use a custom button style, or apply a standard style provided by StoreKit like
    /// `subscriptionPickerOptionProminent`.
    public typealias SubscriptionPickerOption = SubscriptionStorePickerOption
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyle {

    /// A button for subscribing to an in-app subscription.
    ///
    /// This button is used by standard subscription store control styles. If you implement a custom
    /// subscription store control style, you can use this button as part of your style by providing a
    /// `SubscriptionStoreControlStyle.Configuration.Option`` value.
    ///
    /// On iOS, macOS and watchOS you can configure the label of the button by modifying it with
    /// `subscriptionStoreButtonLabel(_:)`. Some button label configurations cause the button
    /// to have a caption, for example: `.displayName.singleLine`.
    ///
    /// You can configure the button's style by modifying it with `buttonStyle(_:)`.
    ///
    /// You only use this button directly when implementing a `SubscriptionStoreControlStyle`.
    public typealias SubscribeButton = SubscriptionStoreButton
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionStoreControlStyle where Self == CompactPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a compact picker control, with a single
    /// button to subscribe.
    ///
    /// This style prefers to layout picker options in a horizontal stack, but can scroll horizontally if the container
    /// width isn't sufficient. It's recommended to only use this style when you expect your store to display two
    /// or three subscription options.
    @MainActor @preconcurrency public static var compactPicker: CompactPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension SubscriptionStoreControlStyle where Self == ProminentPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a prominent picker control,
    /// with a single button to subscribe.
    ///
    /// You can use ``SubscriptionStoreControlStyle/picker`` for a similar control with a
    /// more plain appearance.
    @MainActor @preconcurrency public static var prominentPicker: ProminentPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle where Self == PickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a picker control, with a single
    /// button to subscribe.
    ///
    /// You can use ``SubscriptionStoreControlStyle/prominentPicker`` for a similar
    /// control with a more prominent appearance.
    @MainActor @preconcurrency public static var picker: PickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension SubscriptionStoreControlStyle where Self == ButtonsSubscriptionStoreControlStyle {

    /// A subscription store control style that displays a subscribe button for each subscription plan.
    @MainActor @preconcurrency public static var buttons: ButtonsSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle {

    /// A composite control for selecting an option from a subscription group and confirming the selected
    /// subscription.
    ///
    /// To use a subscription picker, first declare a type conforming to
    /// ``SubscriptionStoreControlStyle``. You use this view as a component of the view you
    /// provide from ``makeBody(configuration:)``.
    ///
    /// There are two primary ways to create a subscription picker within your custom control style:
    /// + Provide the ``Configuration`` value to the subscription picker, and use the components of
    ///   each option to declare the option's label.
    /// + Provide a collection of views for the picker's content, using a ``SubscriptionPickerOption``
    ///   to declare the control for each option.
    ///
    /// Either way, you must also declare a view to confirm the subscription, after someone finishes
    /// selecting an option. You can optionally provide a binding to a ``Configuration.Option`` to
    /// respond to selection changes or programmatically change the selection.
    ///
    /// - Important: The subscription picker must be a descendant of a subscription store view.
    public typealias SubscriptionPicker = SubscriptionStorePicker
}

// Available when SwiftUI is imported with StoreKit
/// The properties of a subscription store control.
///
/// You don't create a configuration value directly. Instead, declare a type conforming to
/// ``SubscriptionStoreControlStyle`` and use the configuration provided to the required
/// ``makeBody(configuration:)`` method.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public struct SubscriptionStoreControlStyleConfiguration {

    /// A type erased icon of a subscription option.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @MainActor @preconcurrency public struct Icon : View {

        /// The content and behavior of the view.
        ///
        /// When you implement a custom view, you must implement a computed
        /// `body` property to provide the content for your view. Return a view
        /// that's composed of built-in views that SwiftUI provides, plus other
        /// composite views that you've already defined:
        ///
        ///     struct MyView: View {
        ///         var body: some View {
        ///             Text("Hello, World!")
        ///         }
        ///     }
        ///
        /// For more information about composing views and a view hierarchy,
        /// see <doc:Declaring-a-Custom-View>.
        @MainActor @preconcurrency public var body: some View { get }

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required ``View/body-swift.property`` property.
        @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public typealias Body = some View
    }

    /// The properties of a section of subscription options within a subscription store control.
    ///
    /// Even if a subscription store instance doesn't specify explicit sections, there will always be at least
    /// one implicit section containing the options within the group. Implicit sections will always have nil
    /// for the header and footer views.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public struct Section : Identifiable {

        /// The stable identity of a section of subscription options.
        public struct ID : Hashable {

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: SubscriptionStoreControlStyleConfiguration.Section.ID, b: SubscriptionStoreControlStyleConfiguration.Section.ID) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        /// A type erased header of a section of subscription options.
        @MainActor @preconcurrency public struct Header : View {

            /// The content and behavior of the view.
            ///
            /// When you implement a custom view, you must implement a computed
            /// `body` property to provide the content for your view. Return a view
            /// that's composed of built-in views that SwiftUI provides, plus other
            /// composite views that you've already defined:
            ///
            ///     struct MyView: View {
            ///         var body: some View {
            ///             Text("Hello, World!")
            ///         }
            ///     }
            ///
            /// For more information about composing views and a view hierarchy,
            /// see <doc:Declaring-a-Custom-View>.
            @MainActor @preconcurrency public var body: some View { get }

            /// The type of view representing the body of this view.
            ///
            /// When you create a custom view, Swift infers this type from your
            /// implementation of the required ``View/body-swift.property`` property.
            @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
            public typealias Body = some View
        }

        /// A type erased footer of a section of subscription options.
        @MainActor @preconcurrency public struct Footer : View {

            /// The content and behavior of the view.
            ///
            /// When you implement a custom view, you must implement a computed
            /// `body` property to provide the content for your view. Return a view
            /// that's composed of built-in views that SwiftUI provides, plus other
            /// composite views that you've already defined:
            ///
            ///     struct MyView: View {
            ///         var body: some View {
            ///             Text("Hello, World!")
            ///         }
            ///     }
            ///
            /// For more information about composing views and a view hierarchy,
            /// see <doc:Declaring-a-Custom-View>.
            @MainActor @preconcurrency public var body: some View { get }

            /// The type of view representing the body of this view.
            ///
            /// When you create a custom view, Swift infers this type from your
            /// implementation of the required ``View/body-swift.property`` property.
            @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
            public typealias Body = some View
        }

        /// The stable identity of the entity associated with this instance.
        public var id: SubscriptionStoreControlStyleConfiguration.Section.ID

        /// A decorative header view for this section, to be displayed before the options.
        public var header: SubscriptionStoreControlStyleConfiguration.Section.Header?

        /// The subscription options to merchandise within this section.
        ///
        /// Your subscription store control style should provide a means to subscribe to each option in the 
        /// array. Use the properties of each option to declare your control style, and use the
        /// ``Option/subscribe()`` method in response to a subscribe interaction.
        ///
        /// Prefer to use ``SubscriptionOptionSection`` when creating a subscription store view
        /// to configure the visible subscription options within a section.
        public var options: [SubscriptionStoreControlStyleConfiguration.Option]

        /// A decorative footer view for this section, to be displayed after the options.
        public var footer: SubscriptionStoreControlStyleConfiguration.Section.Footer?
    }

    /// The properties of a control for subscribing to a subscription product.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @dynamicMemberLookup public struct Option {

        /// Properties of the subscription.
        ///
        /// You don't need to access this property directly in order to access properties of the
        /// subscription. Any of ``StoreKit/Product``'s members can be accessed directly on an
        /// ``SubscriptionStoreControlStyleConfiguration/Option`` value.
        ///
        /// - Important: Don't use ``StoreKit/Product/purchase(confirmIn:options:)``
        ///              on the product value in your control style. Instead, call ``subscribe()``
        ///              on the ``SubscriptionStoreControlStyleConfiguration/Option``
        ///              in response to an subscribe interaction.
        public var subscription: Product { get }

        /// The selected subscription offer to apply to the purchase of this subscription option.
        public var activeOffer: Product.SubscriptionOffer? { get }

        /// The subscription option's icon.
        ///
        /// You declare the control icon for subscription store views within a view hierarchy with
        /// ``SwiftUI/View/subscriptionStoreControlIcon(icon:)``.
        public var icon: SubscriptionStoreControlStyleConfiguration.Icon? { get }

        /// The action to perform in response to a subscribe interaction.
        ///
        /// - Important: Don't use ``StoreKit/Product/purchase(confirmIn:options:)``
        ///              on ``subscription`` in your control style. Call this method instead.
        public func subscribe()

        public subscript<T>(dynamicMember keyPath: KeyPath<Product, T>) -> T { get }

        public subscript<T>(dynamicMember keyPath: KeyPath<Product.SubscriptionInfo, T>) -> T? { get }

        public subscript<T>(dynamicMember keyPath: KeyPath<Product.SubscriptionInfo, T?>) -> T? { get }
    }

    /// The properties of a picker option for selecting a subscription product.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    @dynamicMemberLookup public struct PickerOption {

        /// Properties of the subscription.
        ///
        /// You don't need to access this property directly in order to access properties of the
        /// subscription. Any of ``StoreKit/Product``'s members can be accessed directly on an
        /// ``SubscriptionStoreControlStyleConfiguration/Option`` value.
        ///
        /// - Important: Don't use ``StoreKit/Product/purchase(confirmIn:options:)``
        ///              on the product value in your control style. Instead, call ``subscribe()``
        ///              on the ``SubscriptionStoreControlStyleConfiguration/Option``
        ///              in response to an subscribe interaction.
        public var subscription: Product { get }

        /// Whether this is the currently selected subscription option in the picker control.
        public let isSelected: Bool

        /// The subscription option's icon.
        ///
        /// You declare the control icon for subscription store views within a view hierarchy with
        /// ``SwiftUI/View/subscriptionStoreControlIcon(icon:)``.
        public var icon: SubscriptionStoreControlStyleConfiguration.Icon? { get }

        /// The selected subscription offer to apply to the purchase of this subscription option.
        public var activeOffer: Product.SubscriptionOffer? { get }

        public subscript<T>(dynamicMember keyPath: KeyPath<Product, T>) -> T { get }

        public subscript<T>(dynamicMember keyPath: KeyPath<Product.SubscriptionInfo, T>) -> T? { get }

        public subscript<T>(dynamicMember keyPath: KeyPath<Product.SubscriptionInfo, T?>) -> T? { get }
    }

    /// The visibility of the product descriptions.
    ///
    /// This property is available if you choose to support configuring the description visibility in your
    /// custom control style. It reflects the value set with the ``SwiftUI/View/productDescription(_:)``
    /// view modifier on an ancestor view.
    ///
    /// For standard styles which typically display the `description` property of the `Product`, this
    /// label is not displayed when the visibility is `hidden`.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public var descriptionVisibility: Visibility { get }

    /// The localized display name for the subscription group the subscription store view is merchandising.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public var groupDisplayName: String { get }

    /// The customer's current renewal preference for the subscription.
    ///
    /// If the property is `nil`, the customer isn't actively subscribed to this subscription. Use this
    /// property to disable or add other visual treatment to the current renewal preference. You can also
    /// use this property to apply visual treatment to options based on their relative level of service to the
    /// current renewal preference.
    ///
    /// Only display a means to subscribe to this subscription option if it is included in the ``options``
    /// array. For convenience, the product metadata for the renewal preference is always provided, even if
    /// the subscription store view is configured to exclude this option.
    ///
    /// Consider blocking any subscribe interactions for the customer's current renewal preference. If a
    /// customer tries to subscribe to this product, a system dialog will always be presented to explain
    /// the customer is already subscribed.
    ///
    /// - Important: Don't use this property to determine whether to grant access to the service this
    ///              subscription is for. Always check the full transaction information before granting
    ///              access to paid service. This property is useful for quickly understanding if a
    ///              purchase will succeed.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public var autoRenewPreference: Product? { get }

    /// The sections of subscription options to merchandise.
    ///
    /// Use this property if your control style supports applying visual treatment to sections and displaying
    /// optional accessory views. If you choose to not support sections, you can use the ``options``
    /// property instead. This property always contains the same contents as ``options``, but preserves
    /// the section structure and allows you to compose your control of decorative header or footer views.
    ///
    /// In many cases this property will only contain a single element. In these cases, the single section's
    /// ``Section/options`` property is equivalent with the ``options`` property on the
    /// configuration value.
    ///
    /// - SeeAlso: Read the documentation for ``options`` for more general guidance for how to
    ///            determine which options to make available in your control.
    /// - Important: In general, your control style does not need to use both this property and
    ///              ``options``. Only use this property if your control style supports sections,
    ///              otherwise use the ``options`` property to disregard section information.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public var sections: [SubscriptionStoreControlStyleConfiguration.Section] { get }

    /// The subscription options to merchandise.
    ///
    /// Your subscription store control style should provide a means to subscribe to each option in the array.
    /// Use the properties of each option to declare your control style, and use the
    /// ``Option/subscribe()`` method in response to a subscribe interaction.
    ///
    /// Prefer to use the initializer of the subscription store view to hide and sort subscription options.
    /// This array maintains the sort order and only includes the options provided to the subscription store
    /// view's initializer.
    ///
    /// There may be subscription options in the same subscription group which are not contained in this
    /// property. This indicates the excluded options should be hidden from the subscription controls. You
    /// can use the ``allOptions`` property to access these options to compare them to the options
    /// included in this control.
    ///
    /// Subscription store views can be configured to partition the options a control offers into sections.
    /// You may choose to use this section information to apply visual treatment to sections and compose
    /// your control style of decorative header and footer views. If you choose to do this, use the
    /// ``sections`` property instead of this property.
    ///
    /// If the customer is currently subscribed and the subscription store is configured to show the current
    /// subscription, this property will be contain ``autoRenewPreference`` as an element.
    /// - Important: In general, your control style does not need to use both this property and
    ///              ``sections``. Only use this property if your control style does not support
    ///              sections, otherwise use the ``sections`` property to access section information.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public var options: [SubscriptionStoreControlStyleConfiguration.Option] { get }

    /// All subscription options available to the store, including options which should not be merchandised
    /// with this control.
    ///
    /// In certain cases, a subscription store control may be configured to only display a subset of the
    /// available options within the subscription group. For example, when declaring the content of a
    /// subscription store using a store content builder, the store may create multiple instances of your
    /// control using different configuration values.
    ///
    /// You should use this property if your control style displays comparisons to other available subscription
    /// options. For example, if you use a ``SubscriptionPeriodGroupSet``, you may want to
    /// compare the value of a yearly renewing subsription to a monthly subscription. Since each instance
    /// of your control style only displays subscriptions with a common renewal period, you won't be able
    /// to compute this comparison using only the `options` property.
    ///
    /// This value is always a superset of the `options` property. In many cases both properties will
    /// contain the same elements.
    ///
    /// - Important: In general, do **not** use this property to determine which subscription options
    ///              to make available with your control. Instead, only display subscription options
    ///              contained in either the `options` or `sections` property.
    public var allOptions: [Product] { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Icon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Option : Identifiable {

    /// The product ID of the subscription option.
    public var id: Product.ID { get }

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias ID = Product.ID
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Option : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: SubscriptionStoreControlStyleConfiguration.Option, rhs: SubscriptionStoreControlStyleConfiguration.Option) -> Bool
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Option : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyleConfiguration.PickerOption : Identifiable {

    /// The product ID of the subscription option.
    public var id: Product.ID { get }

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable, introduced: 17.0)
    public typealias ID = Product.ID
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyleConfiguration.PickerOption : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SubscriptionStoreControlStyleConfiguration.PickerOption, b: SubscriptionStoreControlStyleConfiguration.PickerOption) -> Bool
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyleConfiguration.PickerOption : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Section.Header : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Section.Footer : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct SubscriptionStorePicker<PickerContent, ConfirmationContent> : View where PickerContent : View, ConfirmationContent : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePicker {

    /// Creates a subscription picker.
    ///
    /// Use ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` within
    /// `pickerContent` for each subscription option provided to your control style's
    /// ``SubscriptionStoreControlStyle/makeBody(configuration:)`` method. 
    /// You can use `Section` to group options and provide header and footer content between options.
    @MainActor @preconcurrency public init(@ViewBuilder pickerContent: () -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)

    /// Creates a subscription picker that creates a view for each option in the provided configuration.
    ///
    /// In `pickerOptionContent`, declare the label for each subscription option. To create a label
    /// composed of the standard picker option label, declare a
    /// ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` providing only the
    /// ``SubscriptionStoreControlStyle/Configuration/PickerOption`` value.
    @MainActor @preconcurrency public init(_ configuration: SubscriptionStoreControlStyleConfiguration, @ViewBuilder pickerOptionContent: @escaping (SubscriptionStoreControlStyleConfiguration.PickerOption) -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)

    /// Creates a subscription picker with a binding to observe and control selection.
    ///
    /// Providing the binding is optional, if you choose not to provide the binding the view will manage its
    /// selection state internally.
    ///
    /// Use ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` within
    /// `pickerContent` for each subscription option provided to your control style's
    /// ``SubscriptionStoreControlStyle/makeBody(configuration:)`` method.
    /// You can use `Section` to group options and provide header and footer content between options.
    @MainActor @preconcurrency public init(selection: Binding<SubscriptionStoreControlStyleConfiguration.Option?>, @ViewBuilder pickerContent: () -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)

    /// Creates a subscription picker that creates a view for each option in the provided configuration.
    ///
    /// Providing the binding is optional, if you choose not to provide the binding the view will manage its
    /// selection state internally.
    ///
    /// In `pickerOptionContent`, declare the label for each subscription option. To create a label
    /// composed of the standard picker option label, declare a
    /// ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` providing only the
    /// ``SubscriptionStoreControlStyle/Configuration/PickerOption`` value.
    @MainActor @preconcurrency public init(_ configuration: SubscriptionStoreControlStyleConfiguration, selection: Binding<SubscriptionStoreControlStyleConfiguration.Option?>, @ViewBuilder pickerOptionContent: @escaping (SubscriptionStoreControlStyleConfiguration.PickerOption) -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePicker : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct SubscriptionStorePickerOption<Label> : View where Label : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePickerOption {

    /// Create a subscription picker option with a custom label.
    ///
    /// You must declare this as a descendant of a
    /// ``SubscriptionStoreControlStyle/SubscriptionPicker``.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.Option, @ViewBuilder label: @escaping (SubscriptionStoreControlStyleConfiguration.PickerOption) -> Label)

    /// Create a subscription picker option with the standard label.
    ///
    /// You must declare this as a descendant of a
    /// ``SubscriptionStoreControlStyle/SubscriptionPicker``.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.Option) where Label == AutomaticSubscriptionStorePickerOptionLabel

    /// Create a subscription picker option with the standard label.
    ///
    /// You must declare this as a descendant of a
    /// ``SubscriptionStoreControlStyle/SubscriptionPicker``.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.PickerOption) where Label == AutomaticSubscriptionStorePickerOptionLabel
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePickerOption : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A value that describes a link style button to a subscription policy.
///
/// Use ``subscriptionStorePolicyDestination(url:for:)`` or
/// ``subscriptionStorePolicyDestination(for:destination:)`` to set the destination
/// when someone chooses to view the corresponding policy in a ``SubscriptionStoreView``.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public struct SubscriptionStorePolicyKind : Hashable {

    /// The terms of service of a subscription.
    ///
    /// If you show the policy buttons using ``storeButton(_:for:)`` without setting a
    /// destination for the terms of service, the system will automatically display the EULA text from the
    /// App Store metadata for your app.
    public static var termsOfService: SubscriptionStorePolicyKind { get }

    /// The privacy policy of a subscription.
    ///
    /// If you show the policy buttons using ``storeButton(_:for:)`` without setting a
    /// destination for the privacy policy, the system will automatically display the privacy policy from the
    /// App Store metadata for your app. On iOS and macOS, the system will prefer opening the
    /// privacy policy URL, and on watchOS and tvOS the system will prefer displaying the privacy policy
    /// text.
    public static var privacyPolicy: SubscriptionStorePolicyKind { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SubscriptionStorePolicyKind, b: SubscriptionStorePolicyKind) -> Bool

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

// Available when SwiftUI is imported with StoreKit
/// A view that merchandises a collection of subscription options in a subscription group.
///
/// There are three ways to create a subscription group:
/// + Providing a subscription group identifier
/// + Providing a collection of product identifiers
/// + Providing a collection of product values you already loaded from the App Store
///
/// If you provide a subscription group identifier, or product identifiers, the subscription store automatically
/// loads the subscription data from the App Store, and updates the view when the data is available.
///
/// By default, the subscription store creates automatic marketing content based on your app and
/// subscriptions. You can provide a custom view to market your subscription by using an initializer with a
/// `marketingContent` parameter.
///
/// The subscription store does not draw a background by default, so you can use a modifier like
/// ``background(alignment:content:)`` to layer a background behind the view.
///
/// You can use the ``containerBackground(_:for:)`` or ``containerBackground(for:alignment:content:)``
/// view modifier with a ``SwiftUI/ContainerBackgroundPlacement`` like ``SwiftUI/ContainerBackgroundPlacement/subscriptionStoreHeader``
/// to set the container background of the subscription store using a view.
///
/// You can optionally provide a view as a decorative icon next to each subscription option. Use the
/// ``subscriptionStoreControlIcon(icon:)-dchx`` view modifier to set a view to use to decorate
/// individual subscription options within a subscription store.
///
/// ### Ordering & filtering subscriptions
///
/// If you provide a subscription group identifier, the system will order the subscription options according to
/// their rank. If someone is already subscribed, you may want to merchandise an upgrade or crossgrade
/// option. By default, the subscription store merchandises all products in the group, but if you provide a
/// `visibleRelationships` parameter, you can choose to hide certain options relative to the active
/// subscription option.
///
/// If you use one of the other initializers, the subscriptions will be ordered according to the collection
/// parameter's order. Any subscriptions that aren't included in the collection parameter will be excluded.
///
/// ### Terms of service & privacy policy
///
/// The subscription store automatically displays buttons for the terms of service and privacy policy submitted
/// with the App Store metadata. You may want to override the destination of these buttons with a URL to
/// a custom terms of service and privacy policy page, or a custom view. You can do this using a modifier like
/// ``subscriptionStorePolicyDestination(url:for:)-5hqba`` and
/// ``subscriptionStorePolicyDestination(for:destination:)-zvev``, respectively.
///
/// If the automatic style of these buttons is difficult to read against your store's background, you can use a
/// modifier like ``subscriptionStorePolicyForegroundStyle(_:)`` and
/// ``subscriptionStorePolicyForegroundStyle(_:_:)`` to customize the button's style.
///
/// ### Configuring the subscription store
///
/// In addition to the various initializers, you can further configure the subscription store using various view
/// modifiers.
///
/// You can specify the visibility of certain kinds of auxiliary buttons within the subscription store with the
/// ``storeButton(_:for:)-29wie`` view modifier.
///
/// If your subscription is available through other services, the subscription store can show a sign in button.
/// The sign in button allows you to implement a custom sign in flow to support people who are already
/// subscribed. Use the ``subscriptionStoreSignInAction(_:)-120ig`` modifier to set a function to
/// be called when someone uses the sign in button.
///
/// When the subscription store is being presented, it will show a close button automatically. You can override
/// this behavior to unconditionally show or hide the close button using the ``storeButton(_:for:)-29wie`` modifier.
///
/// ### Styling the subscription store
///
/// You can further customize the subscription store's appearance using various control styles.
///
/// Subscription store control styles allow you to customize how subscription options are displayed, and how
/// people are able to interact with your store. You can try out standard styles, like
/// ``SubscriptionStoreControlStyle/buttons``, by applying the style with
/// the ``subscriptionStoreControlStyle(_:)-9bmew`` modifier.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@MainActor @preconcurrency public struct SubscriptionStoreView<Content> : View where Content : View {

    /// Creates a view to load all subscriptions in a subscription group from the App Store, and merchandise
    /// them with custom marketing content.
    ///
    /// The `visibleRelationships` parameter only has effects when using a subscription store while
    /// someone is actively subscribed to the subscription. For example, if you provide
    /// ``StoreKit/Product/SubscriptionRelationship/upgrade`` for the `visibleRelationships`
    /// parameter, the subscription store will only show plans with a higher level of service than the active subscription.
    ///
    /// The following example shows how to create a subscription store view that presents upgrade options
    /// within a subscription group:
    /// ```
    /// SubscriptionStoreView(
    ///     groupID: "com.example.group",
    ///     visibleRelationships: .upgrade
    /// ) {
    ///     // Your premium marketing content
    /// }
    /// ```
    /// - Parameters:
    ///   - groupID: The subscription group identifier to load from the App Store.
    ///   - visibleRelationships: The kinds of subscription option relationships to be visible when
    ///   someone is already subscribed to the subscription.
    ///   - marketingContent: The view to display above the store controls as marketing content.
    nonisolated public init(groupID: String, visibleRelationships: Product.SubscriptionRelationship = .all, @ViewBuilder marketingContent: () -> Content)

    /// Creates a view to load a collection of subscriptions from the App Store, and merchandise them with
    /// custom marketing content.
    ///
    /// The store will order subscription options in the order of the provided collection. You can exclude
    /// subscription options by excluding their identifiers from the collection.
    ///
    /// All provided product identifiers must identify auto-renewable subscriptions in a single subscription
    /// group. Any products which are not auto-renewable subscriptions will be ignored, and subscriptions
    /// in multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    ///   - marketingContent: The view to display above the store controls as marketing content.
    nonisolated public init(productIDs: some Collection<String>, @ViewBuilder marketingContent: () -> Content)

    /// Creates a view to merchandise a collection of subscription options with custom marketing content.
    ///
    /// The store will order subscription options in the order of the provided collection. You can exclude
    /// subscription options by excluding their identifiers from the collection.
    ///
    /// All provided product values must be auto-renewable subscriptions in a single subscription group.
    /// Any products which are not auto-renewable subscriptions will be ignored, and subscriptions in
    /// multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - subscriptions: The subscription options to merchandise.
    ///   - marketingContent: The view to display above the store controls as marketing content.
    nonisolated public init(subscriptions: some Collection<Product>, @ViewBuilder marketingContent: () -> Content)

    /// Creates a view to load all subscriptions in a subscription group from the App Store, and merchandise
    /// them with automatic marketing content.
    ///
    /// The `visibleRelationships` parameter only has effects when using a subscription store while
    /// someone is actively subscribed to the subscription. For example, if you provide
    /// ``StoreKit/Product/SubscriptionRelationship/upgrade`` for the `visibleRelationships`
    /// parameter, the subscription store will only show plans with a higher level of service than the active subscription.
    /// - Parameters:
    ///   - groupID: The subscription group identifier to load from the App Store.
    ///   - visibleRelationships: The kinds of subscription option relationships to be visible when
    ///                           someone is already subscribed to the subscription.
    ///   - control: The kind of control to use for subscribing.
    nonisolated public init(groupID: String, visibleRelationships: Product.SubscriptionRelationship = .all) where Content == AutomaticSubscriptionStoreMarketingContent

    /// Creates a view to merchandise a collection of subscription options with automatic marketing content.
    ///
    /// The store will order subscription options in the order of the provided collection. You can exclude
    /// subscription options by excluding their identifiers from the collection.
    ///
    /// All provided product values must be auto-renewable subscriptions in a single subscription group.
    /// Any products which are not auto-renewable subscriptions will be ignored, and subscriptions in
    /// multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    nonisolated public init(productIDs: some Collection<String>) where Content == AutomaticSubscriptionStoreMarketingContent

    /// Creates a view to merchandise a collection of subscription options with automatic marketing content.
    ///
    /// The store will order subscription options in the order of the provided collection. You can exclude
    /// subscription options by excluding their identifiers from the collection.
    ///
    /// All provided product values must be auto-renewable subscriptions in a single subscription group.
    /// Any products which are not auto-renewable subscriptions will be ignored, and subscriptions in
    /// multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - subscriptions: The subscription options to merchandise.
    nonisolated public init(subscriptions: some Collection<Product>) where Content == AutomaticSubscriptionStoreMarketingContent

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    public typealias Body = some View
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreView {

    /// Creates a view to load all subscriptions in a subscription group from the App Store, and merchandise
    /// them using a custom store structure.
    ///
    /// This initializer is useful if you want to declare a hierarchy of subscription plans. For example, you
    /// may want to group related options into tabs within a tab view, or highlight certain options while
    /// offering customers additional options behind a navigation link. If you want the subscription store view
    /// to display all subscription options as a homogenous list, simply provide a SwiftUI view using
    /// ``init(groupID:visibleRelationships:marketingContent:)`` instead of
    /// ``StoreContent``.
    ///
    /// To configure the structure of your store, you first declare groups of subscription options using either
    /// ``SubscriptionOptionGroup`` or ``SubscriptionOptionGroupSet``. Then, you
    /// declare the style in which the subscription store view displays your groups using
    /// `subscriptionStoreOptionGroupStyle(_:)`. If you choose `tabs` the subscription store
    /// view will contain a tab view, with each top level group represented as a tab. If you choose `links`,
    /// controls to subscribe to any options in the first group are initially displayed along with links to
    /// navigate to any following groups.
    ///
    /// The `visibleRelationships` parameter only has effects when using a subscription store while
    /// someone is actively subscribed to the subscription. For example, if you provide
    /// ``StoreKit/Product/SubscriptionRelationship/upgrade`` for the 
    /// `visibleRelationships` parameter, the subscription store will only show plans with a higher
    /// level of service than the active subscription.
    /// - Parameters:
    ///   - groupID: The subscription group identifier to load from the App Store.
    ///   - visibleRelationships: The kinds of subscription option relationships to be visible when
    ///                           someone is already subscribed to the subscription.
    ///   - content: The structure to use when displaying the store's subscription options.
    nonisolated public init<C>(groupID: String, visibleRelationships: Product.SubscriptionRelationship = .all, @StoreContentBuilder content: () -> C) where Content == SubscriptionStoreContentView<C>, C : StoreContent

    /// Creates a view to merchandise a collection of subscription options with a custom store structure.
    /// 
    /// This initializer is useful if you want to declare a hierarchy of subscription plans. For example, you
    /// may want to group related options into tabs within a tab view, or highlight certain options while
    /// offering customers additional options behind a navigation link. If you want the subscription store view
    /// to display all subscription options as a homogenous list, simply provide a SwiftUI view using
    /// ``init(groupID:visibleRelationships:marketingContent:)`` instead of
    /// ``StoreContent``.
    ///
    /// To configure the structure of your store, you first declare groups of subscription options using either
    /// ``SubscriptionOptionGroup`` or ``SubscriptionOptionGroupSet``. Then, you
    /// declare the style in which the subscription store view displays your groups using
    /// `subscriptionStoreOptionGroupStyle(_:)`. If you choose `tabs` the subscription store
    /// view will contain a tab view, with each top level group represented as a tab. If you choose `links`,
    /// controls to subscribe to any options in the first group are initially displayed along with links to
    /// navigate to any following groups.
    ///
    /// Each group will order subscription options in the order of the provided collection. You can exclude
    /// subscription options from all groups by excluding their identifiers from the collection.
    ///
    /// All provided product values must be auto-renewable subscriptions in a single subscription group.
    /// Any products which are not auto-renewable subscriptions will be ignored, and subscriptions in
    /// multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - subscriptions: The subscription options to merchandise.
    ///   - sections: The items representing the option group sections in the merchandising view.
    nonisolated public init<C>(subscriptions: some Collection<Product>, @StoreContentBuilder content: () -> C) where Content == SubscriptionStoreContentView<C>, C : StoreContent

    /// Creates a view to load a collection of subscriptions from the App Store, and merchandise them using
    /// a custom store structure.
    ///
    /// This initializer is useful if you want to declare a hierarchy of subscription plans. For example, you
    /// may want to group related options into tabs within a tab view, or highlight certain options while
    /// offering customers additional options behind a navigation link. If you want the subscription store view
    /// to display all subscription options as a homogenous list, simply provide a SwiftUI view using
    /// ``init(groupID:visibleRelationships:marketingContent:)`` instead of
    /// ``StoreContent``.
    ///
    /// To configure the structure of your store, you first declare groups of subscription options using either
    /// ``SubscriptionOptionGroup`` or ``SubscriptionOptionGroupSet``. Then, you
    /// declare the style in which the subscription store view displays your groups using
    /// `subscriptionStoreOptionGroupStyle(_:)`. If you choose `tabs` the subscription store
    /// view will contain a tab view, with each top level group represented as a tab. If you choose `links`,
    /// controls to subscribe to any options in the first group are initially displayed along with links to
    /// navigate to any following groups.
    ///
    /// Each group will order subscription options in the order of the provided collection. You can exclude
    /// subscription options from all groups by excluding their identifiers from the collection.
    ///
    /// All provided product identifiers must identify auto-renewable subscriptions in a single subscription
    /// group. Any products which are not auto-renewable subscriptions will be ignored, and subscriptions
    /// in multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    ///   - content: The structure to use when displaying the store's subscription options.
    nonisolated public init<C>(productIDs: some Collection<String>, @StoreContentBuilder content: () -> C) where Content == SubscriptionStoreContentView<C>, C : StoreContent
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension SubscriptionStoreView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
/// A subscription option group style which displays a tab view containing tabs for each subgroup.
///
/// The subgroup's label is displayed within the tab views selection control. Make sure you provide a label for
/// each subgroup with a tab style group, or an error will be logged at runtime.
///
/// You can also use ``tabs`` to construct this style.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, *)
@available(watchOS, unavailable)
public struct TabsSubscriptionOptionGroupStyle : SubscriptionOptionGroupStyle {

    /// Creates a tabs subscription option group style.
    public init()
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@MainActor @preconcurrency public struct TupleStoreContent<each Content> : StoreContent where repeat each Content : StoreContent {

    /// The composition of content that comprise the subscription store view content.
    @MainActor @preconcurrency public var body: Never { get }

    /// The type of content representing the body of this subscription store view content.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias Body = Never
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TupleStoreContent : Sendable {
}

// Available when SwiftUI is imported with StoreKit
public typealias __Float16x4_t = SIMD4<Float16>

// Available when SwiftUI is imported with StoreKit
public typealias __Float16x8_t = SIMD8<Float16>

// Available when SwiftUI is imported with StoreKit
public typealias __Float32x2_t = SIMD2<Float>

// Available when SwiftUI is imported with StoreKit
public typealias __Float32x4_t = SIMD4<Float>

// Available when SwiftUI is imported with StoreKit
public typealias __Float64x2_t = SIMD2<Double>

// Available when SwiftUI is imported with StoreKit
public typealias __Int16x4_t = SIMD4<Int16>

// Available when SwiftUI is imported with StoreKit
public typealias __Int16x8_t = SIMD8<Int16>

// Available when SwiftUI is imported with StoreKit
public typealias __Int32x2_t = SIMD2<Int32>

// Available when SwiftUI is imported with StoreKit
public typealias __Int32x4_t = SIMD4<Int32>

// Available when SwiftUI is imported with StoreKit
public typealias __Int64x2_t = SIMD2<Int>

// Available when SwiftUI is imported with StoreKit
public typealias __Int8x16_t = SIMD16<Int8>

// Available when SwiftUI is imported with StoreKit
public typealias __Int8x8_t = SIMD8<Int8>

// Available when SwiftUI is imported with StoreKit
public typealias __NSConstantString = __NSConstantString_tag

// Available when SwiftUI is imported with StoreKit
public typealias __Poly16x4_t = SIMD4<UInt16>

// Available when SwiftUI is imported with StoreKit
public typealias __Poly16x8_t = SIMD8<UInt16>

// Available when SwiftUI is imported with StoreKit
public typealias __Poly64x2_t = SIMD2<UInt>

// Available when SwiftUI is imported with StoreKit
public typealias __Poly8x16_t = SIMD16<UInt8>

// Available when SwiftUI is imported with StoreKit
public typealias __Poly8x8_t = SIMD8<UInt8>

// Available when SwiftUI is imported with StoreKit
public typealias __Uint16x4_t = SIMD4<UInt16>

// Available when SwiftUI is imported with StoreKit
public typealias __Uint16x8_t = SIMD8<UInt16>

// Available when SwiftUI is imported with StoreKit
public typealias __Uint32x2_t = SIMD2<UInt32>

// Available when SwiftUI is imported with StoreKit
public typealias __Uint32x4_t = SIMD4<UInt32>

// Available when SwiftUI is imported with StoreKit
public typealias __Uint64x2_t = SIMD2<UInt>

// Available when SwiftUI is imported with StoreKit
public typealias __Uint8x16_t = SIMD16<UInt8>

// Available when SwiftUI is imported with StoreKit
public typealias __Uint8x8_t = SIMD8<UInt8>

// Available when SwiftUI is imported with StoreKit
public typealias __builtin_ms_va_list = UnsafeMutablePointer<CChar>

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Declares the view as dependent on the status of an auto-renewable subscription group, and
    /// returns a modified view.
    ///
    /// Before a view modified with this method appears, a task will start in the background to get
    /// the subscription status. While the view is presented, the task will call `action` whenever
    /// the status changes or the task's state changes.
    ///
    /// - Parameters:
    ///   - groupID: The subscription group ID to get the status for. The task restarts whenever this
    ///              parameter changes.
    ///   - priority: The task priority to use when creating the task.
    ///   - action: The action to perform when the task's state changes.
    nonisolated public func subscriptionStatusTask(for groupID: String, priority: TaskPriority = .medium, action: @escaping (EntitlementTaskState<[Product.SubscriptionInfo.Status]>) async -> ()) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferViewStyleConfiguration.Icon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension SubscriptionStoreControlStyle where Self == AutomaticSubscriptionStoreControlStyle {

    /// The default subscription store control style, choosing a standard style automatically based on the 
    /// view's context.
    @MainActor @preconcurrency public static var automatic: AutomaticSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
extension EnvironmentValues {

    @available(iOS 16.0, macOS 13.0, visionOS 1.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var requestReview: RequestReviewAction { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Add an action to perform when a user triggers the purchase button on a StoreKit view within this
    /// view.
    ///
    /// You can remove any actions ancestor views may have added by providing `nil` for the action.
    /// - Parameter action: The action to perform, with the product to be purchased provided as a
    ///                     parameter.
    nonisolated public func onInAppPurchaseStart(perform action: ((Product) async -> ())?) -> some View


    /// Add a function to call before initiating a purchase from StoreKit view within this view, providing a set
    /// of options for the purchase.
    ///
    /// In-app stores within this view will add any default purchase options to the set you return, and use
    /// the result for configuring the purchase. If you just want to react to in-app purchases beginning
    /// without adding purchase options, you can add an action with
    /// ``onInAppPurchaseStart(perform:)``.
    ///
    /// You can remove any options ancestor views may have added by providing `nil` for the action.
    /// This will result in using the default set of purchase options.
    /// - Parameter options: The system calls this function before processing a purchase, with the
    ///                      product to  be purchased is provided as a parameter. Return a set of
    ///                      purchase options to add to the purchase.
    nonisolated public func inAppPurchaseOptions(_ options: ((Product) async -> Set<Product.PurchaseOption>)?) -> some View


    /// Add an action to perform when a purchase initiated from a StoreKit view within this view completes.
    ///
    /// By default, transactions from successful in-app store view purchases will be emitted from
    /// `Transaction.updates`. If the purchase fails with an error, an alert will be displayed. You can
    /// revert a view back to this behavior by providing `nil` for action.
    ///
    /// Only one action will be performed for each purchase. Descendant views can override the action by
    /// using another ``onInAppPurchaseCompletion(perform:)`` modifier.
    /// - Parameter action: The action to perform, with the product value and the purchase result
    ///                     provided as parameters.
    nonisolated public func onInAppPurchaseCompletion(perform action: ((Product, Result<Product.PurchaseResult, any Error>) async -> ())?) -> some View

}

// Available when SwiftUI is imported with StoreKit
extension View {

    /// Selects a subscription offer to apply to a purchase that a customer makes from a subscription
    /// store view, a store view, or a product view.
    ///
    /// Subscription stores within this view use the subscription offer you specify to configure the
    /// appearance of the subscription plans. <doc://com.apple.documentation/documentation/storekit/productview>
    /// doesn’t display the terms of a subscription offer in the UI, but you can still use this modifier to
    /// declare which offer product views within a view hierarchy apply to a purchase.
    ///
    /// Offer preferences that use this modifier override offer preferences from ancestor views.
    ///
    /// - Important: Subscription offers in the
    ///              <doc://com.apple.documentation/documentation/storekit/product/subscriptioninfo>
    ///              object may contain offers the customer isn’t eligible for. Instead, use the
    ///              eligibleOffers argument of the offer closure to select the offers to apply to the
    ///              customer’s purchase.
    ///
    /// If StoreKit determines that the customer is eligible for more than one offer, the system calls the
    /// `offer` closure before it draws the product on the subscription store view, or before the customer
    /// initiates a purchase on a store view or product view. Return the subscription offer to apply to the
    /// product, if any, to have system-provided UI reflect the discounted pricing terms under the
    /// selected offer.
    ///
    /// If your `offer` closure returns nil, the system selects the introductory offer, if it exists, and if the
    /// customer is eligible for it.
    ///
    /// The following code example sets the preferred subscription offer to the first offer the customer
    /// is eligible for:
    ///
    ///     import SwiftUI
    ///     import StoreKit
    ///
    ///     @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    ///     struct MyView: View {
    ///
    ///         var body: some View {
    ///             SubscriptionStoreView(groupID: groupIdentifier)
    ///                 .preferredSubscriptionOffer { product, subscription, eligibleOffers in
    ///                     // Determine the offer to use from the list of eligibleOffers.
    ///                     // This example just uses the first offer.
    ///                     return eligibleOffers.first
    ///                 }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - offer: A closure that returns the subscription offer to apply to the customer’s purchase.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func preferredSubscriptionOffer(_ offer: @escaping (_ product: Product, _ subscription: Product.SubscriptionInfo, _ eligibleOffers: [Product.SubscriptionOffer]) -> Product.SubscriptionOffer?) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreView {

    /// Creates a view to load all subscriptions in a subscription group from the App Store, and merchandise
    /// them using a custom store structure.
    ///
    /// This initializer is useful if you want to declare a hierarchy of subscription plans. For example, you
    /// may want to group related options into tabs within a tab view, or highlight certain options while
    /// offering customers additional options behind a navigation link. If you want the subscription store view
    /// to display all subscription options as a homogenous list, simply provide a SwiftUI view using
    /// ``init(groupID:visibleRelationships:marketingContent:)`` instead of
    /// ``StoreContent``.
    ///
    /// To configure the structure of your store, you first declare groups of subscription options using either
    /// ``SubscriptionOptionGroup`` or ``SubscriptionOptionGroupSet``. Then, you
    /// declare the style in which the subscription store view displays your groups using
    /// `subscriptionStoreOptionGroupStyle(_:)`. If you choose `tabs` the subscription store
    /// view will contain a tab view, with each top level group represented as a tab. If you choose `links`,
    /// controls to subscribe to any options in the first group are initially displayed along with links to
    /// navigate to any following groups.
    ///
    /// The `visibleRelationships` parameter only has effects when using a subscription store while
    /// someone is actively subscribed to the subscription. For example, if you provide
    /// ``StoreKit/Product/SubscriptionRelationship/upgrade`` for the 
    /// `visibleRelationships` parameter, the subscription store will only show plans with a higher
    /// level of service than the active subscription.
    /// - Parameters:
    ///   - groupID: The subscription group identifier to load from the App Store.
    ///   - visibleRelationships: The kinds of subscription option relationships to be visible when
    ///                           someone is already subscribed to the subscription.
    ///   - content: The structure to use when displaying the store's subscription options.
    nonisolated public init<C>(groupID: String, visibleRelationships: Product.SubscriptionRelationship = .all, @StoreContentBuilder content: () -> C) where Content == SubscriptionStoreContentView<C>, C : StoreContent

    /// Creates a view to merchandise a collection of subscription options with a custom store structure.
    /// 
    /// This initializer is useful if you want to declare a hierarchy of subscription plans. For example, you
    /// may want to group related options into tabs within a tab view, or highlight certain options while
    /// offering customers additional options behind a navigation link. If you want the subscription store view
    /// to display all subscription options as a homogenous list, simply provide a SwiftUI view using
    /// ``init(groupID:visibleRelationships:marketingContent:)`` instead of
    /// ``StoreContent``.
    ///
    /// To configure the structure of your store, you first declare groups of subscription options using either
    /// ``SubscriptionOptionGroup`` or ``SubscriptionOptionGroupSet``. Then, you
    /// declare the style in which the subscription store view displays your groups using
    /// `subscriptionStoreOptionGroupStyle(_:)`. If you choose `tabs` the subscription store
    /// view will contain a tab view, with each top level group represented as a tab. If you choose `links`,
    /// controls to subscribe to any options in the first group are initially displayed along with links to
    /// navigate to any following groups.
    ///
    /// Each group will order subscription options in the order of the provided collection. You can exclude
    /// subscription options from all groups by excluding their identifiers from the collection.
    ///
    /// All provided product values must be auto-renewable subscriptions in a single subscription group.
    /// Any products which are not auto-renewable subscriptions will be ignored, and subscriptions in
    /// multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - subscriptions: The subscription options to merchandise.
    ///   - sections: The items representing the option group sections in the merchandising view.
    nonisolated public init<C>(subscriptions: some Collection<Product>, @StoreContentBuilder content: () -> C) where Content == SubscriptionStoreContentView<C>, C : StoreContent

    /// Creates a view to load a collection of subscriptions from the App Store, and merchandise them using
    /// a custom store structure.
    ///
    /// This initializer is useful if you want to declare a hierarchy of subscription plans. For example, you
    /// may want to group related options into tabs within a tab view, or highlight certain options while
    /// offering customers additional options behind a navigation link. If you want the subscription store view
    /// to display all subscription options as a homogenous list, simply provide a SwiftUI view using
    /// ``init(groupID:visibleRelationships:marketingContent:)`` instead of
    /// ``StoreContent``.
    ///
    /// To configure the structure of your store, you first declare groups of subscription options using either
    /// ``SubscriptionOptionGroup`` or ``SubscriptionOptionGroupSet``. Then, you
    /// declare the style in which the subscription store view displays your groups using
    /// `subscriptionStoreOptionGroupStyle(_:)`. If you choose `tabs` the subscription store
    /// view will contain a tab view, with each top level group represented as a tab. If you choose `links`,
    /// controls to subscribe to any options in the first group are initially displayed along with links to
    /// navigate to any following groups.
    ///
    /// Each group will order subscription options in the order of the provided collection. You can exclude
    /// subscription options from all groups by excluding their identifiers from the collection.
    ///
    /// All provided product identifiers must identify auto-renewable subscriptions in a single subscription
    /// group. Any products which are not auto-renewable subscriptions will be ignored, and subscriptions
    /// in multiple subscription groups may lead to unintended behavior.
    /// - Parameters:
    ///   - productIDs: The product identifiers to load from the App Store.
    ///   - content: The structure to use when displaying the store's subscription options.
    nonisolated public init<C>(productIDs: some Collection<String>, @StoreContentBuilder content: () -> C) where Content == SubscriptionStoreContentView<C>, C : StoreContent
}

// Available when SwiftUI is imported with StoreKit
extension View {

    @available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, *)
    nonisolated public func preferredSubscriptionPricingTerms(_ pricingTerms: @escaping (_ product: Product, _ subscriptionInfo: SubscriptionInfo) -> SubscriptionInfo.PricingTerms?) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle where Self == PagedPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a paged picker control, with a single
    /// button to subscribe.
    ///
    /// On iOS and macOS, the paged picker prefers to use a page style tab view to display picker options in
    /// compact containers. For sufficiently wide containers, the paged picker lays out picker options in a
    /// horizontal stack.
    ///
    /// On watchOS, the paged picker shows the current selection in a collapsed state. When you focus on the
    /// control, you can use the digital crown to change the selection.
    @MainActor @preconcurrency public static var pagedPicker: PagedPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductViewStyle where Self == AutomaticProductViewStyle {

    /// The automatic product view style, based on the view's context.
    @MainActor @preconcurrency public static var automatic: AutomaticProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
extension View {

    /// Selects a promotional offer to apply to a purchase a customer makes from a subscription store view.
    ///
    /// Subscription stores within this view uses the specified subscription offer to configure
    /// the appearance of the subscription plans displayed, when you use a system-provided
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstorecontrolstyle>
    /// to style the in-app subscription store. Standard
    /// <doc://com.apple.documentation/documentation/storekit/productviewstyle>
    /// instances don’t show introductory or promotional offers in UI. Use the
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstoreview>
    /// instead to show these offers in the UI.
    ///
    /// If the signature passes validation for the offer you select, the system applies the offer to the purchase.
    /// If the signature fails validation for the offer you select, the purchase fails with
    /// <doc://com.apple.documentation/documentation/storekit/product/purchaseerror/invalidoffersignature>.
    ///
    /// Promotional offers you select in this modifier overwrite any offers you specified in ancestor views.
    ///
    /// - Parameters:
    ///   - offer: The system calls this function before drawing the given subscription product on
    ///            the subscription store view. Return the promotional offer to apply to the
    ///            product, if any, to have system-provided UI reflect the discounted terms under
    ///            the selected offer.
    ///   - signature: The system calls this function before processing a purchase, with the
    ///                product to be purchased provided as a parameter, along with the selected
    ///                subscription offer to be applied to the purchase. Return a signature you
    ///                generate on your server that validates the selected offer. Errors thrown
    ///                from this closure will be surfaced via the ``onInAppPurchaseCompletion(perform:)``
    ///                modifier. For information about generating the signature, see
    ///                <doc://com.apple.documentation/documentation/storekit/generating-a-signature-for-promotional-offers>.
    /// @DeprecationSummary { Sign promotional offers with JWS and use the ``subscriptionPromotionalOffer(offer:compactJWS:)`` view modifier instead.  }
    @available(iOS, introduced: 17.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use the subscriptionPromotionalOffer(offer:compactJWS:) view modifier instead")
    @available(macOS, introduced: 14.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use the subscriptionPromotionalOffer(offer:compactJWS:) view modifier instead")
    @available(tvOS, introduced: 17.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use the subscriptionPromotionalOffer(offer:compactJWS:) view modifier instead")
    @available(watchOS, introduced: 10.4, deprecated: 26.0, message: "Sign promotional offers with JWS and use the subscriptionPromotionalOffer(offer:compactJWS:) view modifier instead")
    @available(visionOS, introduced: 1.1, deprecated: 26.0, message: "Sign promotional offers with JWS and use the subscriptionPromotionalOffer(offer:compactJWS:) view modifier instead")
    nonisolated public func subscriptionPromotionalOffer(offer: @escaping (_ product: Product, _ subscriptionInfo: Product.SubscriptionInfo) -> Product.SubscriptionOffer?, signature: @escaping (_ product: Product, _ subscriptionInfo: Product.SubscriptionInfo, _ promotionalOffer: Product.SubscriptionOffer) async throws -> Product.SubscriptionOffer.Signature) -> some View


    /// Selects a promotional offer to apply to a purchase a customer makes from a subscription store view.
    ///
    /// Subscription stores within this view uses the specified subscription offer to configure
    /// the appearance of the subscription plans displayed, when you use a system-provided
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstorecontrolstyle>
    /// to style the in-app subscription store. Standard
    /// <doc://com.apple.documentation/documentation/storekit/productviewstyle>
    /// instances don’t show introductory or promotional offers in UI. Use the
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstoreview>
    /// instead to show these offers in the UI.
    ///
    /// If the signature passes validation for the offer you select, the system applies the offer to the purchase.
    /// If the signature fails validation for the offer you select, the purchase fails with
    /// <doc://com.apple.documentation/documentation/storekit/product/purchaseerror/invalidoffersignature>.
    ///
    /// Promotional offers you select in this modifier overwrite any offers you specified in ancestor views.
    ///
    /// - Parameters:
    ///   - offer: The system calls this function before drawing the given subscription product on
    ///            the subscription store view. Return the promotional offer to apply to the
    ///            product, if any, to have system-provided UI reflect the discounted terms under
    ///            the selected offer.
    ///   - compactJWS: The system calls this function before processing a purchase, with the
    ///                 product to be purchased provided as a parameter, along with the selected
    ///                 subscription offer to be applied to the purchase. Return a compact JWS
    ///                 signature you generate on your server that validates the selected offer.
    ///                 Errors thrown from this closure will be surfaced via the
    ///                 ``onInAppPurchaseCompletion(perform:)`` modifier.
    ///                 For information about generating the JWS signature, see
    ///                 <doc://com.apple.documentation/documentation/storekit/generating-jws-to-sign-app-store-requests>..
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
    nonisolated public func subscriptionPromotionalOffer(offer: @escaping (_ product: Product, _ subscriptionInfo: Product.SubscriptionInfo) -> Product.SubscriptionOffer?, compactJWS: @escaping (_ product: Product, _ subscriptionInfo: Product.SubscriptionInfo, _ promotionalOffer: Product.SubscriptionOffer) async throws -> String) -> some View


    /// Selects the introductory offer eligibility preference to apply to a purchase a customer makes from a subscription store view.
    ///
    /// Subscription stores within this view uses the introductory subscription offers to configure
    /// the appearance of the subscription plans displayed, when you use a system-provided
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstorecontrolstyle>
    /// to style the in-app subscription store. Standard
    /// <doc://com.apple.documentation/documentation/storekit/productviewstyle>
    /// instances don’t show introductory or promotional offers in UI, instead use
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstoreview>.
    ///
    /// Determine if the introductory offer should be displayed in the view and applied to the purchase using the `applyOffer`.
    /// If the signature passes validation, the system applies or removes the offer to the purchases
    /// according to the offer eligibility preference.
    /// If the signature fails validation, the purchase will fail with
    /// <doc://com.apple.documentation/documentation/storekit/product/purchaseerror/invalidoffersignature>.
    ///
    /// - Parameters:
    ///   - applyOffer: The system calls this function before drawing the given subscription product on
    ///                 the subscription store view. Return if the introductory offer should be applied
    ///                 to a given product, if any, to have system-provided UI reflect the discounted terms under
    ///                 the selected offer.
    ///   - compactJWS: The system calls this function before processing a purchase, with the
    ///                 product to be purchased provided as a parameter. Return a compact JWS
    ///                 signature you generate on your server that validates the selected offer eligibility preference.
    ///                 Errors thrown from this closure will be surfaced via the
    ///                 ``onInAppPurchaseCompletion(perform:)`` modifier.
    ///                 For information about generating the JWS signature, see
    ///                 <doc://com.apple.documentation/documentation/storekit/generating-jws-to-sign-app-store-requests>.
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
    nonisolated public func subscriptionIntroductoryOffer(applyOffer: @escaping (_ product: Product, _ subscriptionInfo: Product.SubscriptionInfo) -> Bool, compactJWS: @escaping (_ product: Product, _ subscriptionInfo: Product.SubscriptionInfo) async throws -> String) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Option : Identifiable {

    /// The product ID of the subscription option.
    public var id: Product.ID { get }

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public typealias ID = Product.ID
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Option : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: SubscriptionStoreControlStyleConfiguration.Option, rhs: SubscriptionStoreControlStyleConfiguration.Option) -> Bool
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Option : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyleConfiguration.PickerOption : Identifiable {

    /// The product ID of the subscription option.
    public var id: Product.ID { get }

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    @available(macOS 15.0, iOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable, introduced: 17.0)
    public typealias ID = Product.ID
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyleConfiguration.PickerOption : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SubscriptionStoreControlStyleConfiguration.PickerOption, b: SubscriptionStoreControlStyleConfiguration.PickerOption) -> Bool
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyleConfiguration.PickerOption : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Sets the control style for subscription store views within a view.
    ///
    /// This view modifier set the style of controls for
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstoreview>
    /// instances within a view.
    nonisolated public func subscriptionStoreControlStyle(_ style: some SubscriptionStoreControlStyle) -> some View

}

// Available when SwiftUI is imported with StoreKit
extension View {

    /// Sets the control style and control placement for subscription store views within a view.
    ///
    /// This modifier sets the style and placement of the subscription controls in any
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstoreview>
    /// instance within a view.
    ///
    /// - Parameters:
    ///    - style: The subscription store control style to use when drawing the subscription controls of
    ///             <doc://com.apple.documentation/documentation/storekit/subscriptionstoreview>
    ///             instances within a view.
    ///    - placement: The desired region of the subscription store view for placing the subscription controls.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStoreControlStyle<S>(_ style: S, placement: S.Placement) -> some View where S : SubscriptionStoreControlStyle

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StoreContent {

    /// Set the control style and placement for groups of subscription options within the content.
    ///
    /// - Parameters:
    ///    - style: The ``SubscriptionStoreControlStyle`` to use when drawing the
    ///             controls of a group of subscription options.
    ///    - placement: The desired region of the subscription store view to place the controls.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStoreControlStyle<S>(_ style: S, placement: S.Placement = .automatic) -> some StoreContent where S : SubscriptionStoreControlStyle

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionStoreControlStyle where Self == PagedProminentPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a paged prominent picker 
    /// control, with a single button to subscribe.
    ///
    /// The paged prominent picker prefers to use a page style tab view to display picker options in compact
    /// containers. For sufficiently wide containers, the paged prominent picker lays out picker options in a
    /// horizontal stack.
    ///
    /// You can also use ``SubscriptionStoreControlStyle/pagedProminentPicker`` to 
    /// construct this style.
    @MainActor @preconcurrency public static var pagedProminentPicker: PagedProminentPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferViewStyle where Self == AutomaticSubscriptionOfferViewStyle {

    nonisolated public static var automatic: AutomaticSubscriptionOfferViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@available(tvOS, unavailable)
extension PickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, visionOS 1.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ProductViewStyle where Self == LargeProductViewStyle {

    /// A product view style suitable for layouts where in-app purchase content is prominent.
    @MainActor @preconcurrency public static var large: LargeProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ButtonsSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension AutomaticProductPlaceholderIcon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
extension View {

    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func subscriptionOfferViewStyle(_ style: some SubscriptionOfferViewStyle) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePicker : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension SubscriptionStoreControlStyle where Self == ProminentPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a prominent picker control,
    /// with a single button to subscribe.
    ///
    /// You can use ``SubscriptionStoreControlStyle/picker`` for a similar control with a
    /// more plain appearance.
    @MainActor @preconcurrency public static var prominentPicker: ProminentPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension StoreView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Set a shape style to use for the background of subscription store view controls within the view.
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @available(visionOS, unavailable)
    nonisolated public func subscriptionStoreControlBackground(_ backgroundStyle: some ShapeStyle) -> some View


    /// Set a standard effect to use for the background of subscription store view controls within the view.
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @available(visionOS, unavailable)
    nonisolated public func subscriptionStoreControlBackground(_ backgroundStyle: SubscriptionStoreControlBackground) -> some View


    /// Sets the background style for picker items of the subscription store view instances within a view.
    ///
    /// You can also control the shape of the picker item background using
    /// ``subscriptionStorePickerItemBackground(_:in:)``.
    @available(tvOS, unavailable)
    nonisolated public func subscriptionStorePickerItemBackground(_ backgroundStyle: some ShapeStyle) -> some View


    /// Sets the background shape and style for subscription store view picker items within a view.
    ///
    /// Use this view modifier to customize the shape of the picker options in a subscription store view,
    /// as well as the background style.
    ///
    /// - Parameters:
    ///   - backgroundStyle: A ``ShapeStyle`` that determines the background style for the
    ///                      subscription store view picker items.
    ///   - shape: An instance of a type that conforms to ``Shape`` and determines the shape of
    ///            the subscription store view picker items. Omit the shape parameter to use the
    ///            default shape.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    @available(tvOS, unavailable)
    nonisolated public func subscriptionStorePickerItemBackground(_ backgroundStyle: some ShapeStyle, in shape: some Shape) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension StoreContent {

    /// Set a shape style to use for the background of subscription controls within the content.
    @available(iOS 18.0, macOS 15.0, *)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    nonisolated public func subscriptionStoreControlBackground(_ backgroundStyle: some ShapeStyle) -> some StoreContent


    /// Set a standard effect to use for the background of subscription controls within the content.
    @available(iOS 18.0, macOS 15.0, *)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    nonisolated public func subscriptionStoreControlBackground(_ backgroundStyle: SubscriptionStoreControlBackground) -> some StoreContent


    /// Sets the background style for picker items of the subscription store view instances within a view.
    ///
    /// You can also control the shape of the picker item background using
    /// ``subscriptionStorePickerItemBackground(_:in:)``.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStorePickerItemBackground(_ backgroundStyle: some ShapeStyle) -> some StoreContent


    /// Sets the background shape and style for subscription store view picker items within a view.
    ///
    /// Use this view modifier to customize the shape of the picker options in a subscription store view,
    /// as well as the background style.
    ///
    /// - Parameters:
    ///   - backgroundStyle: A ``ShapeStyle`` that determines the background style for the
    ///                      subscription store view picker items.
    ///   - shape: An instance of a type that conforms to ``Shape`` and determines the shape of
    ///            the subscription store view picker items. Omit the shape parameter to use the
    ///            default shape.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStorePickerItemBackground(_ backgroundStyle: some ShapeStyle, in shape: some Shape) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionSection : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension CompactProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroupStyle where Self == AutomaticSubscriptionOptionGroupStyle {

    /// The automatic subscrption option group style, based on the group's context.
    public static var automatic: AutomaticSubscriptionOptionGroupStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TupleStoreContent : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, *)
@available(watchOS, unavailable)
extension SubscriptionOptionGroupStyle where Self == TabsSubscriptionOptionGroupStyle {

    /// A subscription option group style which displays a tab view containing tabs for each subgroup.
    ///
    /// The subgroup's label is displayed within the tab views selection control. Make sure you provide a 
    /// label for each subgroup with a tab style group, or an error will be logged at runtime.
    public static var tabs: TabsSubscriptionOptionGroupStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DisplayMessageAction : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroupStyle where Self == LinksSubscriptionOptionGroupStyle {

    /// A subscription option group style which displays the first subgroup's content along with links to 
    /// navigate to each other subgroup.
    ///
    /// Since the first subgroup's content is displayed initially, you don't need to provide a label. StoreKit 
    /// provides an automatic label for links to other subgroups, but you can provide a label with your
    /// subgroups to customize this.
    public static var links: LinksSubscriptionOptionGroupStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup : Sendable {
}

// Available when SwiftUI is imported with StoreKit
extension View {

    /// Sets the style subscription store views within this view use to display groups of subscription options.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStoreOptionGroupStyle(_ style: some SubscriptionOptionGroupStyle) -> some View

}

// Available when SwiftUI is imported with StoreKit
extension StoreContent {

    /// Sets the style subscription option groups within this content use to display child groups.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @MainActor @preconcurrency public func subscriptionStoreOptionGroupStyle(_ style: some SubscriptionOptionGroupStyle) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, tvOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
extension PurchaseAction : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Adds an action to perform when a person uses the sign-in button on a subscription store view within a view.
    ///
    /// You can only have one sign in action for a view. If an ancestor view specifies a sign in action, using
    /// this modifier will replace the ancestor's sign in action.
    ///
    /// If the value is `nil`, subscription stores will never show a sign in button. You can also hide the
    /// sign in button without removing the action by using the ``storeButton(_:for:)``
    /// modifier, providing <doc://com.apple.documentation/documentation/storekit/storebuttonkind/signin>
    /// as the button kind.
    ///
    /// - Parameter action: The action to perform. Pass `nil` to remove the sign in action for
    ///                     subscription stores within this view. The default value is `nil`.
    nonisolated public func subscriptionStoreSignInAction(_ action: (() -> ())?) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductViewStyleConfiguration.Icon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferViewStyle where Self == CompactSubscriptionOfferViewStyle {

    nonisolated public static var compact: CompactSubscriptionOfferViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle {

    /// A subscription option within a subscription picker control.
    ///
    /// Since subscription picker options are composed of buttons, you can style the options with button
    /// styles. Use a custom button style, or apply a standard style provided by StoreKit like
    /// `subscriptionPickerOptionProminent`.
    public typealias SubscriptionPickerOption = SubscriptionStorePickerOption
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle where Self == PickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a picker control, with a single
    /// button to subscribe.
    ///
    /// You can use ``SubscriptionStoreControlStyle/prominentPicker`` for a similar
    /// control with a more prominent appearance.
    @MainActor @preconcurrency public static var picker: PickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionPeriodGroupSet : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension ProminentPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension ContainerBackgroundPlacement {

    /// An automatic placement within a subscription store view, based on the view's context.
    public static var subscriptionStore: ContainerBackgroundPlacement { get }

    /// A background placement behind the marketing content of a subscription store view.
    @available(tvOS 18.0, *)
    public static var subscriptionStoreHeader: ContainerBackgroundPlacement { get }

    /// A background placement that spans the full height of a subscription store view.
    public static var subscriptionStoreFullHeight: ContainerBackgroundPlacement { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState where Value == VerificationResult<Transaction>? {

    /// The entitlement value if the task was successful.
    ///
    /// Use this as a convenience to access the transaction value in code that doesn't depend on the
    /// reason the transaction is not available. The value is `nil` while the transaction is loading, if it fails
    /// to load for any reason, or the customer is not entitled to the product.
    public var transaction: VerificationResult<Transaction>? { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Declares the view as dependent on the entitlement of an In-App Purchase product, and returns a
    /// modified view.
    ///
    /// Before a view modified with this method appears, a task will start in the background to get the
    /// current entitlement. While the view is presented, the task will call `action` whenever the
    /// entitlement changes or the task's state changes.
    ///
    /// Consumable in-app purchases will always pass `nil` to `action`.
    /// For auto-renewable subscriptions, use
    /// `subscriptionStatusTask(for:priority:action:)` to get the full status
    /// information for the subscription.
    /// 
    /// - Parameters:
    ///   - productID: The product ID to get the entitlement for. The task restarts whenever this
    ///                parameter changes.
    ///   - priority: The task priority to use when creating the task.
    ///   - action: The action to perform when the task's state changes.
    nonisolated public func currentEntitlementTask(for productID: String, priority: TaskPriority = .medium, action: @escaping (EntitlementTaskState<VerificationResult<Transaction>?>) async -> ()) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension SubscriptionStoreControlStyle where Self == ButtonsSubscriptionStoreControlStyle {

    /// A subscription store control style that displays a subscribe button for each subscription plan.
    @MainActor @preconcurrency public static var buttons: ButtonsSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Product {

    /// A set of relationships between two subscription options in an active subscription group.
    public struct SubscriptionRelationship : OptionSet, Hashable {

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
        public var rawValue: Int

        /// Creates a new option set from the given raw value.
        ///
        /// This initializer always succeeds, even if the value passed as `rawValue`
        /// exceeds the static properties declared as part of the option set. This
        /// example creates an instance of `ShippingOptions` with a raw value beyond
        /// the highest element, with a bit mask that effectively contains all the
        /// declared static members.
        ///
        ///     let extraOptions = ShippingOptions(rawValue: 255)
        ///     print(extraOptions.isStrictSuperset(of: .all))
        ///     // Prints "true"
        ///
        /// - Parameter rawValue: The raw value of the option set to create. Each bit
        ///   of `rawValue` potentially represents an element of the option set,
        ///   though raw values may include bits that are not defined as distinct
        ///   values of the `OptionSet` type.
        public init(rawValue: Int)

        /// The current option that the subscription will renew to at the start of the next period.
        public static let current: Product.SubscriptionRelationship

        /// Subscription options which offer a lower level of service than the current option.
        public static let downgrade: Product.SubscriptionRelationship

        /// Subscription options which offer the same level of service as the current option, excluding the
        /// current option.
        public static let crossgrade: Product.SubscriptionRelationship

        /// Subscription options which offer a higher level of service than the current option.
        public static let upgrade: Product.SubscriptionRelationship

        /// All subscription options, including the current option.
        public static let all: Product.SubscriptionRelationship

        /// The type of the elements of an array literal.
        @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
        public typealias ArrayLiteralElement = Product.SubscriptionRelationship

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
        public typealias Element = Product.SubscriptionRelationship

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
        public typealias RawValue = Int
    }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePickerOption {

    /// Create a subscription picker option with a custom label.
    ///
    /// You must declare this as a descendant of a
    /// ``SubscriptionStoreControlStyle/SubscriptionPicker``.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.Option, @ViewBuilder label: @escaping (SubscriptionStoreControlStyleConfiguration.PickerOption) -> Label)

    /// Create a subscription picker option with the standard label.
    ///
    /// You must declare this as a descendant of a
    /// ``SubscriptionStoreControlStyle/SubscriptionPicker``.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.Option) where Label == AutomaticSubscriptionStorePickerOptionLabel

    /// Create a subscription picker option with the standard label.
    ///
    /// You must declare this as a descendant of a
    /// ``SubscriptionStoreControlStyle/SubscriptionPicker``.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.PickerOption) where Label == AutomaticSubscriptionStorePickerOptionLabel
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyle {

    /// A button for subscribing to an in-app subscription.
    ///
    /// This button is used by standard subscription store control styles. If you implement a custom
    /// subscription store control style, you can use this button as part of your style by providing a
    /// `SubscriptionStoreControlStyle.Configuration.Option`` value.
    ///
    /// On iOS, macOS and watchOS you can configure the label of the button by modifying it with
    /// `subscriptionStoreButtonLabel(_:)`. Some button label configurations cause the button
    /// to have a caption, for example: `.displayName.singleLine`.
    ///
    /// You can configure the button's style by modifying it with `buttonStyle(_:)`.
    ///
    /// You only use this button directly when implementing a `SubscriptionStoreControlStyle`.
    public typealias SubscribeButton = SubscriptionStoreButton
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductIconPhase {

    /// The promotional image if the loading task was successful.
    ///
    /// Use this as a convenience to access the product value in code that doesn't depend on the reason
    /// the icon can't be accessed. The value is `nil` while the icon is loading, or if the icon
    /// can't be accessed for any reason.
    public var promotionalIcon: Image? { get }

    /// The error if the loading task was unsuccessful.
    ///
    /// Use this as a convenience to access the error value in code that assumes there has
    /// been a promotional image set up for the product in App Store Connect. The value is `nil`
    /// while the icon is loading, if the icon has successfully loaded, or if the promotional image
    /// for the product has not been set up in App Store Connect.
    public var error: (any Error)? { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreButton {

    /// Creates a button that with an automatic label describing the subscription option, beginning a
    /// subscribe interaction when someone triggers the button.
    @MainActor @preconcurrency public init(_ option: SubscriptionStoreControlStyleConfiguration.Option)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    nonisolated public func subscriptionOfferViewButtonVisibility(_ visibility: Visibility, for buttonKinds: SubscriptionOfferViewButtonKind...) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStoreControlStyle {

    /// A composite control for selecting an option from a subscription group and confirming the selected
    /// subscription.
    ///
    /// To use a subscription picker, first declare a type conforming to
    /// ``SubscriptionStoreControlStyle``. You use this view as a component of the view you
    /// provide from ``makeBody(configuration:)``.
    ///
    /// There are two primary ways to create a subscription picker within your custom control style:
    /// + Provide the ``Configuration`` value to the subscription picker, and use the components of
    ///   each option to declare the option's label.
    /// + Provide a collection of views for the picker's content, using a ``SubscriptionPickerOption``
    ///   to declare the control for each option.
    ///
    /// Either way, you must also declare a view to confirm the subscription, after someone finishes
    /// selecting an option. You can optionally provide a binding to a ``Configuration.Option`` to
    /// respond to selection changes or programmatically change the selection.
    ///
    /// - Important: The subscription picker must be a descendant of a subscription store view.
    public typealias SubscriptionPicker = SubscriptionStorePicker
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePicker {

    /// Creates a subscription picker.
    ///
    /// Use ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` within
    /// `pickerContent` for each subscription option provided to your control style's
    /// ``SubscriptionStoreControlStyle/makeBody(configuration:)`` method. 
    /// You can use `Section` to group options and provide header and footer content between options.
    @MainActor @preconcurrency public init(@ViewBuilder pickerContent: () -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)

    /// Creates a subscription picker that creates a view for each option in the provided configuration.
    ///
    /// In `pickerOptionContent`, declare the label for each subscription option. To create a label
    /// composed of the standard picker option label, declare a
    /// ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` providing only the
    /// ``SubscriptionStoreControlStyle/Configuration/PickerOption`` value.
    @MainActor @preconcurrency public init(_ configuration: SubscriptionStoreControlStyleConfiguration, @ViewBuilder pickerOptionContent: @escaping (SubscriptionStoreControlStyleConfiguration.PickerOption) -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)

    /// Creates a subscription picker with a binding to observe and control selection.
    ///
    /// Providing the binding is optional, if you choose not to provide the binding the view will manage its
    /// selection state internally.
    ///
    /// Use ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` within
    /// `pickerContent` for each subscription option provided to your control style's
    /// ``SubscriptionStoreControlStyle/makeBody(configuration:)`` method.
    /// You can use `Section` to group options and provide header and footer content between options.
    @MainActor @preconcurrency public init(selection: Binding<SubscriptionStoreControlStyleConfiguration.Option?>, @ViewBuilder pickerContent: () -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)

    /// Creates a subscription picker that creates a view for each option in the provided configuration.
    ///
    /// Providing the binding is optional, if you choose not to provide the binding the view will manage its
    /// selection state internally.
    ///
    /// In `pickerOptionContent`, declare the label for each subscription option. To create a label
    /// composed of the standard picker option label, declare a
    /// ``SubscriptionStoreControlStyle/SubscriptionPickerOption`` providing only the
    /// ``SubscriptionStoreControlStyle/Configuration/PickerOption`` value.
    @MainActor @preconcurrency public init(_ configuration: SubscriptionStoreControlStyleConfiguration, selection: Binding<SubscriptionStoreControlStyleConfiguration.Option?>, @ViewBuilder pickerOptionContent: @escaping (SubscriptionStoreControlStyleConfiguration.PickerOption) -> PickerContent, @ViewBuilder confirmation: @escaping (SubscriptionStoreControlStyleConfiguration.Option) -> ConfirmationContent)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension View {

    /// Display a merchandising view.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether the App Store merchandising view is presented.
    ///   - kind: The merchandising kind to merchandise.
    ///   - onDismiss: The closure to execute when the merchandising view is dismissed, with the presetation result of the App Store merchandising view provided as a parameter.
    nonisolated public func appStoreMerchandising(isPresented: Binding<Bool>, kind: AppStoreMerchandisingKind, onDismiss: ((Result<AppStoreMerchandisingKind.PresentationResult, any Error>) async -> ())? = nil) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionStoreControlStyle where Self == CompactPickerSubscriptionStoreControlStyle {

    /// A subscription store control style that displays subscription plans as a compact picker control, with a single
    /// button to subscribe.
    ///
    /// This style prefers to layout picker options in a horizontal stack, but can scroll horizontally if the container
    /// width isn't sufficient. It's recommended to only use this style when you expect your store to display two
    /// or three subscription options.
    @MainActor @preconcurrency public static var compactPicker: CompactPickerSubscriptionStoreControlStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 15.0, macOS 14.0, visionOS 1.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Display the refund request sheet for the given transaction.
    /// - Parameters:
    ///   - transactionID: The transaction ID to request a refund for.
    ///   - isPresented: A binding to a Boolean value that determines whether the refund request sheet is presented.
    ///   - onDismiss: The closure to execute when dismissing the sheet, with the result of the refund request provided as a parameter.
    @preconcurrency nonisolated public func refundRequestSheet(for transactionID: Transaction.ID, isPresented: Binding<Bool>, onDismiss: (@MainActor (Result<Transaction.RefundRequestStatus, Transaction.RefundRequestError>) -> ())? = nil) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionSection where Content == Never {

    /// Creates a section of subscription options matching a predicate, with optional header and footer
    /// views.
    /// - Parameters:
    ///   - isIncluded: A predicate indicating which subscription options to include in the section.
    ///   - header: A decorative view to display before the options in the section. You can omit this
    ///             parameter to exclude a header.
    ///   - footer: A decorative view to display after the options in the section. You can omit this
    ///             parameter to exclude a footer.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool, @ViewBuilder header: () -> Header = EmptyView.init, @ViewBuilder footer: () -> Footer = EmptyView.init)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionSection where Header == Text, Content == Never {

    /// Creates a section of subscription options matching a predicate, with a localized title and an optional
    /// footer view.
    /// - Parameters:
    ///   - title: The key for a localized string to display before the section.
    ///   - isIncluded: A predicate indicating which subscription options to include in the section.
    ///   - footer: A decorative view to display after the options in the section. You can omit this
    ///             parameter to exclude a footer.
    @MainActor @preconcurrency public init(_ title: LocalizedStringKey, isIncluded: @escaping (Product) -> Bool, @ViewBuilder footer: () -> Footer = EmptyView.init)

    /// Creates a section of subscription options matching a predicate, with a title and an optional footer
    /// view.
    /// - Parameters:
    ///   - title: A string to display before the section.
    ///   - isIncluded: A predicate indicating which subscription options to include in the section.
    ///   - footer: A decorative view to display after the options in the section. You can omit this
    ///             parameter to exclude a footer.
    @MainActor @preconcurrency public init(_ title: some StringProtocol, isIncluded: @escaping (Product) -> Bool, @ViewBuilder footer: () -> Footer = EmptyView.init)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Declares the view as dependent on an In-App Purchase product and returns a modified view.
    ///
    /// Before a view modified with this method appears, a task will start in the background to load
    /// the product from the App Store. While the view is presented, the task will call `action` whenever
    /// the product changes or the task's state changes.
    ///
    /// - Parameters:
    ///   - id: The product ID to load from the App Store. The task restarts whenever this parameter
    ///         changes.
    ///   - priority: The task priority to use when creating the task.
    ///   - action: The action to perform when the task's state changes.
    nonisolated public func storeProductTask(for id: Product.ID, priority: TaskPriority = .medium, action: @escaping (Product.TaskState) async -> ()) -> some View


    /// Declares the view as dependent on a collection of In-App Purchase products and returns a
    /// modified view.
    ///
    /// Before a view modified with this method appears,  a task will start in the background to load
    /// the products from the App Store. While the view is presented, the task will call `action`
    /// whenever the products change or the task's state changes.
    ///
    /// - Parameters:
    ///   - ids: The product IDs to load from the App Store. The task restarts whenever this
    ///          parameter changes.
    ///   - priority: The task priority to use when creating the task.
    ///   - action: The action to perform when the task's state changes.
    nonisolated public func storeProductsTask(for ids: some Collection<String> & Equatable & Sendable, priority: TaskPriority = .medium, action: @escaping (Product.CollectionTaskState) async -> ()) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension ProductViewStyle where Self == CompactProductViewStyle {

    /// A product view style suitable for layouts where less space is available, or for displaying more items in
    /// a small amount of space.
    ///
    /// On iOS and macOS, the style will grow to fit the available width.
    @MainActor @preconcurrency public static var compact: CompactProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Product.CollectionTaskState {

    /// An array of available products if the task was successful.
    ///
    /// Use this as a convenience to access the products in code that doesn't depend on the reason the
    /// reason a product can't be accessed. The value is `nil` while the task is loading, or if the task fails.
    public var products: [Product]? { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Never : StoreContent {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Optional : StoreContent where Wrapped : StoreContent {

    /// The composition of content that comprise the subscription store view content.
    @MainActor @preconcurrency public var body: Never { get }

    /// The type of content representing the body of this subscription store view content.
    public typealias Body = Never
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Product.TaskState {

    /// The product value if the task was successful.
    ///
    /// Use this as a convenience to access the product value in code that doesn't depend on the reason
    /// the product can't be accessed. The value is `nil` while the product is loading, or if the product
    /// can't be accessed for any reason.
    public var product: Product? { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Product {

    /// The state of a store product task.
    ///
    /// Use `storeProductTask(for:priority:action:)` on a `View` to get a `TaskState`.
    public enum TaskState : Sendable {

        /// The task is loading the product in the background.
        case loading

        /// The product is unavailable in the current storefront.
        case unavailable

        /// The task failed with an error.
        case failure(any Error)

        /// The task successfully loaded the product.
        case success(Product)
    }

    /// The state of a store products task.
    ///
    /// Use `storeProductTask(for:priority:action:)` on a `View` to get a
    /// `CollectionTaskState`.
    public enum CollectionTaskState : Sendable {

        /// The task is loading the products in the background.
        case loading

        /// The task failed with an error.
        case failure(any Error)

        /// The task finished successfully. `unavailable` contains the product IDs which are
        /// unavailable in the current storefront.
        case success([Product], unavailable: [Product.ID])
    }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 14.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Presents a StoreKit overlay when a given condition is true.
    ///
    /// You use `appStoreOverlay` to display an overlay that recommends another
    /// app. The overlay enables users to instantly view the other app’s page on
    /// the App Store.
    ///
    /// When `isPresented` is true, the system will run `configuration` to
    /// determine how to configure the overlay. The overlay will automatically
    /// be presented over the current scene.
    ///
    /// - Parameters:
    ///   - isPresented: A Binding to a boolean value indicating whether the
    ///     overlay should be presented.
    ///   - configuration: A closure providing the configuration of the overlay.
    /// - SeeAlso: SKOverlay.Configuration.
    nonisolated public func appStoreOverlay(isPresented: Binding<Bool>, configuration: @escaping () -> SKOverlay.Configuration) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState : Sendable where Value : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    public var displayStoreKitMessage: DisplayMessageAction { get }
}

// Available when SwiftUI is imported with StoreKit
extension View {

    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func subscriptionOfferViewDetailAction(_ action: (() -> ())?) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Sets a view to use to decorate individual subscription options within a subscription store view.
    ///
    /// You can adjust this view to provide a different appearance for each subscription option.
    ///
    /// - Parameters:
    ///   - icon: A closure that takes a <doc://com.apple.documentation/documentation/storekit/product> and
    ///           <doc://com.apple.documentation/documentation/storekit/product/subscriptioninfo>
    ///           and returns a view.
    nonisolated public func subscriptionStoreControlIcon(@ViewBuilder icon: @escaping (Product, Product.SubscriptionInfo) -> some View) -> some View

}

// Available when SwiftUI is imported with StoreKit
extension StoreContent {

    /// Specifies the visibility of auxiliary buttons that store view and subscription store view instances may use.
    ///
    /// - Parameters:
    ///   - visibility: The preferred visibility of the buttons.
    ///   - buttonKinds: The type of store button.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func storeButton(_ visibility: Visibility, for buttonKinds: StoreButtonKind...) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where MarketingContent == AutomaticSubscriptionStoreMarketingContent {

    /// Creates a group of subscription options matching a predicate, merchandised with
    /// automatic marketing content.
    ///
    /// - Parameters:
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - label: A view that describes the section.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool, @ViewBuilder label: () -> Label) where Content == Never

    /// Creates a group of other subscription option groups, merchandised with
    /// automatic marketing content.
    ///
    /// - Parameters:
    ///   - content: The items representing the content of the subscription store view group.
    ///   - label: A view that describes the section.
    @MainActor @preconcurrency public init(@StoreContentBuilder content: () -> Content, @ViewBuilder label: () -> Label)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == AutomaticSubscriptionOptionGroupLabel {

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameters:
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool, @ViewBuilder marketingContent: () -> MarketingContent) where Content == Never

    /// Creates a group of other subscription option groups.
    ///
    /// - Parameters:
    ///   - content: The items representing the content of the subscription store view group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(@StoreContentBuilder content: () -> Content, @ViewBuilder marketingContent: () -> MarketingContent)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == AutomaticSubscriptionOptionGroupLabel, MarketingContent == AutomaticSubscriptionStoreMarketingContent {

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameter isIncluded: A closure that takes a StoreKit product as its argument and returns
    ///                         a Boolean value indicating whether the product should be included
    ///                         in the group.
    @MainActor @preconcurrency public init(isIncluded: @escaping (Product) -> Bool) where Content == Never

    /// Creates a group of other subscription option groups, merchandised with
    /// automatic marketing content.
    ///
    /// - Parameter content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(@StoreContentBuilder content: () -> Content)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == Text {

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, isIncluded: @escaping (Product) -> Bool, @ViewBuilder marketingContent: () -> MarketingContent) where Content == Never

    /// Creates a group of subscription options matching a predicate.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - marketingContent: A view to display along with the subscribe controls when the group is visible.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, isIncluded: @escaping (Product) -> Bool, @ViewBuilder marketingContent: () -> MarketingContent) where Content == Never

    /// Creates a group of other subscription option groups.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, @StoreContentBuilder content: () -> Content, @ViewBuilder marketingContent: () -> MarketingContent)

    /// Creates a group of other subscription option groups.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    ///   - content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, @StoreContentBuilder content: () -> Content, @ViewBuilder marketingContent: () -> MarketingContent)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroup where Label == Text, MarketingContent == AutomaticSubscriptionStoreMarketingContent {

    /// Creates a group of subscription options matching a predicate, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, isIncluded: @escaping (Product) -> Bool) where Content == Never

    /// Creates a group of subscription options matching a predicate, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, isIncluded: @escaping (Product) -> Bool) where Content == Never

    /// Creates a group of other subscription option groups, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: The key for a localized string that describes the group.
    ///   - content: The items representing the content of the subscription store view group.
    @MainActor @preconcurrency public init(_ label: LocalizedStringKey, @StoreContentBuilder content: () -> Content)

    /// Creates a group of other subscription option groups, merchandised with automatic
    /// marketing content.
    ///
    /// - Parameters:
    ///   - label: A string that describes the group.
    ///   - isIncluded: A closure that takes a StoreKit product as its argument and returns a Boolean
    ///     value indicating whether the product should be included in the group.
    @MainActor @preconcurrency public init(_ label: some StringProtocol, @StoreContentBuilder content: () -> Content)
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Configures a URL as the destination for a policy button action in subscription store views.
    ///
    /// You can also set a view as the destination using
    /// ``subscriptionStorePolicyDestination(for:destination:)``. If you do not set
    /// a destination, or pass `nil` for `url`, the system will use the automatic behavior. Check the
    /// documentation for the value you provide for `button` to understand the automatic behavior.
    ///
    /// By default, the subscription store shows the terms of service & privacy policy buttons if you
    /// set a destination for at least one policy. The policy that is not explicitly set will use the automatic
    /// behavior. You can override this behavior using the
    /// ``storeButton(_:for:)`` modifier, with
    /// <doc://com.apple.documentation/documentation/storekit/storebuttonkind/policies>
    /// as the second parameter.
    ///
    /// - Parameters:
    ///   - url: The URL of the web page to open when someone chooses to view the policy.
    ///   - button: The policy button to associate the URL with.
    @available(tvOS, unavailable)
    nonisolated public func subscriptionStorePolicyDestination(url: URL, for button: SubscriptionStorePolicyKind) -> some View


    /// Configures a view as the destination for a policy button action in subscription store views.
    ///
    /// Except on tvOS, you can also set a URL as the destination using
    /// ``subscriptionStorePolicyDestination(url:for:)``. If you do not set
    /// a destination, the system will use the automatic behavior. Check the documentation for the value
    /// you provide for `button` to understand the automatic behavior.
    ///
    /// By default, the subscription store shows the terms of service & privacy policy buttons if you
    /// set a destination for at least one policy. The policy that is not explicitly set will use the automatic
    /// behavior. You can override this behavior using the
    /// ``storeButton(_:for:)`` modifier, with <doc://com.apple.documentation/documentation/storekit/storebuttonkind/policies>
    /// as the second parameter.
    ///
    /// - Parameters:
    ///   - button: The policy button to associate the URL with.
    ///   - destination: The view to present when someone chooses to view the policy.
    nonisolated public func subscriptionStorePolicyDestination(for button: SubscriptionStorePolicyKind, @ViewBuilder destination: () -> some View) -> some View


    /// Sets the style for the terms of service and privacy policy buttons within a subscription store view.
    nonisolated public func subscriptionStorePolicyForegroundStyle(_ style: some ShapeStyle) -> some View


    /// Sets the primary and secondary style for the terms of service and privacy policy buttons within
    /// a subscription store view.
    ///
    /// - Parameters:
    ///   - primary: The color or pattern to use for the terms of service and privacy policy
    ///     buttons
    ///   - secondary: The color or pattern to use for the conjunction between the buttons
    ///     in the policy section
    nonisolated public func subscriptionStorePolicyForegroundStyle(_ primary: some ShapeStyle, _ secondary: some ShapeStyle) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Specifies the visibility of auxiliary buttons that store view and subscription store view instances may use.
    ///
    /// - Parameters:
    ///   - visibility: The preferred visibility of the buttons.
    ///   - buttonKinds: The type of store button.
    nonisolated public func storeButton(_ visibility: Visibility, for buttonKinds: StoreButtonKind...) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductViewStyle where Self == RegularProductViewStyle {

    /// A product view style using a standard, platform appropriate layout.
    ///
    /// On tvOS, the style will grow to fit the available width.
    @MainActor @preconcurrency public static var regular: RegularProductViewStyle { get }
}

// Available when SwiftUI is imported with StoreKit
extension PurchaseAction {

    @available(iOS 18.4, tvOS 18.4, macOS 15.4, watchOS 11.4, visionOS 2.4, *)
    @MainActor @preconcurrency public func callAsFunction(_ advancedCommerceProduct: AdvancedCommerceProduct, compactJWS: String, options: Set<AdvancedCommerceProduct.PurchaseOption> = []) async throws -> AdvancedCommerceProduct.PurchaseResult
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, tvOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
extension EnvironmentValues {

    /// An action that starts an in-app purchase.
    ///
    /// Read this environment value to get an ``PurchaseAction``
    /// instance for a given ``Environment``. Call the
    /// instance to start an in-app purchase. You call the instance directly because it
    /// defines a ``PurchaseAction/callAsFunction(_:options:)`` method that Swift
    /// calls when you call the instance.
    ///
    /// For example, you can start an in-app purchase when the user taps a button:
    ///
    ///     struct PurchaseExample: View {
    ///         @Environment(\.purchase) private var purchase
    ///         let product: Product
    ///         let purchaseOptions: [Product.PurchaseOption]
    ///
    ///         var body: some View {
    ///             Button {
    ///                 Task {
    ///                     let purchaseResult = try? await purchase(product, options: purchaseOptions)
    ///                     // Process purchase result.
    ///                 }
    ///             } label: {
    ///                 Text(product.displayName)
    ///             }
    ///         }
    ///     }
    @MainActor @preconcurrency public var purchase: PurchaseAction { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, visionOS 1.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension View {

    /// Adds a standard border to an in-app purchase product's icon .
    ///
    /// You may want to use this on an icon provided to a ``ProductView`` or ``StoreView``.
    nonisolated public func productIconBorder() -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Configure the visibility of labels displaying an in-app purchase product description within the view.
    nonisolated public func productDescription(_ visibility: Visibility) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StoreContent {

    /// Configure the visibility of labels displaying subscription's description within the content.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @MainActor @preconcurrency public func productDescription(_ visibility: Visibility) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState {

    /// The entitlement value if the task was successful.
    ///
    /// Use this as a convenience to access the entitlement value in code that doesn't depend on the
    /// reason the value can't be accessed. The value is `nil` while the value is loading, or if it fails to
    /// load for any reason.
    public var value: Value? { get }
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 15.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    nonisolated public func manageSubscriptionsSheet(isPresented: Binding<Bool>) -> some View


    @available(iOS 17.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func manageSubscriptionsSheet(isPresented: Binding<Bool>, subscriptionGroupID: String) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {

    /// Sets the style for In-App Purchase product views within a view.
    ///
    /// This modifier styles any <doc://com.apple.documentation/documentation/storekit/productview>
    /// or <doc://com.apple.documentation/documentation/storekit/storeview>
    /// instances within a view.
    ///
    /// - Parameters:
    ///   - style: The style to apply to the in-app purchase product views within the view.
    nonisolated public func productViewStyle(_ style: some ProductViewStyle) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, watchOS 10.0, visionOS 1.0, *)
@available(tvOS, unavailable)
extension View {

    /// Configures subscription store view instances within a view to use the provided button label.
    ///
    /// The button label is not always respected in every context. For example, if you have a subscription
    /// store that shows multiple subscribe buttons, setting
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstorebuttonlabel/action-swift.type.property>
    /// as the button label will fall back to each subscription's display name.
    nonisolated public func subscriptionStoreButtonLabel(_ label: SubscriptionStoreButtonLabel) -> some View

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension StoreContent {

    /// Configures subscription store view instances within a view to use the provided button label.
    ///
    /// The button label is not always respected in every context. For example, if you have a subscription
    /// store that shows multiple subscribe buttons, setting
    /// <doc://com.apple.documentation/documentation/storekit/subscriptionstorebuttonlabel/action-swift.type.property>
    /// as the button label will fall back to each subscription's display name.
    @available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
    nonisolated public func subscriptionStoreButtonLabel(_ label: SubscriptionStoreButtonLabel) -> some StoreContent

}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EntitlementTaskState {

    /// Returns a new state, mapping the entitlement value if successful.
    public func map<NewValue>(_ transform: (Value) throws -> NewValue) rethrows -> EntitlementTaskState<NewValue>

    /// Returns a new state, mapping the entitlement value if successful.
    public func map<NewValue>(_ transform: (Value) async throws -> NewValue) async rethrows -> EntitlementTaskState<NewValue>

    /// Returns a new state, mapping the entitlement value if successful.
    public func flatMap<NewValue>(_ transform: (Value) throws -> EntitlementTaskState<NewValue>) rethrows -> EntitlementTaskState<NewValue>

    /// Returns a new state, mapping the entitlement value if successful.
    public func flatMap<NewValue>(_ transform: (Value) async throws -> EntitlementTaskState<NewValue>) async rethrows -> EntitlementTaskState<NewValue>
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension ProductView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SubscriptionOfferView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PagedProminentPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension AutomaticSubscriptionStorePickerOptionLabel : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension AutomaticProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension SubscriptionStoreView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension PagedPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionOptionGroupSet : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension AutomaticSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, watchOS 11.0, visionOS 2.0, *)
@available(tvOS, unavailable)
extension SubscriptionStorePickerOption : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreButton : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension RegularProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CompactPickerSubscriptionStoreControlStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension AutomaticSubscriptionStoreMarketingContent : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension AutomaticSubscriptionOptionGroupLabel : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 16.0, visionOS 1.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension RequestReviewAction : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreContentView : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Icon : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Section.Header : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubscriptionStoreControlStyleConfiguration.Section.Footer : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension SubscriptionStoreControlStyleConfiguration.MarketingContent : Sendable {
}

// Available when SwiftUI is imported with StoreKit
@available(iOS 17.0, macOS 14.0, visionOS 1.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension LargeProductViewStyle : Sendable {
}

// Available when SwiftUI is imported with StoreKit
extension View {

    /// Presents a sheet that enables customers to redeem offer
    /// codes that you configure in App Store Connect.
    ///
    /// The ``offerCodeRedemption(isPresented:onCompletion:)`` method displays a system sheet
    /// where customers can enter and redeem offer codes. If you generate
    /// offer codes in App Store Connect, call this function to enable customers to redeem the offer. To
    /// display the sheet using UIKit, see ``presentOfferCodeRedeemSheet(in:)``.
    ///
    /// - Important: Set up offer codes in App Store Connect before calling this API.
    ///              Customers can only redeem these offers in your app through the redemption
    ///              sheet; don’t use a custom UI.
    ///              For more information, see <doc://com.apple.documentation/documentation/storekit/appstore/supporting_subscription_offer_codes_in_your_app>.
    ///
    /// The following code example shows a view that displays the offer code redemption sheet
    /// upon a button press:
    ///
    ///     import SwiftUI
    ///     import StoreKit
    ///
    ///     struct ContentView: View {
    ///         @State private var redeemSheetIsPresented = false
    ///
    ///         var body: some View {
    ///             Button("Present offer code redemption sheet.") {
    ///                 redeemSheetIsPresented = true
    ///             }
    ///             .offerCodeRedemption(isPresented: $redeemSheetIsPresented) { result in
    ///                 // Handle result
    ///             }
    ///         }
    ///     }
    ///
    /// When customers redeem an offer code, StoreKit emits the resulting transaction in
    /// <doc://com.apple.documentation/documentation/storekit/transaction/updates>.
    /// Set up a transaction listener as soon as your app launches to receive new transactions
    /// while the app is running.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether the system
    ///                  displays the sheet. You set the Boolean value to true to cause the
    ///                  system to display the sheet. The system sets it to false when it
    ///                  dismisses the sheet.
    ///   - onCompletion: A closure that returns the result of the presentation.
    ///                   In Mac apps built with Mac Catalyst, the completion handler returns
    ///                   a failure with an error prior to macOS 15.
    @available(iOS, introduced: 16.0, deprecated: 27.0, message: "Use `offerCodeRedemption(options:isPresented:onCompletion:)` instead.")
    @available(macOS, introduced: 15.0, deprecated: 27.0, message: "Use `offerCodeRedemption(options:isPresented:onCompletion:)` instead.")
    @available(macCatalyst, introduced: 16.0, deprecated: 27.0, message: "Use `offerCodeRedemption(options:isPresented:onCompletion:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 27.0, message: "Use `offerCodeRedemption(options:isPresented:onCompletion:)` instead.")
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func offerCodeRedemption(isPresented: Binding<Bool>, onCompletion: @escaping @MainActor (Result<Void, any Error>) -> Void = { _ in }) -> some View


    /// Presents a sheet that enables customers to redeem offer
    /// codes that you configure in App Store Connect.
    ///
    /// The ``offerCodeRedemption(options:isPresented:onCompletion:)`` method displays a system sheet
    /// where customers can enter and redeem offer codes. If you generate
    /// offer codes in App Store Connect, call this method to enable customers to redeem the offer. To
    /// display the sheet using UIKit, see ``presentOfferCodeRedeemSheet(from:options:)``.
    ///
    /// - Important: Set up offer codes in App Store Connect before calling this API.
    ///              Customers can only redeem these offers in your app through the redemption
    ///              sheet; don’t use a custom UI.
    ///              For more information, see <doc://com.apple.documentation/documentation/storekit/appstore/supporting_subscription_offer_codes_in_your_app>.
    ///
    /// The following code example shows a view that displays the offer code redemption sheet
    /// when the customer taps a button:
    ///
    ///     import SwiftUI
    ///     import StoreKit
    ///
    ///     struct ContentView: View {
    ///         @State private var redeemSheetIsPresented = false
    ///
    ///         var body: some View {
    ///             Button("Present offer code redemption sheet.") {
    ///                 redeemSheetIsPresented = true
    ///             }
    ///             .offerCodeRedemption(
    ///                 options: [],
    ///                 isPresented: $redeemSheetIsPresented
    ///             ) { result in
    ///                 // Handle result
    ///             }
    ///         }
    ///     }
    ///
    /// When the customer successfully redeems an offer code, the system delivers the resulting
    /// transaction through `onCompletion`, as a ``VerificationResult`` that wraps the ``Transaction``.
    ///
    /// - Parameters:
    ///   - options: A set of ``AppStore/RedeemOption`` values that configure the code redemption.
    ///   - isPresented: A binding to a Boolean value that determines whether the system
    ///                  displays the sheet. You set the Boolean value to `true` to cause the
    ///                  system to display the sheet. The system sets it to `false` when it
    ///                  dismisses the sheet.
    ///   - onCompletion: A closure the system calls with the result of the redemption. On success,
    ///                   the closure receives a ``VerificationResult`` containing the
    ///                   ``Transaction`` that the redemption produces. On failure, it receives the
    ///                   error that caused the redemption to fail.
    @available(iOS 27.0, macOS 27.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func offerCodeRedemption(options: Set<RedeemOption>, isPresented: Binding<Bool>, onCompletion: @escaping @MainActor (Result<VerificationResult<Transaction>, any Error>) -> Void) -> some View

}


