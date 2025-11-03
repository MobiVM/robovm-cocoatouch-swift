import Foundation
import StoreKit


/// A message to be displayed.
@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@objc public class RvmMessage : NSObject {
    let raw: Message
    init(raw: Message) {
        self.raw = raw
    }

    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmMessage { self.raw == other.raw } else { false }
    }

    public override var hash: Int { raw.hashValue }

    /// The reason for the message.
    @objc public var reason: RvmMessage.Reason { raw.reason.toRvm() }

    @available(iOS 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @objc(RvmMessage_Reason)
    public class Reason : NSObject {
        let raw: Message.Reason
        init(raw: Message.Reason) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Reason { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }


        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        @objc public var rawValue: Int { raw.rawValue }

        @objc public static var generic: RvmMessage.Reason { return Message.Reason.generic.toRvm() }

        @objc  public static var priceIncreaseConsent: RvmMessage.Reason { return Message.Reason.priceIncreaseConsent.toRvm() }

        @available(iOS 16.4, visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @objc public static var billingIssue: RvmMessage.Reason { return Message.Reason.billingIssue.toRvm() }

        @available(iOS 18.0, visionOS 2.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @objc public static var winBackOffer: RvmMessage.Reason { return Message.Reason.winBackOffer.toRvm() }
    }
}



@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension RvmMessage {

    /// Asks the system to display the message.
    /// - Throws: A `StoreKitError`
    @objc @MainActor public func display(in scene: UIWindowScene) throws {
        try raw.display(in: scene)
    }
}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension RvmMessage {
    /// Use `messages` to listen for pending messages. You may want to delay
    /// showing the message if it would interrupt your user's interaction
    /// with your app. By default, the system will display pending
    /// messages at app launch.
    @objc public static var messages: RvmAsyncSequence<RvmMessage> { return Message.messages.toRvm() }
}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension RvmMessage.Reason {
    @objc public override var description: String { raw.localizedDescription }
}

