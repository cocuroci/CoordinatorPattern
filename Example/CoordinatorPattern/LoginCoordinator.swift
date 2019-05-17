//
//  LoginCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 15/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoordinatorPattern

enum LoginNavigationEvent: NavigationEvent {
    case onLogin
    case openLogin
    case dismissLogin
}

final class LoginCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let presenterViewController: UIViewController
    
    lazy var rootViewController: ViewControllerCoordinator = {
        return LoginViewController()
    }()
    
    var childrenCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: Coordinator?
    
    init(presenterViewController: UIViewController) {
        self.presenterViewController = presenterViewController
        self.navigationController = UINavigationController()
        navigationController.setViewControllers([rootViewController], animated: false)
    }
    
    func start() {
        rootViewController.coordinator = self
        presenterViewController.present(navigationController, animated: true, completion: nil)
    }
    
    func didSendNavigationEvent(event: NavigationEvent) {
        parentCoordinator?.didSendNavigationEvent(event: event)
        parentCoordinator?.finish(coordinator: self)
    }
}
