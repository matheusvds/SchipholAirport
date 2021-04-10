import Foundation
import Domain
import UIKit
import UI

public typealias SceneFactoryRepresentable = AirportsMapFactory & AirportDetailFactory & ReachableAirportFactory

public protocol AirportsMapFactory: AnyObject {
    func makeAirportsMapScene() -> UIViewController
}

public protocol AirportDetailFactory: AnyObject {
    func makeAirportDetailScene() -> UIViewController
}

public protocol ReachableAirportFactory: AnyObject {
    func makeReachableAirportScene() -> UIViewController
}

protocol ReachableAirportsDataSharing: AnyObject {
    var reachableAirportsDataPassing: ReachableAirportsDataPassing? { get set }
}

final public class SceneFactory: SceneFactoryRepresentable, ReachableAirportsDataSharing {
    
    var reachableAirportsDataPassing: ReachableAirportsDataPassing?
    
    private let getAirports: GetAirports
    private let getFlights: GetFlights
    
    public init(getAirports: GetAirports, getFlights: GetFlights) {
        self.getAirports = getAirports
        self.getFlights = getFlights
    }
    
    public func makeAirportsMapScene() -> UIViewController {
        let presenter = AirportsMapPresenter()
        let interactor = AirportsMapInteractor(getAirports: getAirports)
        let view = AirportsMapView()
        let router = AirportsMapRouter()
        let viewController = AirportsMapViewController(interactor: interactor, viewLogic: view, router: router)
        
        view.delegate = viewController
        router.airportDetailFactory = self
        router.reachableAirportsDataSharing = self
        router.dataStore = interactor
        router.viewController = viewController
        presenter.displayLogic = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    public func makeAirportDetailScene() -> UIViewController {
        let presenter = AirportDetailPresenter()
        let interactor = AirportDetailInteractor()
        let view = AirportDetailView()
        let router = AirportDetailRouter()
        let viewController = AirportDetailViewController(interactor: interactor, viewLogic: view, router: router)
        
        router.dataStore = interactor
        router.viewController = viewController
        presenter.viewController = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    public func makeReachableAirportScene() -> UIViewController {
        let presenter = ReachableAirportsPresenter()
        let interactor = ReachableAirportsInteractor(getFlights: getFlights)
        let view = ReachableAirportsView()
        let router = ReachableAirportsRouter()
        let viewController = ReachableAirportsViewController(interactor: interactor, viewLogic: view, router: router)
        
        router.dataStore = interactor
        router.viewController = viewController
        presenter.viewController = viewController
        interactor.presenter = presenter
        reachableAirportsDataPassing = router
        
        return viewController
    }
}
