import UIKit

public final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    public var window: UIWindow?
    
    public var coordinator: AppCoordinator?
    
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        assert(scene is UIWindowScene)
        let windowScene = scene as! UIWindowScene
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let coordinator = AppCoordinator(window: window)
        self.coordinator = coordinator
        
        coordinator.start()
    }
}
