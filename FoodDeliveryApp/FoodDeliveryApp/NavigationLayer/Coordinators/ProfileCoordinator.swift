//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Umidjon Fayzimatov on 05/10/24.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .black
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}



