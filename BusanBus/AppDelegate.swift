import UIKit
import Core

public final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: UISceneConfiguration.defaultConfiguration.rawValue, sessionRole: connectingSceneSession.role)
        configuration.delegateClass = SceneDelegate.self
        
        return configuration
    }
}
