import Foundation
import StoreKit

@available(iOS 15.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
@objc public class RvmExternalPurchase : NSObject {
    private override init() {
    }
    
    /// Whether the app can present the external notice sheet.
    ///
    /// Check this property before showing any UI for external purchases
    /// Check the value of this property again and update your UI if
    /// `Storefront.current` changes.
    /// - Important: If this property is `false`, do not call `presentNoticeSheet()` as the method
    ///              will always fail.
    @available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
    @objc public static func canPresent(completionHandler: @escaping (Bool) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await ExternalPurchase.canPresent) }.toRvm()
    }

    /// Present a notice sheet to users before showing external purchases.
    ///
    /// Only call this method as a result of deliberate user interaction, such as tapping a button.
    /// - Returns: Whether the user chose to continue to view the external purchases. Only show
    ///            external purchases if the result is `NoticeResult.continuedWithExternalPurchaseToken`
    ///            or `NoticeResult.continued`.
    /// - Throws: A `StoreKitError`
    @objc public static func presentNoticeSheet(completionHandler: @escaping (RvmExternalPurchase.NoticeResult?, Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await ExternalPurchase.presentNoticeSheet().toRvm(), nil)
            } catch let error {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
    
    @objc(RvmExternalPurchase_NoticeResult)
    public class NoticeResult: NSObject {
        private override init() {}
        
        /// The user chose to cancel and **not** view external purchases.
        @objc(RvmExternalPurchase_NoticeResult_Canceled)
        public class Canceled: NoticeResult {
            fileprivate override init() { }
        }
        @objc public static let canceled = Canceled()

        /// The user chose to continue to view external purchases.
        @available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
        @objc(RvmExternalPurchase_NoticeResult_Continued)
        public class Continued: NoticeResult {
            @objc public let externalPurchaseToken: String
            init(externalPurchaseToken: String) {
                self.externalPurchaseToken = externalPurchaseToken
            }
            public override func isEqual(_ object: Any?) -> Bool {
                return if let other = object as? Continued { self.externalPurchaseToken == other.externalPurchaseToken } else { false }
            }

            public override var hash: Int { return externalPurchaseToken.hashValue }
        }
    }
}

