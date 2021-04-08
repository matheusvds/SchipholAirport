import Foundation
import UIKit

public typealias ReachableAirportsViewLogic = ReachableAirportsViewRepresentable & ViewLoadingEvents

public protocol ReachableAirportsViewRepresentable {
    var view: UIView { get }
    func set(viewModel: ReachableAirportsViewModelRepresentable)
}

public final class ReachableAirportsView: UIView {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        view.dataSource = self
        return view
    }()
    
    private var items: [ReachableAirportsItemRepresentable] = []
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ReachableAirportsView: ReachableAirportsViewLogic {

    public var view: UIView {
        return self
    }
    
    public func set(viewModel: ReachableAirportsViewModelRepresentable) {
        items = viewModel.items
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
 
extension ReachableAirportsView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
}

extension ReachableAirportsView: ViewCode {
    
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

