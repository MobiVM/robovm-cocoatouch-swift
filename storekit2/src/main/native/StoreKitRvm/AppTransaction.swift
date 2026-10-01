import Foundation
import StoreKit


@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
@objc public class RvmAppTransaction: NSObject {
    private var raw: AppTransaction!
    
    init(raw: AppTransaction!) {
        super.init()
        self.raw = raw
    }
    
    private override init() {
    }

    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmAppTransaction { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }

    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    @objc(RvmAppTransaction_StoreType)
    public final class StoreType: NSObject {
        let raw: AppTransaction.StoreType
        init(raw: AppTransaction.StoreType) { self.raw = raw }
        public override func isEqual(_ object: Any?) -> Bool {
            (object as? StoreType)?.raw == raw
        }
        public override var hash: Int { raw.hashValue }
        @objc public var rawValue: String { raw.rawValue }
        @objc public init(rawValue: String) { raw = .init(rawValue: rawValue) }
        @objc public static var consumer: StoreType { .init(raw: .consumer) }
        @objc public static var education: StoreType { .init(raw: .education) }
        @objc public static var enterprise: StoreType { .init(raw: .enterprise) }
    }

    /// The JSON representation of the transaction.
    @objc public var jsonRepresentation: Data { raw.jsonRepresentation }

    /// A number the App Store uses to uniquely identify the application.
    @objc public var appID: NSNumber? { raw.appID as NSNumber? }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @objc public var appTransactionID: String { raw.appTransactionID }

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

    /// The platform where the original purchase of the app.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    @objc public var originalPlatform: RvmAppStore.Platform { raw.originalPlatform.toRvm() }

    /// The string representation of the platform where the original purchase of the app was made.
    @available(iOS, introduced: 16.0, deprecated: 18.4, message: "Use the originalPlatform property instead.")
    @available(macOS, introduced: 13.0, deprecated: 15.4, message: "Use the originalPlatform property instead.")
    @available(tvOS, introduced: 16.0, deprecated: 18.4, message: "Use the originalPlatform property instead.")
    @available(watchOS, introduced: 9.0, deprecated: 11.4, message: "Use the originalPlatform property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.4, message: "Use the originalPlatform property instead.")
    @objc public var originalPlatformStringRepresentation: String {
        raw.originalPlatformStringRepresentation
    }

    /// The date this app was preordered.
    @objc public var preorderDate: Date? { raw.preorderDate }

    /// A SHA-384 hash of `AppStore.deviceVerificationID` appended after
    /// `deviceVerificationNonce` (both lowercased UUID strings).
    @objc public var deviceVerification: Data { raw.deviceVerification }

    /// The nonce used when computing `deviceVerification`.
    /// - SeeAlso: `AppStore.deviceVerificationID`
    @objc public var deviceVerificationNonce: UUID { raw.deviceVerificationNonce }

    /// The revocation date of the app purchase.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @objc public var revocationDate: Date? { raw.revocationDate }

    /// The date this transaction was generated and signed.
    @objc public var signedDate: Date { raw.signedDate }

    /// The store where the original purchase of the app was made.
    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    @objc public var storeType: StoreType { raw.storeType.toRvm() }

    /// The string representation of the store where the original purchase of the app was made.
    @available(iOS, introduced: 16.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(macOS, introduced: 13.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(tvOS, introduced: 16.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(watchOS, introduced: 9.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @available(visionOS, introduced: 1.0, deprecated: 27.0, message: "Use the storeType property instead.")
    @objc public var storeTypeStringRepresentation: String {
        raw.storeTypeStringRepresentation
    }

    /// Returns all the `AppTransaction`s for this version of the app.
    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    @objc public static var all: RvmAsyncSequence<VerificationResultAppTransaction> {
        AppTransaction.all.toRvm()
    }

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
extension RvmAppTransaction {
    @objc public override var debugDescription: String { raw.debugDescription }
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

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension VerificationResultAppTransaction {
    @objc public override var debugDescription: String { raw.debugDescription }
}

// MARK: Converters

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension AppTransaction {
    func toRvm() -> RvmAppTransaction { RvmAppTransaction(raw: self) }
}


@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
extension VerificationResult<AppTransaction> {
    func toRvm() -> VerificationResultAppTransaction { VerificationResultAppTransaction(raw: self) }
}


@available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
extension AppTransaction.StoreType {
    func toRvm() -> RvmAppTransaction.StoreType { RvmAppTransaction.StoreType(raw: self) }
}


@available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
extension AppTransaction.AppTransactions {
    func toRvm() -> RvmAsyncSequence<VerificationResultAppTransaction> {
        self.toRvm { $0?.toRvm() }
    }
}
