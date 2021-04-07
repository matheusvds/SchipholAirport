import Foundation

public protocol GetAirports {
    
    typealias Result = Swift.Result<Airports, DomainError>
    func getAirports(getAirportsModel: GetAirportsModel, completion: @escaping (Result) -> Void)
}

public struct GetAirportsModel {
    public init() { }
}
