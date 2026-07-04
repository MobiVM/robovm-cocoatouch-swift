
import Foundation
import DeclaredAgeRange
import UIKit
import SwiftUI

/// A request for the age range of a person
/// logged onto the current device.
///
/// Use `AgeRangeService` to request a person's age range and manage their access to content on your app.
/// The code snippet below describes how to request a person's age range
/// and determine what content to display on your app's landing page.
///
/// ```swift
/// do {
///    let response = try await AgeRangeService.shared.requestAgeRange(ageGates: 13, 15, 18)
///    guard let lowerBound = response.lowerBound else {
///        // Allow access to under 13 features.
///        return
///    }
///    if lowerBound >= 18 {
///       // Allow access to 18+ features.
///    } else if lowerBound >= 15 {
///        // Allow access to 15+ features.
///    } else if lowerBound >= 13 {
///        // Allow access to 13+ features.
///    }
/// } catch AgeRangeService.Error.notAvailable {
///    // No age range provided.
///    return
/// }
/// ```
@available(iOS 26.0, macOS 26.0, *)
@available(visionOS, unavailable)
@objc(RvmAgeRangeService)
public class RvmAgeRangeService: NSObject {
    let raw: AgeRangeService
    init(raw: AgeRangeService) {
        self.raw = raw
    }

    /// The singleton app instance.
    ///
    /// Use `shared` to access the ``AgeRangeService`` instance in your app.
    @objc public static var shared: RvmAgeRangeService { AgeRangeService.shared.toRvm()  }

    /// An error that occurs when an age range request fails.
    @objc(RvmAgeRangeService_Error)
    public enum ErrorCode : Int {
        case unknown = -1

        /// The system was unable to share the person's age.
        ///
        /// When the system prompts a person and they decide not to share their age range with your app.
        case notAvailable

        /// The request is invalid.
        case invalidRequest
    }

    /// An enumeration that describes the declared age range.
    ///
    /// The system specifies whether the person declared the age range or an adult made the determination.
    @objc(RvmAgeRangeService_AgeRangeDeclaration)
    public enum AgeRangeDeclaration: Int {
        case unknown = -1

        /// The age range was declared by the person.
        case selfDeclared

        /// The age range was declared by a parent or guardian.
        case guardianDeclared
    }

    /// An option set to define parental controls enabled and shared as a part of age range declaration.
    @objc(RvmAgeRangeService_ParentalControls)
    public class ParentalControls : NSObject {
        let raw: AgeRangeService.ParentalControls
        init(raw: AgeRangeService.ParentalControls) {
            self.raw = raw
        }

        /// The system limits communication with the person.
        @objc public static var communicationLimits: RvmAgeRangeService.ParentalControls { AgeRangeService.ParentalControls.communicationLimits.toRvm() }

        /// The raw value of the option set.
        @objc public override var description: String { raw.description }
        
        @objc public func contains(other: ParentalControls) -> Bool { raw.contains(other.raw) }
    }

    /// A person's age range is based on the information they provided in response to the age range request.
    ///
    /// For more information, refer to ``requestAgeRange(ageGates:_:_:in:)``
    @objc(RvmAgeRangeService_AgeRange)
    public class AgeRange: NSObject {
        let raw: AgeRangeService.AgeRange
        init(raw: AgeRangeService.AgeRange) {
            self.raw = raw
        }

        ///The lower limit of the person's age range.
        ///
        /// If nil, then the lower bound of the person's age range is 0.
        @objc public var lowerBound: NSNumber? { raw.lowerBound.map(NSNumber.init) }

        /// The upper limit of the person's age range.
        ///
        /// If nil, then there's no upper bound of the person's age range.
        @objc public var upperBound: NSNumber? { raw.upperBound.map(NSNumber.init) }

        /// The sharer of the age range.
        ///
        /// For more information, refer to  ``AgeRangeService/AgeRangeDeclaration``.
        @objc public var ageRangeDeclaration: RvmAgeRangeService.AgeRangeDeclaration { raw.ageRangeDeclaration?.toRvm() ?? RvmAgeRangeService.AgeRangeDeclaration.unknown }

        /// The parental controls turned on as a part of the response.
        ///
        /// If empty, upper bound of age range is not below 18 or the person is under 18 with no parental controls enabled.
        @objc public var activeParentalControls: RvmAgeRangeService.ParentalControls { raw.activeParentalControls.toRvm() }
    }

    /// A response indicating either a person shared their age range or declined to share it.
    @objc(RvmAgeRangeService_Response)
    public class Response: NSObject {
        @objc public static let unknown = Response()

        /// The person declined to share their age range.
        @objc public static let declinedSharing = Response()

        /// The person shared the age range successfully.
        @objc(RvmAgeRangeService_Response_sharing)
        public class sharing: Response {
            @objc public let range: RvmAgeRangeService.AgeRange
            init(range: RvmAgeRangeService.AgeRange) {
                self.range = range
            }
        }
    }

    /// Determines an age range for the person logged onto the device.
    ///
    /// - Parameters:
    ///   - threshold1: The required minimum age for your app.
    ///   - threshold2: An optional additional minimum age for your app.
    ///   - threshold3: An optional additional minimum age for your app.
    ///   - viewController: The view controller to anchor and present system UI off of.
    /// - Returns: An ``AgeRangeService/Response`` or throws ``Error``.
    ///
    /// Use ``requestAgeRange(ageGates:_:_:in:)`` for age-gated access to your apps content. People that meet the minimum age requirement you set can access age appropriate content.
    @objc @MainActor
    public func requestAgeRange(ageGates threshold1: Int, _ threshold2: NSNumber? = nil, _ threshold3: NSNumber? = nil,
                                in viewController: UIViewController,
                                completionHandler: @escaping (RvmAgeRangeService.Response?, Error?) -> Void
    ) {
        Task.detached {
            do {
                let response = try await self.raw.requestAgeRange(ageGates: threshold1, threshold2?.intValue, threshold3?.intValue, in: viewController)
                completionHandler(response.toRvm(), nil)
            } catch let e {
                completionHandler(nil, e.toRvmError())
            }
        }
    }
}


///
/// Rvm extension to keep constants
///
@available(iOS 26.0, macOS 26.0, *)
extension RvmAgeRangeService {
    @objc static public let ErrorDomain: String = "RvmAgeRangeService.ErrorDomain"
}
