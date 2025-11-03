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

