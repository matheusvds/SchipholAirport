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
        let mapTab = makeAirportsMapTab()
        let listTab = makeReachableAirportsTab()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = true
        tabBarController.viewControllers = [mapTab, listTab]
        window.rootViewController = tabBarController
        self.window = window
        
        window.makeKeyAndVisible()
    }
    
    private func makeAirportsMapTab() -> UIViewController {
        let mapVC = sceneFactory.makeAirportsMapScene()
        let title = NSLocalizedString("map", comment: "map tabbar item")
        mapVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: "map"), tag: 0)
        return mapVC
    }
    
    private func makeReachableAirportsTab() -> UIViewController {
        let listVC = sceneFactory.makeReachableAirportScene()
        let title = NSLocalizedString("airports", comment: "airport tabbar item")
        listVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: "airplane.circle"), tag: 1)
        let navigation = UINavigationController(rootViewController: listVC)
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }
    
}
