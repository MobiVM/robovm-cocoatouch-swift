import Foundation
import StoreKit
import UIKit


/// Contains properties and methods to facilitate interactions between your app and the App Store.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc(RvmAppStore)
public class RvmAppStore: NSObject {
    
    @objc public static var canMakePayments: Bool { return AppStore.canMakePayments }
    
    /// Identifies the current device to help detect fraud.
    ///
    /// To verify a `Transaction` or `Product.SubscriptionInfo.RenewalInfo` is valid for
    /// the current device:
    /// * Append the lowercased UUID string representation of this property after the lowercased UUID
    /// string representation of `deviceVerificationNonce`
    /// * Compute the SHA-384 hash of the appended UUID strings
    /// * Verify the SHA-384 digest is equal to the `deviceVerification` property
    @objc public static var deviceVerificationID: UUID? { return AppStore.deviceVerificationID}
    
    private override init() {
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmAppStore {
    /// Sync signed transaction and renewal info with the App Store.
    ///
    /// StoreKit automatically keeps signed transaction and renewal info up to date, so this should only be
    /// used if the user indicates they are missing access to a product they have already purchased.
    /// - Important: This will prompt the user to authenticate, only call this function on user interaction.
    /// - Throws: If the user does not authenticate successfully, or if StoreKit cannot connect to the
    ///           App Store.
    @objc public static func sync(completionHandler: @escaping (Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                try await AppStore.sync()
                completionHandler(nil)
            } catch let error {
                completionHandler(error.toRvmError())
            }
            return
        }.toRvm()
    }
}

@available(iOS 15.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RvmAppStore {
    @available(iOS 15.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc public static func showManageSubscriptions(in scene: UIWindowScene, completionHandler: @escaping (Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                try await AppStore.showManageSubscriptions(in: scene)
                completionHandler(nil)
            } catch let error {
                completionHandler(error.toRvmError())
            }
            return
        }.toRvm()
    }

    @available(iOS 17.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc public static func showManageSubscriptions(
        in scene: UIWindowScene, subscriptionGroupID: String, completionHandler: @escaping (Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                try await AppStore.showManageSubscriptions(in: scene, subscriptionGroupID: subscriptionGroupID)
                completionHandler(nil)
            } catch let error {
                completionHandler(error.toRvmError())
            }
            return
        }.toRvm()
    }
}


extension RvmAppStore {

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
    ///   - Throws: `StoreKitError`
    @available(iOS, introduced: 16.0, deprecated: 27.0, message: "Use `presentOfferCodeRedeemSheet(from:options:)` instead.")
    @available(macCatalyst, introduced: 16.0, deprecated: 27.0, message: "Use `presentOfferCodeRedeemSheet(from:options:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 27.0, message: "Use `presentOfferCodeRedeemSheet(from:options:)` instead.")
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc public static func presentOfferCodeRedeemSheet(
        in scene: UIWindowScene,
        completionHandler: @escaping (Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                try await AppStore.presentOfferCodeRedeemSheet(in: scene)
                completionHandler(nil)
            } catch let error {
                completionHandler(error.toRvmError())
            }
            return
        }.toRvm()
    }

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
    @objc @MainActor public static func presentOfferCodeRedeemSheet(
        from viewController: UIViewController,
        options: Set<RvmRedeemOption> = [],
        completionHandler: @escaping (VerificationResultTransaction?, Error?) -> Void
    ) -> RvmTask {
        Task {
            do {
                let rawOptions = Set(options.map { $0.raw })
                let result = try await AppStore.presentOfferCodeRedeemSheet(
                    from: viewController,
                    options: rawOptions
                )
                completionHandler(result.toRvm(), nil)
            } catch {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
}


extension RvmAppStore {
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
    @objc @MainActor public static func presentMerchandising(
        _ kind: RvmAppStoreMerchandisingKind,
        from controller: UIViewController,
        completionHandler: @escaping (RvmAppStoreMerchandisingKind.PresentationResult?, Error?) -> Void
    ) -> RvmTask {
        Task {
            do {
                let result = try await AppStore.presentMerchandising(kind.toRaw(), from: controller)
                completionHandler(result.toRvm(), nil)
            } catch {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmAppStore {
    @available(iOS 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc @MainActor public static func requestReview(in scene: UIWindowScene) { AppStore.requestReview(in: scene) }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension RvmAppStore {
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc(RvmAppStore_Platform)
    public final class Platform: NSObject {
        let raw: AppStore.Platform
        init(raw: AppStore.Platform) { self.raw = raw }
        @objc public var rawValue: String { raw.rawValue }
        @objc public init(rawValue: String) { raw = AppStore.Platform(rawValue: rawValue) }
        public override func isEqual(_ object: Any?) -> Bool { (object as? Platform)?.raw == raw }
        public override var hash: Int { raw.hashValue }
        @objc public static var iOS: Platform { AppStore.Platform.iOS.toRvm() }
        @objc public static var macOS: Platform { AppStore.Platform.macOS.toRvm() }
        @objc public static var tvOS: Platform { AppStore.Platform.tvOS.toRvm() }
        @objc public static var visionOS: Platform { AppStore.Platform.visionOS.toRvm() }
        @objc public static var managed: Platform { AppStore.Platform.managed.toRvm() }
    }
}

extension RvmAppStore {
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
    @objc public static func ageRatingCode(completionHandler: @escaping (NSNumber?) -> Void) -> RvmTask {
        Task.detached {
            let code = await AppStore.ageRatingCode
            completionHandler(code.map(NSNumber.init(value:)))
            return
        }.toRvm()
    }
}

///
/// Rvm extension to keep constants 
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmAppStore {
    @objc static public let StoreKitErrorDomain: String = "RvmStoreKit.StoreKitErrorDomain"

    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc public static let InvalidRequestErrorDomain = "RvmStoreKit.InvalidRequestErrorDomain"

}

// MARK: Converters

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AppStore.Platform {
    func toRvm() -> RvmAppStore.Platform { RvmAppStore.Platform(raw: self) }
}
