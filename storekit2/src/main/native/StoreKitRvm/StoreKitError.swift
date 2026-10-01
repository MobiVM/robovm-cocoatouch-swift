//
//  FormatStyle.swift
//  StoreKitRvm
//

import Foundation
import StoreKit

/// Generic StoreKit Errors.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc(RvmStoreKitError)
public enum RvmStoreKitError : Int {
    
    /// Failure due to an unknown, unrecoverable error.
    ///
    /// Usually, trying again at a later time will work.
    case unknown
    
    /// The action failed because the user did not complete some necessary interaction.
    case userCancelled
    
    /// A network error occurred when communicating with the App Store.
    case networkError
    
    case systemError
    
    /// The product is not available in the current storefront.
    case notAvailableInStorefront
    
    /// The application is not entitled to perform the action.
    @available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, visionOS 1.0, *)
    case notEntitled
    
    /// The product is not supported for this operation.
    @available(iOS 18.4, macOS 15.4, tvOS 18.4, watchOS 11.4, visionOS 2.4, *)
    case unsupported

    /// StoreKit UI cannot be presented from the current context.
    @available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *)
    case invalidPresentationContext
    
}

// MARK: Converters

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
            if #available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, *) {
                if case .invalidPresentationContext = self {
                    return RvmStoreKitError.invalidPresentationContext.rawValue
                }
            }
            return RvmStoreKitError.unknown.rawValue
        }
    }

    func toRvm() -> NSError {
        return NSError(domain: RvmAppStore.StoreKitErrorDomain, code: toRvmCode(), userInfo: (self as NSError).userInfo)
    }
}
