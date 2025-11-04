import StoreKit

//
// MARK: Product related converters
//

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.PurchaseOption {
    func toRvm() -> RvmProduct.PurchaseOption { RvmProduct.PurchaseOption(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.PurchaseResult {
    func toRvm() -> RvmProduct.PurchaseResult {
        return switch self {
        case .success(let verificationResult): RvmProduct.PurchaseResult.success(transaction: VerificationResultTransaction(raw: verificationResult))
        case .userCancelled: RvmProduct.PurchaseResult.userCancelled
        case .pending: RvmProduct.PurchaseResult.pending
        @unknown default: RvmProduct.PurchaseResult.unknown
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.PurchaseError {
    func toRvm() -> NSError {
        let code = switch self {
            
        case .invalidQuantity: RvmProduct.PurchaseError.invalidQuantity.rawValue
        case .productUnavailable: RvmProduct.PurchaseError.productUnavailable.rawValue
        case .purchaseNotAllowed: RvmProduct.PurchaseError.purchaseNotAllowed.rawValue
        case .ineligibleForOffer: RvmProduct.PurchaseError.ineligibleForOffer.rawValue
        case .invalidOfferIdentifier: RvmProduct.PurchaseError.invalidOfferIdentifier.rawValue
        case .invalidOfferPrice: RvmProduct.PurchaseError.invalidOfferPrice.rawValue
        case .invalidOfferSignature: RvmProduct.PurchaseError.invalidOfferSignature.rawValue
        case .missingOfferParameters: RvmProduct.PurchaseError.missingOfferParameters.rawValue
        @unknown default: RvmProduct.PurchaseError.unknown.rawValue
        }
        
        return NSError(domain: RvmProduct.PurchaseErrorDomain, code: code, userInfo: (self as NSError).userInfo)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo {
    func toRvm() -> RvmProduct.SubscriptionInfo { RvmProduct.SubscriptionInfo(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionOffer {
    func toRvm() -> RvmProduct.SubscriptionOffer { RvmProduct.SubscriptionOffer(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionOffer {
    func toRaw() -> Product.SubscriptionOffer { self.raw }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionOffer.OfferType {
    func toRvm() -> RvmProduct.SubscriptionOffer.OfferType { RvmProduct.SubscriptionOffer.OfferType(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionOffer.PaymentMode {
    func toRvm() -> RvmProduct.SubscriptionOffer.PaymentMode { RvmProduct.SubscriptionOffer.PaymentMode(raw: self) }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod.Unit.FormatStyle {
    func toRvm() -> RvmProduct.SubscriptionPeriod.Unit.FormatStyle { RvmProduct.SubscriptionPeriod.Unit.FormatStyle(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product {
    func toRvm() -> RvmProduct { RvmProduct(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.ProductType {
    func toRvm() -> RvmProduct.ProductType { RvmProduct.ProductType(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod {
    func toRvm() -> RvmProduct.SubscriptionPeriod { RvmProduct.SubscriptionPeriod(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionPeriod.Unit {
    func toRvm() -> RvmProduct.SubscriptionPeriod.Unit {
        switch self {
            case .day: return RvmProduct.SubscriptionPeriod.Unit.day
            case .week: return RvmProduct.SubscriptionPeriod.Unit.week
            case .month: return RvmProduct.SubscriptionPeriod.Unit.month
            case .year: return RvmProduct.SubscriptionPeriod.Unit.year
            @unknown default: return RvmProduct.SubscriptionPeriod.Unit.unknown
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmProduct.SubscriptionPeriod.Unit {
    func toRaw() -> Product.SubscriptionPeriod.Unit {
        return switch self {
        case .day: Product.SubscriptionPeriod.Unit.day
        case .week: Product.SubscriptionPeriod.Unit.week
        case .month: Product.SubscriptionPeriod.Unit.month
        case .year: Product.SubscriptionPeriod.Unit.year
        case .unknown: Product.SubscriptionPeriod.Unit.day // SHOULD NOT HAPPEN
        }
    }
}


@available(iOS 16.4, *)
extension Product.PromotionInfo {
    func toRvm() -> RvmProduct.PromotionInfo { RvmProduct.PromotionInfo(raw: self) }
}

@available(iOS 16.4, *)
extension Product.PromotionInfo.Visibility {
    func toRvm() -> RvmProduct.PromotionInfo.Visibility {
        switch self {
            case .appStoreConnectDefault: return RvmProduct.PromotionInfo.Visibility.appStoreConnectDefault
            case .visible: return RvmProduct.PromotionInfo.Visibility.visible
            case .hidden: return RvmProduct.PromotionInfo.Visibility.hidden
            @unknown default: return RvmProduct.PromotionInfo.Visibility.unknown
        }
    }
}

@available(iOS 16.4, *)
extension RvmProduct.PromotionInfo.Visibility {
    func toRaw() throws -> Product.PromotionInfo.Visibility {
        switch self {
            case .appStoreConnectDefault: return Product.PromotionInfo.Visibility.appStoreConnectDefault
            case .visible: return Product.PromotionInfo.Visibility.visible
            case .hidden: return Product.PromotionInfo.Visibility.hidden
            case .unknown: throw fatalError()
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalState {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalState { RvmProduct.SubscriptionInfo.RenewalState(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalInfo { RvmProduct.SubscriptionInfo.RenewalInfo(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo.ExpirationReason {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason { RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus {
         return switch self {
         case .noIncreasePending: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.noIncreasePending
         case .pending: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.pending
         case .agreed: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.agreed
         @unknown default: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.unknown
         }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.Status {
    func toRvm() -> RvmProduct.SubscriptionInfo.Status { RvmProduct.SubscriptionInfo.Status(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult<Product.SubscriptionInfo.RenewalInfo> {
    func toRvm() -> VerificationResultRenewalInfo { VerificationResultRenewalInfo(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Product.SubscriptionInfo.Status.Statuses {
    func toRvm() -> RvmAsyncSequence<RvmProduct.SubscriptionInfo.Status> { self.toRvm { $0?.toRvm() } }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension AsyncStream<(groupID: String, statuses: [Product.SubscriptionInfo.Status])> {
    func toRvm() -> RvmAsyncSequence<RvmProduct.SubscriptionInfo.Status.Pair> {
        return self.toRvm {
            guard let (groupID, statuses) = $0 else { return  nil }
            return RvmProduct.SubscriptionInfo.Status.Pair(groupID: groupID, statuses: statuses.map{ $0.toRvm() })
        }
    }
}

//
// MARK: Transaction related converters
//

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.RefundRequestError {
    func toRvm() -> NSError {
        let code = switch self {
            case .duplicateRequest: RvmTransaction.RefundRequestError.duplicateRequest.rawValue
            case .failed: RvmTransaction.RefundRequestError.failed.rawValue
            @unknown default: RvmTransaction.RefundRequestError.unknown.rawValue
        }
        return NSError(domain: RvmTransaction.RefundRequestErrorDomain, code: code, userInfo: (self as NSError).userInfo)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.RefundRequestStatus {
    func toRvm() -> RvmTransaction.RefundRequestStatus {
        switch self {
        case .success: return RvmTransaction.RefundRequestStatus.success
        case .userCancelled: return RvmTransaction.RefundRequestStatus.userCancelled
        @unknown default: return RvmTransaction.RefundRequestStatus.unknown
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Transaction.Reason {
    func toRvm() -> RvmTransaction.Reason { RvmTransaction.Reason(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.RevocationReason {
    func toRvm() -> RvmTransaction.RevocationReason { RvmTransaction.RevocationReason(raw: self) }
}

@available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
extension Transaction.Offer {
    func toRvm() -> RvmTransaction.Offer { RvmTransaction.Offer(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.OfferType {
    func toRvm() -> RvmTransaction.OfferType { RvmTransaction.OfferType(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.OwnershipType {
    func toRvm() -> RvmTransaction.OwnershipType { RvmTransaction.OwnershipType(raw: self) }
}

@available(iOS 17.2, macOS 14.2, tvOS 17.2, watchOS 10.2, visionOS 1.1, *)
extension Transaction.Offer.PaymentMode {
    func toRvm() -> RvmTransaction.Offer.PaymentMode { RvmTransaction.Offer.PaymentMode(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction {
    func toRvm() -> RvmTransaction { RvmTransaction(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult<Transaction> {
    func toRvm() -> VerificationResultTransaction { VerificationResultTransaction(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Transaction.Transactions {
    func toRvm() -> RvmAsyncSequence<VerificationResultTransaction> { self.toRvm { $0?.toRvm() } }
}

//
// MARK: VerificationResult related converters
//

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension VerificationResult.VerificationError{
    func toRvmCode() -> Int {
        return switch self {
        case .revokedCertificate: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidCertificateChain: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidDeviceVerification: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidEncoding: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidSignature: VerificationErrorCode.revokedCertificate.rawValue
        case .missingRequiredProperties: VerificationErrorCode.revokedCertificate.rawValue
        @unknown default:
            VerificationErrorCode.unknown.rawValue
        }
    }
    
    func toRvm() -> NSError {
        NSError(domain: VerificationErrorDomainRvm, code: toRvmCode(), userInfo: (self as NSError).userInfo)
    }
}


//
// MARK: Storefront related converters
//
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Storefront {
    func toRvm() -> RvmStorefront { RvmStorefront(raw: self) }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Storefront.Storefronts {
    func toRvm() -> RvmAsyncSequence<RvmStorefront> { self.toRvm { $0?.toRvm() } }
}

//
// MARK: PaymentMethodBinding related converters
//
@available(iOS 16.4, visionOS 1.0, *)
extension PaymentMethodBinding.PaymentMethodBindingError {
    func toRvmCode() -> Int {
        switch self {
        case .notEligible: return RvmPaymentMethodBinding.PaymentMethodBindingError.notEligible.rawValue
        case .invalidPinningID: return RvmPaymentMethodBinding.PaymentMethodBindingError.invalidPinningID.rawValue
        case .failed: return RvmPaymentMethodBinding.PaymentMethodBindingError.failed.rawValue
        @unknown default:
            return RvmPaymentMethodBinding.PaymentMethodBindingError.unknown.rawValue
        }
    }
    
    func toRvm() -> NSError {
        return NSError(domain: RvmPaymentMethodBinding.PaymentMethodBindingErrorDomainRvm, code: toRvmCode(), userInfo: (self as NSError).userInfo)
    }

}


//
// MARK: PaymentMethodBinding related converters
//
@available(iOS 16.0, visionOS 1.0, *)
extension Message {
    func toRvm() -> RvmMessage { RvmMessage(raw: self) }
}

@available(iOS 16.0, visionOS 1.0, *)
extension Message.Reason {
    func toRvm() -> RvmMessage.Reason { RvmMessage.Reason(raw: self) }
}

@available(iOS 16.0, visionOS 1.0, *)
extension Message.Messages {
    func toRvm() -> RvmAsyncSequence<RvmMessage> { self.toRvm { $0?.toRvm() } }
}


//
// MARK: ExternalPurchaseCustomLink related converters
//
@available(iOS 18.1, macOS 15.1, tvOS 18.1, watchOS 11.1, visionOS 2.1, *)
extension RvmExternalPurchaseCustomLink.NoticeType {
    func toRaw() throws -> ExternalPurchaseCustomLink.NoticeType {
        switch self {
        case .unknown:
            throw fatalError()
        case .withinApp:
            return ExternalPurchaseCustomLink.NoticeType.withinApp
        case .browser:
            return ExternalPurchaseCustomLink.NoticeType.browser
        }
    }
}

@available(iOS 18.1, macOS 15.1, tvOS 18.1, watchOS 11.1, visionOS 2.1, *)
extension ExternalPurchaseCustomLink.NoticeResult {
    func toRvm() -> RvmExternalPurchaseCustomLink.NoticeResult {
        switch self {
            case .cancelled: return RvmExternalPurchaseCustomLink.NoticeResult.cancelled
            case .continued: return RvmExternalPurchaseCustomLink.NoticeResult.continued
            @unknown default: return RvmExternalPurchaseCustomLink.NoticeResult.unknown
        }
    }
}


@available(iOS 18.1, macOS 15.1, tvOS 18.1, watchOS 11.1, visionOS 2.1, *)
extension ExternalPurchaseCustomLink.Token {
    func toRvm() -> RvmExternalPurchaseCustomLink.Token {
        return RvmExternalPurchaseCustomLink.Token(raw: self)
    }
}


//
// MARK: ExternalPurchase related converters
//
@available(iOS 15.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
extension ExternalPurchase.NoticeResult {
    func toRvm() -> RvmExternalPurchase.NoticeResult {
        if #available(iOS 17.4, *) {
            switch self {
            case .continuedWithExternalPurchaseToken(let token):
                return RvmExternalPurchase.NoticeResult.Continued(externalPurchaseToken: token)
            case .cancelled:
                return RvmExternalPurchase.NoticeResult.canceled
            default:
                return RvmExternalPurchase.NoticeResult.canceled
            }
        } else { return RvmExternalPurchase.NoticeResult.canceled }
    }
}


//
// MARK: AppStore related converters
//
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension AppStore.Environment {
    func toRvm() -> RvmAppStore.Environment { RvmAppStore.Environment(raw: self) }
}


//
// MARK: PurchaseIntent
//
@available(iOS 16.4, macOS 14.4, *)
extension PurchaseIntent {
    func toRvm() -> RvmPurchaseIntent { RvmPurchaseIntent(raw: self) }
}

@available(iOS 16.4, macOS 14.4, *)
extension PurchaseIntent.PurchaseIntents {
    func toRvm() -> RvmAsyncSequence<RvmPurchaseIntent> { self.toRvm { $0?.toRvm() } }
}

//
// MARK: PaymentMethodBinding related converters
//
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension StoreKitError {
    func toRvmCode() -> Int {
        switch self {
        case .unknown: return RvmStoreKitError.unknown.rawValue
        case .userCancelled: return RvmStoreKitError.userCancelled.rawValue
        case .networkError(_): return RvmStoreKitError.networkError.rawValue
        case .systemError(_): return RvmStoreKitError.systemError.rawValue
        case .notAvailableInStorefront: return RvmStoreKitError.notAvailableInStorefront.rawValue
        default:
            if #available(iOS 15.4, *) {
                if case .notEntitled = self {
                    return RvmStoreKitError.notEntitled.rawValue
                }
            }
            if #available(iOS 18.4, *) {
                if case .unsupported = self {
                    return RvmStoreKitError.unsupported.rawValue
                }
            }
            return RvmStoreKitError.unknown.rawValue
        }
    }
    
    func toRvm() -> NSError {
        return NSError(domain: RvmAppStore.StoreKitErrorDomain, code: toRvmCode(), userInfo: (self as NSError).userInfo)
    }
}


//
// Generic Error to possible NSError
//
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension Error {
    func toRvmError() -> Error {
        switch self {
        case let e as StoreKitError: return e.toRvm()
        case let e as VerificationResult<Any>.VerificationError: return e.toRvm()
        case let e as Transaction.RefundRequestError: return e.toRvm()
        case let e as Product.PurchaseError: return e.toRvm()
        case let e as StoreKitError: return e.toRvm()
            default:
            if #available(iOS 16.4, *) {
                if let e = self as? PaymentMethodBinding.PaymentMethodBindingError {
                    return e.toRvm()
                }
            }
            return self
        }
    }
}
