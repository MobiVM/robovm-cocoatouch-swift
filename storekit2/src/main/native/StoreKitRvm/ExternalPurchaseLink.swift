import Foundation
import StoreKit

@available(iOS 15.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
@objc public class RvmExternalPurchaseLink : NSObject {
    private override init() {}
    
    /// Whether the app can open the external link.
    ///
    /// Check this property before showing any UI controls that the user can use to open the external link
    /// Check the value of this property again and update your UI if `Storefront.current` changes.
    /// - Important: If this property is `false`, do not show UI controls that call `open()` as the
    ///              method will always fail.
    @objc public static func canOpen(completionHandler: @escaping (Bool) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await ExternalPurchaseLink.canOpen) }.toRvm()
    }

    @available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.2, *)
    @objc public static func eligibleURLs(completionHandler: @escaping ([URL]?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await ExternalPurchaseLink.eligibleURLs) }.toRvm()
    }

    /// Opens the external link in the user's default browser.
    ///
    /// Only call this method as a result of deliberate user interaction, such as tapping a button. If
    /// `canOpen` is `false`, this method will always fail. This method does not guarantee
    /// the user was redirected to the external link if an error is not thrown.
    /// - Throws: A `StoreKitError`
    @objc public static func open(completionHandler: @escaping (Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                try await ExternalPurchaseLink.open()
                completionHandler(nil)
            } catch let error {
                completionHandler(error.toRvmError())
            }
            return
        }.toRvm()
    }

    @available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.2, *)
    @objc public static func open(url: URL, completionHandler: @escaping (Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                try await ExternalPurchaseLink.open(url: url)
                completionHandler(nil)
            } catch let error {
                completionHandler(error.toRvmError())
            }
            return
        }.toRvm()
    }
}
