import Foundation
import Domain
import UI

typealias DisplayedItems = UI.ReachableAirportsItem

enum ReachableAirports {
    
    enum GetAirports {
        
        struct Request {}
        
        struct Response {
            let flights: Flights?
            let airports: Airports?
        }
        
        typealias ViewModel = ReachableAirportsViewModel
        
    }
    
}
