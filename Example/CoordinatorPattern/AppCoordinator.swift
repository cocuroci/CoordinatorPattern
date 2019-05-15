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
    
    var childrenCoordinators: [Coordinator] = [] {
        didSet {
            debugPrint(childrenCoordinators)
        }
    }
    
    weak var parentCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let random = Int.random(in: 0...1)
        
        if random == 0 {
            startLoginCoordinator()
        } else {
            startOnBoardCoordinator()
        }
    }
    
    func didSendNavigationEvent(event: NavigationEvent) {
        switch event {
        case LoginNavigationEvent.onLogin:
            startOnBoardCoordinator()
        case OnBoardNavigationEvent.onLogoff:
            startLoginCoordinator()
        default: ()
        }
    }
    
    private func startLoginCoordinator() {
        let loginCoordinator = LoginCoordinator(window: window)
        childrenCoordinators.append(loginCoordinator)
        loginCoordinator.parentCoordinator = self
        loginCoordinator.start()
    }
    
    private func startOnBoardCoordinator() {
        let onBoardCoordinator = OnBoardCoordinator(window: window)
        childrenCoordinators.append(onBoardCoordinator)
        onBoardCoordinator.parentCoordinator = self
        onBoardCoordinator.start()
    }
}
