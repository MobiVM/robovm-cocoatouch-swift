import Foundation
import StoreKit

/// Binds a third-party payment method to a user's App Store account.
@available(iOS 16.4, visionOS 1.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@objc public class RvmPaymentMethodBinding: NSObject {
    let raw: PaymentMethodBinding
    init(raw: PaymentMethodBinding) {
        self.raw = raw
    }

    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmPaymentMethodBinding { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }

    @available(iOS 16.4, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @objc(RvmPaymentMethodBinding_PaymentMethodBindingError)
    public enum PaymentMethodBindingError: Int {
        case unknown = -1
        case notEligible
        case invalidPinningID
        case failed
    }

    @objc public static let PaymentMethodBindingErrorDomainRvm: String = "RvmPaymentMethodBinding.PaymentMethodBindingErrorDomain"

    ///The `inAppPinningId` returned from your server
    @objc public var id: String { raw.id }

    /// Check binding eligibility and initialize the `PaymentMethodBinding`.
    ///
    /// - Parameter id: The `inAppPinningId` returned from your server.
    /// - Throws: An error if StoreKit is unable to check if the user is eligible or if the user is not eligible to bind a third party payment method.
    @objc public static func create(id: String, completionHandler: @escaping (RvmPaymentMethodBinding?, Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(RvmPaymentMethodBinding(raw: try await PaymentMethodBinding(id: id)), nil)
            } catch let e {
                completionHandler(nil, e.toRvmError())
            }
            return
        }.toRvm()
    }

    /// Bind the payment method to the user's App Store account.
    ///
    /// - Throws: An error if the bind process fails.
    @objc public func bind(completionHandler: @escaping (Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                try await self.raw.bind()
                completionHandler(nil)
            } catch let e {
                completionHandler(e.toRvmError())
            }
            return
        }.toRvm()
    }
}

