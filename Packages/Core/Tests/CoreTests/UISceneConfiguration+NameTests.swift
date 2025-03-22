import Testing

@testable import Core

#if canImport(UIKit)

import UIKit

@Test
@MainActor
@available(iOS 18.0, *)
public func defaultConfiguration() {
    #expect(UISceneConfiguration.defaultConfiguration.rawValue == "Default Configuration")
}

#endif
