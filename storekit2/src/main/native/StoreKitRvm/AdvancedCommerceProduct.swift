import Foundation
import StoreKit
import UIKit

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
@objc(RvmAdvancedCommerceProduct)
public final class RvmAdvancedCommerceProduct: NSObject {
    let raw: AdvancedCommerceProduct
    init(raw: AdvancedCommerceProduct) { self.raw = raw }

    public override func isEqual(_ object: Any?) -> Bool {
        (object as? RvmAdvancedCommerceProduct)?.raw == raw
    }
    public override var hash: Int { raw.hashValue }

    /// The product identifier that represents the generic product ID used with the Advanced Commerce API.
    @objc public var id: String { raw.id }

    @objc public var type: RvmProduct.ProductType { raw.type.toRvm() }

    @objc public static func create(
        id: String,
        completionHandler: @escaping (RvmAdvancedCommerceProduct?, Error?) -> Void
    ) -> RvmTask {
        Task.detached {
            do {
                completionHandler(try await AdvancedCommerceProduct(id: id).toRvm(), nil)
            } catch {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension RvmAdvancedCommerceProduct {
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc(RvmAdvancedCommerceProduct_PurchaseOption)
    public final class PurchaseOption: NSObject {
        let raw: AdvancedCommerceProduct.PurchaseOption
        init(raw: AdvancedCommerceProduct.PurchaseOption) { self.raw = raw }

        public override func isEqual(_ object: Any?) -> Bool {
            (object as? PurchaseOption)?.raw == raw
        }
        public override var hash: Int { raw.hashValue }

        @objc public static func onStorefrontChange(
            shouldContinuePurchase: @escaping @Sendable (RvmStorefront) -> Bool
        ) -> PurchaseOption {
            AdvancedCommerceProduct.PurchaseOption.onStorefrontChange { storefront in
                shouldContinuePurchase(storefront.toRvm())
            }.toRvm()
        }
    }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension RvmAdvancedCommerceProduct {
    @available(iOS 18.4, tvOS 18.4, visionOS 2.4, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @objc public func purchase(
        compactJWS: String,
        confirmIn viewController: UIViewController,
        options: Set<PurchaseOption> = [],
        completionHandler: @escaping (RvmProduct.PurchaseResult?, Error?) -> Void
    ) -> RvmTask {
        Task {
            do {
                let result = try await raw.purchase(
                    compactJWS: compactJWS,
                    confirmIn: viewController,
                    options: Set(options.map { $0.toRaw() })
                )
                completionHandler(result.toRvm(), nil)
            } catch {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension RvmAdvancedCommerceProduct {
    @objc public func latestTransaction(
        completionHandler: @escaping (VerificationResultTransaction?) -> Void
    ) -> RvmTask {
        Task.detached {
            completionHandler(await self.raw.latestTransaction?.toRvm())
        }.toRvm()
    }

    @objc public var allTransactions: RvmAsyncSequence<VerificationResultTransaction> {
        raw.allTransactions.toRvm()
    }

    @objc public var currentEntitlements: RvmAsyncSequence<VerificationResultTransaction> {
        raw.currentEntitlements.toRvm()
    }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension RvmAdvancedCommerceProduct {
    @objc public override var debugDescription: String { raw.debugDescription }
}

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension RvmAdvancedCommerceProduct.PurchaseOption {
    @objc public override var debugDescription: String { raw.debugDescription }
}

// MARK: Converters

@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct {
    func toRvm() -> RvmAdvancedCommerceProduct { RvmAdvancedCommerceProduct(raw: self) }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension AdvancedCommerceProduct.PurchaseOption {
    func toRvm() -> RvmAdvancedCommerceProduct.PurchaseOption { RvmAdvancedCommerceProduct.PurchaseOption(raw: self) }
}


@available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
extension RvmAdvancedCommerceProduct.PurchaseOption {
    func toRaw() -> AdvancedCommerceProduct.PurchaseOption { raw }
}
