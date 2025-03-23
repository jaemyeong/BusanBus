import UIKit

public struct AppCoordinator {
    
    private let window: UIWindow
    
    private let navigationController: UINavigationController
    
    private let rootViewController: ViewController
    
    @MainActor
    public init(window: UIWindow) {
        self.window = window
        
        let viewController = ViewController()
        self.rootViewController = viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
    }
    
    @MainActor
    public func start() {
        let window = self.window
        let navigationController = self.navigationController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
