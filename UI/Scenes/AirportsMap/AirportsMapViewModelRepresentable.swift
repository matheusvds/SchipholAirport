import Foundation
import MapKit

public protocol AirportsMapViewModelRepresentable {
    var items: [AirportLocationRepresentable] { get }
}

public protocol AirportLocationRepresentable: MKAnnotation {

}

public struct AirportsMapViewModel: AirportsMapViewModelRepresentable {
    public var items: [AirportLocationRepresentable]

    public init(items: [AirportLocationRepresentable]) {
        self.items = items
    }
}

public final class AirportLocation: NSObject, AirportLocationRepresentable {
    public let coordinate: CLLocationCoordinate2D
    public let title: String?
    public var subtitle: String?
    
    public init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
