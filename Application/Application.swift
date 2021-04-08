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
        let listTab = makeReacheableAirportsTab()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabBar = UITabBarController()
        tabBar.viewControllers = [mapTab, listTab]
        window.rootViewController = tabBar
        self.window = window
        
        window.makeKeyAndVisible()
    }
    
    private func makeAirportsMapTab() -> UIViewController {
        let mapVC = sceneFactory.makeAirportsMapScene()
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 0)
        return mapVC
    }
    
    private func makeReacheableAirportsTab() -> UIViewController {
        let listVC = sceneFactory.makeReacheableAirportScene()
        listVC.tabBarItem = UITabBarItem(title: "Airports", image: UIImage(systemName: "airplane.circle"), tag: 1)
        let navigation = UINavigationController(rootViewController: listVC)
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }
    
}
