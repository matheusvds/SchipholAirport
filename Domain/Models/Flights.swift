import Foundation

public typealias Flights = [Flight]

public struct Flight: Model {
    public let airlineId: String
    public let flightNumber: Int
    public let departureAirportId: String
    public let arrivalAirportId: String

}

