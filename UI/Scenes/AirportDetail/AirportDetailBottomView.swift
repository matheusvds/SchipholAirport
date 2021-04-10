import Foundation
import UIKit

final class AirportDetailBottomView: UIView {

    lazy var airportID: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        view.font = UIFont.systemFont(ofSize: 40, weight: .black)
        return view
    }()
    
    lazy var nearestAirportNameTitle: UILabel = {
        let view = UILabel()
        view.text = NSLocalizedString("nearest_airport", comment: "nearest airport title")
        view.font = UIFont.boldSystemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var nearestAirportName: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 13, weight: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nearestAirportDistanceTitle: UILabel = {
        let view = UILabel()
        view.text = NSLocalizedString("distance_nearest", comment: "nearest distance title")
        view.font = UIFont.boldSystemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var nearestAirportDistance: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 13, weight: .light)
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

// MARK: - ViewCode
extension AirportDetailBottomView: ViewCode {
    func setupHierarchy() {
        addSubview(airportID)
        addSubview(nearestAirportNameTitle)
        addSubview(nearestAirportName)
        addSubview(nearestAirportDistanceTitle)
        addSubview(nearestAirportDistance)
    }
    
    func setupConstraints() {
        let textSpacing: CGFloat = 10
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            airportID.topAnchor.constraint(equalTo: self.topAnchor),
            airportID.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: textSpacing),
            airportID.widthAnchor.constraint(equalToConstant: 110),
            airportID.heightAnchor.constraint(equalTo: airportID.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nearestAirportNameTitle.topAnchor.constraint(equalTo: airportID.topAnchor),
            nearestAirportNameTitle.leadingAnchor.constraint(equalTo: airportID.trailingAnchor, constant: textSpacing)
        ])
        
        NSLayoutConstraint.activate([
            nearestAirportName.topAnchor.constraint(equalTo: nearestAirportNameTitle.bottomAnchor, constant: textSpacing/3),
            nearestAirportName.leadingAnchor.constraint(equalTo: nearestAirportNameTitle.leadingAnchor),
            nearestAirportName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            nearestAirportDistanceTitle.topAnchor.constraint(equalTo: nearestAirportName.bottomAnchor, constant: textSpacing),
            nearestAirportDistanceTitle.leadingAnchor.constraint(equalTo: nearestAirportName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nearestAirportDistance.topAnchor.constraint(equalTo: nearestAirportDistanceTitle.bottomAnchor, constant: textSpacing/3),
            nearestAirportDistance.leadingAnchor.constraint(equalTo: nearestAirportDistanceTitle.leadingAnchor),
        ])
    }
}
