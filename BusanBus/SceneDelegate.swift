import UIKit

import BusanBusCoordinator

import ErrorKit

public class SceneDelegate: UIResponder {
    public var window: UIWindow?
    
    public var coordinator: SceneCoordinator?
}

extension SceneDelegate: UIWindowSceneDelegate {
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError(String(describing: TypeCastingError()))
        }
        
        let window = UIWindow(windowScene: windowScene)
        
        let coordinator = SceneCoordinator(window: window)
        
        self.window = window
        
        self.coordinator = coordinator
        
        coordinator.launch()
    }
}
