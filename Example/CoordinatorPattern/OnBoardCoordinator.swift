//
//  OnBoardCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 15/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoordinatorPattern

enum OnBoardNavigationEvent: NavigationEvent {
    case openOnBoarding
    case dismissOnBoarding
}

final class OnBoardCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let presenterViewController: UIViewController
    
    lazy var rootViewController: ViewControllerCoordinator = {
        return OnBoardViewController()
    }()
    
    var childrenCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: Coordinator?
    
    init(presenterViewController: UIViewController) {
        self.presenterViewController = presenterViewController
        self.navigationController = UINavigationController()
    }
    
    func start() {
        navigationController.viewControllers = [self.rootViewController]
        rootViewController.coordinator = self
        presenterViewController.present(navigationController, animated: true, completion: nil)
    }
    
    func didSendNavigationEvent(event: NavigationEvent) {
        parentCoordinator?.didSendNavigationEvent(event: event)
        parentCoordinator?.finish(coordinator: self)
    }
}
