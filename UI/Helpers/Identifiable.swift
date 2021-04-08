import Foundation

public protocol Identifiable: class {
    static var reuseIdentifier: String { get }
}

public extension Identifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
