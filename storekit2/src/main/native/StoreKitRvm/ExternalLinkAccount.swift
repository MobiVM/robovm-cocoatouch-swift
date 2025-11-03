import StoreKit

@available(iOS 16.0, tvOS 16.4, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
@objc public class RvmExternalLinkAccount: NSObject{
    private override init() {
    }

    /// Whether the app can open the external link account.
    ///
    /// Check this property before showing any UI controls that the user can use to open the external link
    /// account.
    /// You may want to check the value of this property again when the App Store storefront changes.
    /// - Important: If this property is `false`, do not show UI controls that call `open()` as the
    ///              method will always fail.
    @objc public static func canOpen(completionHandler: @escaping (Bool) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await ExternalLinkAccount.canOpen) }.toRvm()
    }

    /// Opens the external link account in the user's default browser.
    ///
    /// Only call this method as a result of deliberate user interaction, such as tapping a button. If
    /// `canOpen` is `false`, this method will always throw an error. Returning without throwing an error
    /// does not guarantee the user was redirected to the external link account.
    /// - Throws: A `StoreKitError`
    @objc public static func open(completionHandler: @escaping (Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                try await ExternalLinkAccount.open()
                completionHandler(nil)
            } catch let error {
                completionHandler(error.toRvmError())
            }
            return
        }.toRvm()
    }
}
