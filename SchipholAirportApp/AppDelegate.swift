import UIKit
import Application
import Infra
import Data

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var app: Application = { [weak self] in
        let httpClient = URLSessionAdapter()
        let getAirports = RemoteGetAirports(httpClient: httpClient)
        let getFlights = RemoteGetFlights(httpClient: httpClient)
        let main = Main(getAirports: getAirports, getFlights: getFlights)
        main.window = self?.window
        return main
    }()

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app.start()
        return true
    }

}

