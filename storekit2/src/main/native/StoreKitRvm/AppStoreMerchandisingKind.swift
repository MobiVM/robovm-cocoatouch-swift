import Foundation
import StoreKit

/// A merchandising kind to display in a merchandising view.
@available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
@objc(RvmAppStoreMerchandisingKind)
public final class RvmAppStoreMerchandisingKind: NSObject {
    let raw: AppStoreMerchandisingKind
    init(raw: AppStoreMerchandisingKind) { self.raw = raw }

    /// The result of the App Store merchandising presentation.
    @available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @objc(RvmAppStoreMerchandisingKind_PresentationResult)
    public class PresentationResult: NSObject {
        let raw: AppStoreMerchandisingKind.PresentationResult?
        fileprivate init(raw: AppStoreMerchandisingKind.PresentationResult?) { self.raw = raw }

        public override func isEqual(_ object: Any?) -> Bool {
            guard let other = object as? PresentationResult else { return false }
            if let completed = self as? purchaseCompleted {
                guard let otherCompleted = other as? purchaseCompleted else { return false }
                return completed.purchaseResult == otherCompleted.purchaseResult
            }
            if case .dismissed? = raw, case .dismissed? = other.raw { return true }
            return self === other
        }

        public override var hash: Int {
            if let completed = self as? purchaseCompleted {
                return completed.purchaseResult.hashValue
            }
            if case .dismissed? = raw { return 0 }
            return super.hash
        }

        /// The App Store merchandising view was dismissed.
        @objc public static let dismissed = PresentationResult(raw: .dismissed)

        /// The App Store merchandising view resulted in a purchase.
        @available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
        @available(watchOS, unavailable)
        @available(visionOS, unavailable)
        @objc(RvmAppStoreMerchandisingKind_PresentationResult_purchaseCompleted)
        public class purchaseCompleted: PresentationResult {
            @objc public let purchaseResult: RvmProduct.PurchaseResult

            init(purchaseResult: Product.PurchaseResult) {
                self.purchaseResult = purchaseResult.toRvm()
                super.init(raw: .purchaseCompleted(purchaseResult))
            }
        }

        @objc public static let unknown = PresentationResult(raw: nil)

        @objc public override var description: String {
            switch self {
            case PresentationResult.dismissed:
                return "Merchandising view dismissed"
            case is PresentationResult.purchaseCompleted:
                return "Merchandising purchase completed"
            default:
                return "Unknown merchandising presentation result"
            }
        }
    }

    /// Merchandise subscription bundle products in a subscription group.
    ///
    /// The group identifier must belong to a subscription bundle group.
    ///
    /// - Parameters:
    ///   - groupID: The subscription group identifier to merchandise in an App Store merchandising view.
    @objc public static func subscriptionBundle(_ groupID: String) -> RvmAppStoreMerchandisingKind {
        AppStoreMerchandisingKind.subscriptionBundle(groupID).toRvm()
    }
}

// MARK: Converters

@available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension AppStoreMerchandisingKind {
    func toRvm() -> RvmAppStoreMerchandisingKind { RvmAppStoreMerchandisingKind(raw: self) }
}


@available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension RvmAppStoreMerchandisingKind {
    func toRaw() -> AppStoreMerchandisingKind { raw }
}


@available(iOS 26.0, tvOS 26.0, macOS 26.2, *)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension AppStoreMerchandisingKind.PresentationResult {
    func toRvm() -> RvmAppStoreMerchandisingKind.PresentationResult {
        switch self {
        case .dismissed:
            return RvmAppStoreMerchandisingKind.PresentationResult.dismissed
        case .purchaseCompleted(let result):
            return RvmAppStoreMerchandisingKind.PresentationResult.purchaseCompleted(
                purchaseResult: result
            )
        @unknown default:
            return RvmAppStoreMerchandisingKind.PresentationResult(raw: self)
        }
    }
}
