import UIKit
import LaunchScreen
import App

public struct AppCoordinator {
    
    private let window: UIWindow
    
    private let navigationController: UINavigationController
    
    private let launchScreenViewController: UIViewController
    
    @MainActor
    public init(window: UIWindow) {
        self.window = window
        
        let launchScreenViewModel = LaunchScreenViewModel()
        
        let launchScreenViewController = LaunchScreenViewController(viewModel: launchScreenViewModel)
        
        self.launchScreenViewController = launchScreenViewController
        
        let navigationController = UINavigationController(rootViewController: launchScreenViewController)
        
        self.navigationController = navigationController
        
        launchScreenViewModel.onInitializeSuccess = {
            UIView.transition(
                with: window,
                duration: 0.25,
                options: [
                    .curveEaseInOut,
                    .transitionCrossDissolve,
                ],
                animations: {
                    navigationController.viewControllers = [
                        ViewController()
                    ]
                },
                completion: nil
            )
        }
    }
    
    @MainActor
    public func start() {
        let window = self.window
        let navigationController = self.navigationController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
