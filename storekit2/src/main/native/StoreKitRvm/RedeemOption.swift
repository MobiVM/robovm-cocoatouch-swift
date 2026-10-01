import Foundation
import StoreKit

/// An option that customizes the behavior of an offer code redemption.
///
/// Pass a set of these values to ``AppStore/presentOfferCodeRedeemSheet(from:options:)`` to
/// configure the offer code redemption.
@available(anyAppleOS 27.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@objc(RvmRedeemOption)
public final class RvmRedeemOption: NSObject {
    let raw: RedeemOption

    init(raw: RedeemOption) { self.raw = raw }

    public override func isEqual(_ object: Any?) -> Bool {
        (object as? RvmRedeemOption)?.raw == raw
    }

    public override var hash: Int { raw.hashValue }
}

// MARK: Converters

@available(anyAppleOS 27.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RedeemOption {
    func toRvm() -> RvmRedeemOption { RvmRedeemOption(raw: self) }
}


@available(anyAppleOS 27.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RvmRedeemOption {
    func toRaw() -> RedeemOption { raw }
}
