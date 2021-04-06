import Foundation

public enum Airport {
    
    public enum Resource {
        
        case getAirports
        
        var name: String {
            switch self {
            case .getAirports:
                return "airports.json"
            }
        }

    }
}
