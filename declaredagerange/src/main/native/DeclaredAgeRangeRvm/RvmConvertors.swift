import Foundation
import DeclaredAgeRange

@available(iOS 26.0, macOS 26.0, *)
@available(visionOS, unavailable)
extension AgeRangeService {
    func toRvm() -> RvmAgeRangeService { RvmAgeRangeService(raw: self) }
}


@available(iOS 26.0, macOS 26.0, *)
extension AgeRangeService.ParentalControls {
    func toRvm() -> RvmAgeRangeService.ParentalControls { RvmAgeRangeService.ParentalControls(raw: self) }
}

@available(iOS 26.0, macOS 26.0, *)
extension AgeRangeService.AgeRangeDeclaration {
    func toRvm() -> RvmAgeRangeService.AgeRangeDeclaration {
        return switch self {
        case .selfDeclared: RvmAgeRangeService.AgeRangeDeclaration.selfDeclared
        case .guardianDeclared: RvmAgeRangeService.AgeRangeDeclaration.guardianDeclared
        @unknown default: RvmAgeRangeService.AgeRangeDeclaration.unknown
        }
    }
}

@available(iOS 26.0, macOS 26.0, *)
extension AgeRangeService.AgeRange {
    func toRvm() -> RvmAgeRangeService.AgeRange { RvmAgeRangeService.AgeRange(raw: self) }
}

@available(iOS 26.0, macOS 26.0, *)
extension AgeRangeService.Response {
    func toRvm() -> RvmAgeRangeService.Response {
        return switch self {
        case .declinedSharing: RvmAgeRangeService.Response.declinedSharing
        case .sharing(let range): RvmAgeRangeService.Response.sharing(range: range.toRvm())
        @unknown default: RvmAgeRangeService.Response.unknown
        }
    }
}

@available(iOS 26.0, macOS 26.0, *)
extension AgeRangeService.Error {
    func toRvm() -> NSError {
        let rvmCode = switch self {
        case .notAvailable: RvmAgeRangeService.ErrorCode.notAvailable.rawValue
        case .invalidRequest: RvmAgeRangeService.ErrorCode.invalidRequest.rawValue
        @unknown default: RvmAgeRangeService.ErrorCode.unknown.rawValue
        }
        return NSError(domain: RvmAgeRangeService.ErrorDomain, code: rvmCode, userInfo: (self as NSError).userInfo)
    }
}

//
// Generic Error to possible NSError
//
@available(iOS 26.0, macOS 26.0, *)
extension Error {
    func toRvmError() -> Error {
        return switch self {
        case let e as AgeRangeService.Error : e.toRvm()
        default: self
        }
    }
}
