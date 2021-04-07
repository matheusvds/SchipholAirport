import Foundation
import Domain
import CoreLocation
import UI

typealias DisplayedLocations = UI.AirportLocation

enum AirportsMap {
    
    enum GetAirports {
        
        struct Request {}
        
        struct Response {
            let airports: Airports?
        }
        
        typealias ViewModel = AirportsMapViewModel
    }
}
