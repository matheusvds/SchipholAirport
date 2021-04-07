import Foundation

public typealias Airports = [Airport]

public struct Airport: Model {
    let id: String
    let latitude: Double
    let longitude: Double
    let name: String
    let city: String
    let countryId: String
}
