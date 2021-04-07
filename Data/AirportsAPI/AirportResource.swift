import Foundation

public enum Airport {
    
    public enum Resource {
        
        case getAirports
        case getFlights
        
        var name: String {
            switch self {
            case .getAirports:
                return "airports.json"
            case .getFlights:
                return "flights.json"
            }
        }

    }
}
