import Foundation
import Domain
import UIKit
import UI

public protocol Application {
    func start()
}

public class Main: Application {
    
    public var window: UIWindow?
    
    private let getAirports: GetAirports
    private let getFlights: GetFlights
    
    public init(getAirports: GetAirports, getFlights: GetFlights) {
        self.getAirports = getAirports
        self.getFlights = getFlights
    }
    
    public func start() {
        let vc = makeAirportsMap()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: vc)
        window.rootViewController = navigation
        self.window = window
        
        window.makeKeyAndVisible()
    }
    
    private func makeAirportsMap() -> AirportsMapViewController {
        let presenter = AirportsMapPresenter()
        let interactor = AirportsMapInteractor(getAirports: getAirports)
        let view = AirportsMapView()
        let viewController = AirportsMapViewController(interactor: interactor, viewLogic: view)
        
        view.delegate = viewController
        presenter.displayLogic = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
