import UIKit

import BusanBusMain

public final class SceneCoordinator: Coordinator {
    private let window: UIWindow
    
    public private(set) var children: [AnyHashable: AnyObject]
    
    public init(window: UIWindow) {
        self.window = window
        self.children = [:]
    }
    
    public func launch() {
        let window = self.window
        
        let viewController = MainViewController()
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
