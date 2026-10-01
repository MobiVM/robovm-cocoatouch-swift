import Foundation
import StoreKit

// MARK: Shared converters

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Error {
    func toRvmError() -> Error {
        switch self {
        case let e as VerificationResult<Any>.VerificationError: return e.toRvm()
        case let e as Transaction.RefundRequestError: return e.toRvm()
        case let e as Product.PurchaseError: return e.toRvm()
        case let e as StoreKitError: return e.toRvm()
        default:
            if #available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *),
               let e = self as? InvalidRequestError {
                return NSError(
                    domain: RvmAppStore.InvalidRequestErrorDomain,
                    code: Int(e.code),
                    userInfo: [
                        NSLocalizedDescriptionKey: e.message,
                        "StoreKitCode": NSNumber(value: e.code)
                    ]
                )
            }
            if #available(iOS 16.4, *) {
                if let e = self as? PaymentMethodBinding.PaymentMethodBindingError {
                    return e.toRvm()
                }
            }
            return self
        }
    }
}
