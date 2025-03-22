#if canImport(UIKit)

import UIKit

extension UISceneConfiguration {
    
    public struct Name: RawRepresentable, Hashable, Sendable, ExpressibleByStringLiteral {
        
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public init(stringLiteral value: String) {
            self.init(rawValue: value)
        }
    }
    
    public static let defaultConfiguration: Name = "Default Configuration"
}

#endif
