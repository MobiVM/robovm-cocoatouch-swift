import Foundation
import StoreKit


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension RvmAppStore {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
    @objc(RvmAppStore_Environment)
    public class Environment: NSObject {
        let raw: AppStore.Environment
        init(raw: AppStore.Environment) { self.raw = raw }

        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Environment { self.raw == other.raw } else { false }
        }

        public override var hash: Int { raw.hashValue }

        @objc public var rawValue: String { raw.rawValue }

        /// The environment for apps downloaded from the App Store.
        @objc public static var production: Environment { return AppStore.Environment.production.toRvm() }

        /// The environment for the App Store Sandbox or apps downloaded from TestFlight.
        @objc public static var sandbox: Environment { return AppStore.Environment.sandbox.toRvm() }

        /// The environment for StoreKit Testing in Xcode, including unit tests with StoreKitTest.
        @objc public static var xcode: Environment { return AppStore.Environment.xcode.toRvm() }
        
        public override var description: String { raw.rawValue}
    }
}

