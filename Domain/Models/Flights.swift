import Foundation

public typealias Flights = [Flight]

public struct Flight: Model {
    let airlineId: String
    let flightNumber: Int
    let departureAirportId: String
    let arrivalAirportId: String

}

