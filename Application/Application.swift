import Foundation
import UIKit

public protocol Application {
    func start()
}

public class Main: Application {
    
    public var window: UIWindow?

    let sceneFactory: SceneFactoryRepresentable
    
    public init(sceneFactory: SceneFactoryRepresentable) {
        self.sceneFactory = sceneFactory
    }
    
    public func start() {
        let vc = sceneFactory.makeAirportsMapScene()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: vc)
        window.rootViewController = navigation
        self.window = window
        
        window.makeKeyAndVisible()
    }
    
}
