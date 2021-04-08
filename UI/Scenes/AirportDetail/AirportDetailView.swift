import Foundation
import UIKit

public protocol AirportDetailViewLogic {
    var view: UIView { get }
    func set(viewModel: AirportDetailViewModel)
}

public final class AirportDetailView: UIView {
    
    private lazy var title: UILabel = {
       let view = UILabel()
        view.text = "Airport details"
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        view.textAlignment = .center
        return view
    }()
    
    private lazy var airportName: UILabel = {
        let view = UILabel()
        view.text = "Norman Y. Mineta San Jose International Airport"
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        return view
    }()
    
    private lazy var pinImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "mappin.circle.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var location: UILabel = {
        let view = UILabel()
        view.text = "62.559643, -4.489616"
        view.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var city: UILabel = {
        let view = UILabel()
        view.text = "Amsterdam"
        view.text = view.text?.uppercased()
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var countryId: UILabel = {
        let view = UILabel()
        view.text = "NL"
        view.text = view.text?.uppercased()
        view.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var airportID: UILabel = {
        let view = UILabel()
        view.text = "AMS"
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        view.font = UIFont.systemFont(ofSize: 40, weight: .black)
        return view
    }()
    
    private lazy var nearestAirportNameTitle: UILabel = {
        let view = UILabel()
        view.text = "nearest airport"
        view.font = UIFont.boldSystemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nearestAirportName: UILabel = {
        let view = UILabel()
        view.text = "Norman International Airport"
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 13, weight: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nearestAirportDistanceTitle: UILabel = {
        let view = UILabel()
        view.text = "distance to nearest airport"
        view.font = UIFont.boldSystemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nearestAirportDistance: UILabel = {
        let view = UILabel()
        view.text = "20 km"
        view.font = UIFont.systemFont(ofSize: 13, weight: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var container: UIView = {
      let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        container.roundCorners([.topLeft, .topRight], radius: 20)
    }
}

extension AirportDetailView: AirportDetailViewLogic {
    
    public var view: UIView {
        return self
    }
    
    public func set(viewModel: AirportDetailViewModel) {
        self.airportName.text = viewModel.airportName
        self.location.text = viewModel.location
        self.city.text = viewModel.city
        self.countryId.text = viewModel.countryID
        self.airportID.text = viewModel.airportID
        self.nearestAirportName.text = viewModel.nearestAirport
        self.nearestAirportDistance.text = viewModel.nearestAirportDistance
    }
    
}

extension AirportDetailView: ViewCode {
    
    func setupHierarchy() {
        addSubview(container)
        container.addSubview(title)
        container.addSubview(airportName)
        container.addSubview(pinImage)
        container.addSubview(location)
        container.addSubview(city)
        container.addSubview(countryId)
        container.addSubview(airportID)
        container.addSubview(nearestAirportNameTitle)
        container.addSubview(nearestAirportName)
        container.addSubview(nearestAirportDistanceTitle)
        container.addSubview(nearestAirportDistance)
    }
    
    func setupConstraints() {
        let imageSize: CGFloat = 20
        let countryIdEstimatedWidth: CGFloat = 20
        let textSpacing: CGFloat = 10
        let padding: CGFloat = 20
        let topMargin: CGFloat = 24
        let bottomMargin: CGFloat = 30
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.centerYAnchor),
            container.widthAnchor.constraint(equalTo: self.widthAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: container.topAnchor, constant: topMargin),
            title.widthAnchor.constraint(equalTo: container.widthAnchor),
            title.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            airportName.topAnchor.constraint(equalTo: title.bottomAnchor, constant: textSpacing*(3/2)),
            airportName.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -padding),
            airportName.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pinImage.widthAnchor.constraint(equalToConstant: imageSize),
            pinImage.heightAnchor.constraint(equalTo: pinImage.widthAnchor),
            pinImage.centerYAnchor.constraint(equalTo: location.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: airportName.bottomAnchor, constant: textSpacing/2),
            location.leadingAnchor.constraint(equalTo: pinImage.trailingAnchor, constant: textSpacing),
            location.centerXAnchor.constraint(equalTo: airportName.centerXAnchor, constant: (textSpacing + imageSize)/2)
        ])
        
        NSLayoutConstraint.activate([
            city.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 2*textSpacing),
            city.centerXAnchor.constraint(equalTo: airportName.centerXAnchor, constant: -(textSpacing + countryIdEstimatedWidth)/2)
        ])
        
        NSLayoutConstraint.activate([
            countryId.leadingAnchor.constraint(equalTo: city.trailingAnchor, constant: textSpacing/2),
            countryId.centerYAnchor.constraint(equalTo: city.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            airportID.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 2*textSpacing),
            airportID.leadingAnchor.constraint(equalTo: airportName.leadingAnchor, constant: textSpacing),
            airportID.heightAnchor.constraint(equalTo: airportID.widthAnchor),
            airportID.widthAnchor.constraint(equalToConstant: 110),
            airportID.bottomAnchor.constraint(greaterThanOrEqualTo: container.bottomAnchor, constant: -bottomMargin)
        ])
        
        NSLayoutConstraint.activate([
            nearestAirportNameTitle.topAnchor.constraint(equalTo: airportID.topAnchor),
            nearestAirportNameTitle.leadingAnchor.constraint(equalTo: airportID.trailingAnchor, constant: textSpacing)
        ])
        
        NSLayoutConstraint.activate([
            nearestAirportName.topAnchor.constraint(equalTo: nearestAirportNameTitle.bottomAnchor, constant: textSpacing/3),
            nearestAirportName.leadingAnchor.constraint(equalTo: nearestAirportNameTitle.leadingAnchor),
            nearestAirportName.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding)
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
    
    func additionalConfiguration() {
        backgroundColor = .clear
    }
    
}