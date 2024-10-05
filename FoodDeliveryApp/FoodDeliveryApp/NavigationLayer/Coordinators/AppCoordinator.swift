//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Umidjon Fayzimatov on 05/10/24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showOnBoardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}


//MARK: - Navigation Methods
private extension AppCoordinator {
    func showOnBoardingFlow() {
        guard let navigationController = navigationController else { return }
        let onBoardingCoordinator = OnBoardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onBoardingCoordinator)
        onBoardingCoordinator.start()
    }
    
    func showMainFlow() {
        
    }
}


extension AppCoordinator: CoordinatorFinishDelagete {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
    
    
}
