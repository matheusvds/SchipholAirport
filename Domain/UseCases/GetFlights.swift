import Foundation

public protocol GetFlights {
    
    typealias Result = Swift.Result<Flights, DomainError>
    func getFlights(getFlightsModel: GetFlightsModel, completion: @escaping (Result) -> Void)
}

public struct GetFlightsModel {
    public init() { }
}
