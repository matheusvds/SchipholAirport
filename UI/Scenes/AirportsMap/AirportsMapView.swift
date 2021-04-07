import Foundation
import MapKit

public protocol AirportMapViewLogic {
    var view: UIView { get }
    func set(airportsMapViewModel: AirportsMapViewModelRepresentable)
}

public final class AirportsMapView: UIView {
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AirportsMapView: AirportMapViewLogic {

    public var view: UIView {
        return self
    }
    
    public func set(airportsMapViewModel: AirportsMapViewModelRepresentable) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.mapView.addAnnotations(airportsMapViewModel.items)
            self.mapView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        }
    }
    
}

extension AirportsMapView: ViewCode {
    
    func setupHierarchy() {
        addSubview(mapView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
