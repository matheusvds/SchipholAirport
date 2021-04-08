import Foundation

public protocol ReachableAirportsViewModelRepresentable {
    
    var items: [ReachableAirportsItemRepresentable] { get }
}

public protocol ReachableAirportsItemRepresentable {
    var id: String { get }
    var name: String { get }
    var distance: String { get }
}

public struct ReachableAirportsViewModel: ReachableAirportsViewModelRepresentable {
    
    public var items: [ReachableAirportsItemRepresentable]
    
    public init(items: [ReachableAirportsItemRepresentable]) {
        self.items = items
    }
}

public struct ReachableAirportsItem: ReachableAirportsItemRepresentable {
    
    public var id: String
    public var name: String
    public var distance: String
    
    public init(id: String, name: String, distance: String) {
        self.id = id
        self.name = name
        self.distance = distance
    }
}
