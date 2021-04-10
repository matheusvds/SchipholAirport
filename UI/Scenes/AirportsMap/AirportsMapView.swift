import Foundation
import MapKit

public typealias AirportsMapViewLogic = AirportsMapViewRepresentable & ViewLoadingEvents

public protocol AirportsMapViewRepresentable {
    var view: UIView { get }
    func set(airportsMapViewModel: AirportsMapViewModelRepresentable)
    func getSelectedLocation() -> AirportLocation?
    func clearSelection()
}

public protocol AirportsMapViewDelegate: AnyObject {
    func didSelectLocation()
}

public final class AirportsMapView: UIView {
    
    public weak var delegate: AirportsMapViewDelegate?
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.delegate = self
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

extension AirportsMapView: AirportsMapViewLogic {

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
    
    public func getSelectedLocation() -> AirportLocation? {
       return mapView.selectedAnnotations.first as? AirportLocation
    }
    
    public func clearSelection() {
        let selectedAnnotation = mapView.selectedAnnotations.first
        self.mapView.deselectAnnotation(selectedAnnotation, animated: true)
    }
    
}

extension AirportsMapView: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let _ = view.annotation as? AirportLocation {
            self.delegate?.didSelectLocation()
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
