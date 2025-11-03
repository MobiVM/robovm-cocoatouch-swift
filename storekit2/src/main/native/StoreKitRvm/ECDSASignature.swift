//
//  ECDSASignature.swift
//  StoreKitRvm
//

import Foundation
import CryptoKit

@available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 13.0, *)
@objc public class RvmECDSASignature: NSObject {
    let raw: P256.Signing.ECDSASignature
    init(raw: P256.Signing.ECDSASignature) {
        self.raw = raw
    }
    
    /// A raw data representation of a P-256 digital signature.
    @objc public var rawRepresentation: Data { raw.rawRepresentation }
    
    /// A Distinguished Encoding Rules (DER) encoded representation of a
    /// P-256 digital signature.
    @objc public var derRepresentation: Data { raw.derRepresentation }

}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 13.0, *)
extension P256.Signing.ECDSASignature {
    func toRvm() -> RvmECDSASignature { return RvmECDSASignature(raw: self) }
}
