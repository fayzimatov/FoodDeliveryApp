//
//  TabBarController.swift
//  FoodDeliveryApp
//
//  Created by Umidjon Fayzimatov on 05/10/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = AppColors.background
        tabBar.tintColor = AppColors.accentOrange
    }
    
}

