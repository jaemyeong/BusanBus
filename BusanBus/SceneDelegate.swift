import UIKit

public class SceneDelegate: UIResponder {
    public var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
    public func sceneDidEnterBackground(_ scene: UIScene) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        delegate.saveContext()
    }
}
