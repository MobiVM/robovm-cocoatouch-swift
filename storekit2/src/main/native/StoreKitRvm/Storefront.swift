import Foundation
import StoreKit

/// An App Store storefront.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc public class RvmStorefront : NSObject {
    let raw: Storefront
    init (raw: Storefront) {
        self.raw = raw
    }

    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? Storefront {
            self.raw.countryCode == other.countryCode && self.raw.id == other.id
        } else { false }
    }

    public override var hash: Int { raw.countryCode.hash * 1031 + raw.id.hash }

    /// The three-letter code representing the country or region associated with the App Store storefront.
    @objc public var countryCode: String { raw.countryCode }

    /// A value defined by Apple that uniquely identifies an App Store storefront.
    @objc public var id: String { raw.id }

    /// The current App Store storefront.
    @objc public static func current(completionHandler: @escaping (RvmStorefront?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await Storefront.current?.toRvm()) }.toRvm()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmStorefront {
    /// A sequence that emits a Storefront each time the App Store storefront changes.
    @objc public static var updates: RvmAsyncSequence<RvmStorefront> { return Storefront.updates.toRvm() }
}

