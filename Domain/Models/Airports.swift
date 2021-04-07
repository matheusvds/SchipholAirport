import Foundation

public typealias Airports = [Airport]

public struct Airport: Model {
    public let id: String
    public let latitude: Double
    public let longitude: Double
    public let name: String
    public let city: String
    public let countryId: String
}
