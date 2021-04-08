import Foundation
import UIKit
import UI

protocol AirportDetailDisplayLogic: AnyObject {
    func displayAirportDetail(viewModel: AirportDetail.GetDetail.ViewModel)
}

final class AirportDetailViewController: UIViewController {
    
    private let interactor: AirportDetailBusinessLogic
    private let viewLogic: AirportDetailViewLogic
    private let myView = AirportDetailView()
    let router: AirportDetailRouterLogic
    var dismissBlock: (() -> Void)?
    
    init(interactor: AirportDetailBusinessLogic, viewLogic: AirportDetailViewLogic, router: AirportDetailRouterLogic) {
        self.interactor = interactor
        self.viewLogic = viewLogic
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
       {
           let touch = touches.first
           if touch?.view == self.view
           { self.dismiss(animated: true, completion: dismissBlock) }
       }
}

extension AirportDetailViewController: AirportDetailDisplayLogic {
    
    func displayAirportDetail(viewModel: AirportDetail.GetDetail.ViewModel) {
        
    }
}

