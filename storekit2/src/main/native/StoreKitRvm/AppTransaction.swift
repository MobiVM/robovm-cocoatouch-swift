import Foundation
import StoreKit


@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
@objc public class RvmAppTransaction: NSObject {
    private var raw: AppTransaction!
    
    fileprivate init(raw: AppTransaction!) {
        super.init()
        self.raw = raw
    }
    
    private override init() {
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmAppTransaction { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }

    /// The JSON representation of the transaction.
    @objc public var jsonRepresentation: Data { raw.jsonRepresentation }

    /// A number the App Store uses to uniquely identify the application.
    @objc public var appID: NSNumber? { raw.appID as NSNumber? }

    /// The application version the transaction is for.
    @objc public var appVersion: String { raw.appVersion }

    /// A number the App Store uses to uniquely identify the version of the application.
    @objc public var appVersionID: NSNumber? { raw.appVersionID as NSNumber? }

    /// Identifies the application the transaction is for.
    @objc public var bundleID: String { raw.bundleID }

    /// The server environment this transaction was created in.
    @objc public var environment: RvmAppStore.Environment { raw.environment.toRvm() }

    /// The version of the app originally purchased.
    @objc public var originalAppVersion: String { raw.originalAppVersion }

    /// The date this original app purchase occurred on.
    @objc public var originalPurchaseDate: Date { raw.originalPurchaseDate }

    /// The date this app was preordered.
    @objc public var preorderDate: Date? { raw.preorderDate }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    @objc public var deviceVerification: Data { raw.deviceVerification }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    @objc public var deviceVerificationNonce: UUID { raw.deviceVerificationNonce }

    /// The date this transaction was generated and signed.
    @objc public var signedDate: Date { raw.signedDate }

    /// Get the cached `AppTransaction` for this version of the app or make
    /// a request to get one from the App Store server if one has not been cached yet.
    @objc public static func getShared(completionHandler: @escaping (VerificationResultAppTransaction?, Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await AppTransaction.shared.toRvm(), nil)
            } catch let error {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }

    /// Refreshes the shared `AppTransaction` from the App Store server.
    /// Calling this function will force an authentication dialog to display to the user.
    @objc public static func refresh(completionHandler: @escaping (VerificationResultAppTransaction?, Error?) -> Void) -> RvmTask {
        return Task.detached {
            do {
                completionHandler(try await AppTransaction.refresh().toRvm(), nil)
            } catch let error {
                completionHandler(nil, error.toRvmError())
            }
            return
        }.toRvm()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension AppTransaction{
    func toRvm() -> RvmAppTransaction { RvmAppTransaction(raw: self) }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension VerificationResult<AppTransaction> {
    func toRvm() -> VerificationResultAppTransaction { return VerificationResultAppTransaction(raw: self) }
}


@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
@objc(RvmVerificationResult_AppTransaction)
public class VerificationResultAppTransaction: NSObject {
    let raw: VerificationResult<AppTransaction>
    @objc public let isVerified: Bool

    init(raw: VerificationResult<AppTransaction>) {
        self.raw = raw
        if case .verified(_) = raw { self.isVerified = true } else { self.isVerified = false }
    }
    
    @objc public func getPayloadValue() throws -> RvmAppTransaction {
        return try raw.payloadValue.toRvm()
    }
    
    /// Ignore the result of StoreKit's verification, and get the payload value.
    /// - SeeAlso: In order to check whether StoreKit was able to verify the signature,  use the
    ///           `payloadValue` property or a pattern matching technique such as a switch
    ///            statement.
    @objc public var unsafePayloadValue: RvmAppTransaction { raw.unsafePayloadValue.toRvm() }

    
    @objc public var error: NSError? {
        guard case let .unverified(_, error) = raw else { return nil }
        return error.toRvm()
    }
    
    /// The raw JSON web signature for the signed value.
    @objc public var jwsRepresentation: String { raw.jwsRepresentation }

    /// The data for the header component of the JWS.
    @objc public var headerData: Data { raw.headerData }

    /// The data for the payload component of the JWS.
    @objc public var payloadData: Data { raw.payloadData }

    /// The data for the signature component of the JWS.
    @objc public var signatureData: Data { raw.signatureData }

    /// The signature of the JWS, converted to a `CryptoKit` value.
    @objc public var signature: RvmECDSASignature { raw.signature.toRvm() }

    /// The component of the JWS that the signature is computed over.
    @objc public var signedData: Data { raw.signedData }

    /// The date the signature was generated.
    @objc public var signedDate: Date { raw.signedDate }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    @objc public var deviceVerification: Data { raw.deviceVerification }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    @objc public var deviceVerificationNonce: UUID { raw.deviceVerificationNonce }
    
    public override var description: String { raw.debugDescription }
}

