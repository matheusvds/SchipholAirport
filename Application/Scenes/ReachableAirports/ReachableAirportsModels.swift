import Foundation
import Domain

typealias DisplayedItems = ReachableAirports.GetAirports.ViewModel.Item

enum ReachableAirports {
    
    enum GetAirports {
        
        struct Request {}
        
        struct Response {
            let flights: Flights?
            let airports: Airports?
        }
        
        struct ViewModel {
            
            let items: [Item]
            
            struct Item {
                let id: String
                let name: String
                let distance: String
            }
        }
        
    }
    
}
