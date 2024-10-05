//
//  OnBoardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Umidjon Fayzimatov on 05/10/24.
//

import UIKit


class OnBoardingCoordinator: Coordinator {
    
    override func start() {
       showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}



private extension OnBoardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .purple
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .yellow
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .red
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
