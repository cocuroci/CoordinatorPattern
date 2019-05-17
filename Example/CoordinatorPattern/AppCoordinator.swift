//
//  AppCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 15/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoordinatorPattern

final class AppCoordinator: Coordinator {
    
    private var window: UIWindow
    
    var childrenCoordinators: [Coordinator] = [] 
    
    lazy var rootViewController: ViewControllerCoordinator = {
        return MainViewController()
    }()
    
    weak var parentCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        rootViewController.coordinator = self
        window.rootViewController = rootViewController
    }
    
    func didSendNavigationEvent(event: NavigationEvent) {
        switch event {
        case LoginNavigationEvent.openLogin:
            startLoginCoordinator()
        case OnBoardNavigationEvent.openOnBoarding:
            startOnBoardCoordinator()
        default:
            dismissChildrenCoordinator()
        }
    }
    
    private func startLoginCoordinator() {
        let loginCoordinator = LoginCoordinator(presenterViewController: rootViewController)
        childrenCoordinators.append(loginCoordinator)
        loginCoordinator.parentCoordinator = self
        loginCoordinator.start()
    }
    
    private func startOnBoardCoordinator() {
        let onBoardCoordinator = OnBoardCoordinator(presenterViewController: rootViewController)
        childrenCoordinators.append(onBoardCoordinator)
        onBoardCoordinator.parentCoordinator = self
        onBoardCoordinator.start()
    }
    
    private func dismissChildrenCoordinator() {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
