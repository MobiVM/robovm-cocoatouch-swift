import Foundation
import StoreKit

@available(iOS 18.1, macOS 15.1, tvOS 18.1, watchOS 11.1, visionOS 2.1, *)
@objc public class RvmExternalPurchaseCustomLink : NSObject {
    private override init() { }
    
    /// The result of presenting the external purchase notice sheet.
    @objc(RvmExternalPurchaseCustomLink_NoticeResult)
    public enum NoticeResult : Int {
        case unknown = -1

        /// The user chose to cancel and **not** view external purchases.
        case cancelled

        /// The user chose to continue to view external purchases.
        case continued
    }

    /// How the impression result will be displayed to the user.
    @objc(RvmExternalPurchaseCustomLink_NoticeType)
    public enum NoticeType : Int {
        case unknown = -1
        
        /// The link out will happen inside the app.
        case withinApp

        /// The link out will happen in a browser and leave the app.
        case browser
    }

    /// The external link token to use for reporting sales.
    @objc(RvmExternalPurchaseCustomLink_Token)
    public class Token : NSObject {
        let raw: ExternalPurchaseCustomLink.Token
        init(raw: ExternalPurchaseCustomLink.Token) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Token { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }

        @objc public var value: String { get{ raw.value } }
    }

    /// Whether the app can open an external link.
    ///
    /// Check this property before showing any UI controls that the user can use to open the external link.
    /// Check the value of this property again and update your UI if `Storefront.current` changes.
    /// - Important: If this property is `false`, any methods to show UI or generate
    ///              an external link token method will always fail.
    @objc public static func isEligible(completionHandler: @escaping (Bool) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await ExternalPurchaseCustomLink.isEligible ) }.toRvm()
    }

    /// Opens the user notice sheet.
    ///
    /// This method provides a result of the user interaction to determine
    /// if the external link should be opened or not.
    /// Only call this method as a result of deliberate user interaction, such as tapping a button.
    /// If `isEligible` is `false`, this method will always fail.
    /// - Parameters:
    ///   - type: The type of notice that will be shown to the user.
    /// - Throws: A `StoreKitError`.
    @objc public static func showNotice(
        type: RvmExternalPurchaseCustomLink.NoticeType,
        completionHandler: @escaping (RvmExternalPurchaseCustomLink.NoticeResult, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await ExternalPurchaseCustomLink.showNotice(type: type.toRaw()).toRvm(), nil)
            } catch let error {
                completionHandler(RvmExternalPurchaseCustomLink.NoticeResult.unknown, error.toRvmError())
            }
            return
        }.toRvm()
    }

    /// Returns an external link token of the specified type.
    ///
    /// If `isEligible` is `false`, this method will always fail.
    /// - Parameters:
    ///   - tokenType: The type of token to generate.
    ///           Consult the Apple Developer Documentation for more information on which types of tokens are accepted.
    /// - Throws: A `StoreKitError`.
    @objc public static func token(
        for tokenType: String,
        completionHandler: @escaping (RvmExternalPurchaseCustomLink.Token?, Error?) -> Void
    ) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await ExternalPurchaseCustomLink.token(for: tokenType)?.toRvm(), nil)
            } catch let error {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
}


