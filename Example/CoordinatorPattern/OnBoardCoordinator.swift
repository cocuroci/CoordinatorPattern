//
//  OnBoardCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 15/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoordinatorPattern

enum OnBoardNavigationEvent: NavigationEvent {
    case onLogoff
}

final class OnBoardCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    lazy var rootViewController: ViewControllerCoordinator = {
        return OnBoardViewController()
    }()
    
    var childrenCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: Coordinator?
    
    deinit {
        debugPrint("OnBoardCoordinator \(#function)")
    }
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        self.navigationController.viewControllers = [self.rootViewController]
        self.rootViewController.coordinator = self
        self.window.rootViewController = self.navigationController
    }
    
    func didSendNavigationEvent(event: NavigationEvent) {
        parentCoordinator?.didSendNavigationEvent(event: event)
        parentCoordinator?.finish(coordinator: self)
    }
}
