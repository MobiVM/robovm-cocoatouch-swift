import Foundation
import StoreKit

@objc enum VerificationErrorCode : Int {
    case unknown = -1

    /// Trying again later may retrieve valid signed data from the App Store.
    case revokedCertificate

    /// The certificate chain was parsable, but it was invalid for signing this data.
    case invalidCertificateChain

    /// The device verification properties were invalid for this device.
    case invalidDeviceVerification

    /// Th JWS header and any data included in it or it's certificate chain had an invalid encoding.
    case invalidEncoding

    /// The certificate chain was valid for signing this data, but the leaf's public key was invalid for the
    /// JWS signature.
    case invalidSignature

    /// Either the JWS header or any certificate in the chain was missing necessary properties for
    /// verification.
    case missingRequiredProperties
}

let VerificationErrorDomainRvm: String = "VerificationResult.VerificationErrorDomain"

// MARK: Converters

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
