import Foundation
import MapKit

public protocol AirportsMapViewModelRepresentable {
    var items: [AirportLocationRepresentable] { get }
}

public protocol AirportLocationRepresentable: MKAnnotation {
    var id: String { get }
}

public struct AirportsMapViewModel: AirportsMapViewModelRepresentable {
    public var items: [AirportLocationRepresentable]

    public init(items: [AirportLocationRepresentable]) {
        self.items = items
    }
}

public final class AirportLocation: NSObject, AirportLocationRepresentable {
    public let id: String
    public let coordinate: CLLocationCoordinate2D
    
    public init(id: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.coordinate = coordinate
    }
}
