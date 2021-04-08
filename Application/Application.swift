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
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 0)
        return mapVC
    }
    
    private func makeReachableAirportsTab() -> UIViewController {
        let listVC = sceneFactory.makeReachableAirportScene()
        listVC.tabBarItem = UITabBarItem(title: "Airports", image: UIImage(systemName: "airplane.circle"), tag: 1)
        let navigation = UINavigationController(rootViewController: listVC)
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }
    
}
