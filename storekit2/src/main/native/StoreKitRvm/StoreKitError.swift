//
//  FormatStyle.swift
//  StoreKitRvm
//

import Foundation

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
    
}

