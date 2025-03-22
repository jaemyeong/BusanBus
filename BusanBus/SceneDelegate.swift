import UIKit

public final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    public var window: UIWindow?
    
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        assert(scene is UIWindowScene)
        let windowScene = scene as! UIWindowScene
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let viewController = ViewController()
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
