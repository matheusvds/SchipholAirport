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
        let sceneFactory = SceneFactory(getAirports: getAirports, getFlights: getFlights)
        let main = Main(sceneFactory: sceneFactory)
        return main
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app.start()
        return true
    }

}

