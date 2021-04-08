import Foundation
import Domain
import UI

enum AirportDetail {
    
    enum GetDetail {
        
        struct Request {}
        
        struct Response {
            let selectedAirport: Airport
            let airports: Airports
        }
        
        typealias ViewModel = AirportDetailViewModel
    }
}
