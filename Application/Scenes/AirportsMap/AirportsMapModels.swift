import Foundation
import Domain
import CoreLocation

typealias DisplayedAirport = AirportsMap.GetAirports.ViewModel.DisplayedAirport

enum AirportsMap {
    
    enum GetAirports {
        
        struct Request {}
        
        struct Response {
            let airports: Airports?
        }
        
        struct ViewModel {
            
            let items: [DisplayedAirport]
            
            struct DisplayedAirport {
                let id: String
                let location: CLLocation
            }
        }
    }
}
