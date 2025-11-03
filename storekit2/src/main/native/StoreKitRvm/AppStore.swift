import Foundation
import StoreKit


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


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
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
    @available(iOS 16.0, visionOS 1.0, *)
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
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmAppStore {
    @available(iOS 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc @MainActor public static func requestReview(in scene: UIWindowScene) { AppStore.requestReview(in: scene) }
}


///
/// Rvm extension to keep constants 
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmAppStore {
    @objc static public let StoreKitErrorDomain: String = "RvmStoreKit.StoreKitErrorDomain"
}
