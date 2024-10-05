//
//  Coordinator.swift
//  FoodDeliveryApp
//
//  Created by Umidjon Fayzimatov on 05/10/24.
//

import UIKit


enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
    
}


protocol CoordinatorProtocol: AnyObject {
    
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelagete? { get set }
    
    func start()
    func finish()
    
}


extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}


protocol CoordinatorFinishDelagete: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
    
}


protocol TabBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarController: UITabBarController? { get set }
}


class Coordinator: CoordinatorProtocol {
    var childCoordinators: [any CoordinatorProtocol]
    
    var type: CoordinatorType
    
    var navigationController: UINavigationController?
    
    var finishDelegate: (any CoordinatorFinishDelagete)?
    
    init(childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), type: CoordinatorType, navigationController: UINavigationController, finishDelegate: (any CoordinatorFinishDelagete)? = nil) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    
    //Чтобы узнат координатор уничтожен
    deinit {
        print("Coordinator deinited \(type)")
        childCoordinators.forEach{ $0.finishDelegate = nil }
        childCoordinators.removeAll()
    }
    
    
    func start() {
        print("start")
    }
    
    func finish() {
        print("finish")
    }
    
    
}
