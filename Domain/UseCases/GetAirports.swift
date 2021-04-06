import Foundation

public protocol GetAirports {
    
    typealias Result = Swift.Result<Airports, GetAirportError>
    func getAirports(getAirportsModel: GetAirportsModel, completion: @escaping (Result) -> Void)
}

public struct GetAirportsModel { }
