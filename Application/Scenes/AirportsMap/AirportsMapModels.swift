import Foundation
import Domain
import CoreLocation
import UI

typealias DisplayedLocations = AirportsMap.GetAirports.ViewModel.DisplayedLocations

enum AirportsMap {
    
    enum GetAirports {
        
        struct Request {}
        
        struct Response {
            let airports: Airports?
        }
        
        struct ViewModel {
            
            let items: [DisplayedLocations]
            
            struct DisplayedLocations {
                let id: String
                let location: CLLocation
            }
        }
    }
}
