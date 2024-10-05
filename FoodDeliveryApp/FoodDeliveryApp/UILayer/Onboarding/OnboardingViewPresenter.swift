//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Umidjon Fayzimatov on 05/10/24.
//

import UIKit


protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}


class OnboardingViewPresenter: OnboardingViewOutput {
    
    //MARK: - Properties
    weak var coordinator: OnBoardingCoordinator!
    
    
    init(coordinator: OnBoardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    
    func onboardingFinish() {
        coordinator.finish()
    }
    
}
