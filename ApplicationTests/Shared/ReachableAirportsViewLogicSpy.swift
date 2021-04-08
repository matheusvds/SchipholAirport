import Foundation
import UI
import UIKit
@testable import Application

final class ReachableAirportsViewLogicSpy: ReachableAirportsViewLogic {
    var view: UIView = UIView()
    
    var setViewModelCalled = false
    var startLoadingCalled = false
    var viewModel: ReachableAirportsViewModelRepresentable?
    
    func set(viewModel: ReachableAirportsViewModelRepresentable) {
        setViewModelCalled = true
        self.viewModel = viewModel
    }
    
    func startLoading(at viewController: UIViewController) {
        startLoadingCalled = true
    }
}


