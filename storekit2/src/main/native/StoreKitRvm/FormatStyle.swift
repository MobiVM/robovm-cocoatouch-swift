//
//  FormatStyle.swift
//  StoreKitRvm
//

import Foundation
import CryptoKit

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@objc public class RvmFormatStyle_Currency: NSObject {
    let raw: Decimal.FormatStyle.Currency
    init(raw: Decimal.FormatStyle.Currency) {
        self.raw = raw
    }
    
    @objc public var currencyCode: String { return raw.currencyCode }
    @objc public var locale: Locale { return raw.locale }
    
}

// MARK: Converters

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension Decimal.FormatStyle.Currency {
    func toRvm() -> RvmFormatStyle_Currency { RvmFormatStyle_Currency(raw: self) }
}
