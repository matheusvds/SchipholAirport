import Foundation
import UIKit
import UI

protocol AirportDetailDisplayLogic: AnyObject {
    func displayAirportDetail(viewModel: AirportDetail.GetDetail.ViewModel)
}

final class AirportDetailViewController: UIViewController {
    
    private let interactor: AirportDetailBusinessLogic
    private let viewLogic: AirportDetailViewLogic
    let router: AirportDetailRouterLogic
    var dismissBlock: (() -> Void)?
    
    init(interactor: AirportDetailBusinessLogic, viewLogic: AirportDetailViewLogic, router: AirportDetailRouterLogic) {
        self.interactor = interactor
        self.viewLogic = viewLogic
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = viewLogic.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresentationControllerDelegate()
        start()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func start() {
        interactor.fetchAirportDetail(request: AirportDetail.GetDetail.Request())
    }
    
    private func setupPresentationControllerDelegate() {
        self.presentationController?.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == self.view {
            self.dismiss(animated: true, completion: dismissBlock)
        }
    }
}

extension AirportDetailViewController: AirportDetailDisplayLogic {
    
    func displayAirportDetail(viewModel: AirportDetail.GetDetail.ViewModel) {
        viewLogic.set(viewModel: viewModel)
    }
}

extension AirportDetailViewController: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        dismissBlock?()
    }
}
