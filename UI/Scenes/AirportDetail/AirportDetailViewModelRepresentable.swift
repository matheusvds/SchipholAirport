import Foundation

public protocol AirportDetailViewModelRepresentable {
    var airportName: String { get }
    var location: String { get }
    var city: String { get }
    var countryID: String { get }
    var airportID: String { get }
    var nearestAirport: String { get }
    var nearestAirportDistance: String { get }
}


public struct AirportDetailViewModel: AirportDetailViewModelRepresentable {
    public var airportName: String
    public var location: String
    public var city: String
    public var countryID: String
    public var airportID: String
    public var nearestAirport: String
    public var nearestAirportDistance: String
    
    public init(
        airportName: String,
        location: String,
        city: String,
        countryID: String,
        airportID: String,
        nearestAirport: String,
        nearestAirportDistance: String
    ) {
        self.airportName = airportName
        self.location = location
        self.city = city
        self.countryID = countryID
        self.airportID = airportID
        self.nearestAirport = nearestAirport
        self.nearestAirportDistance = nearestAirportDistance
    }
}
