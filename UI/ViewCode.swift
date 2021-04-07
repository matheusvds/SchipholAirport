import Foundation

protocol ViewCode {
    func setup()
    func setupHierarchy()
    func setupConstraints()
    func additionalConfiguration()
}

extension ViewCode {
    func setup() {
        setupHierarchy()
        setupConstraints()
        additionalConfiguration()
    }
    func additionalConfiguration() { }
}
