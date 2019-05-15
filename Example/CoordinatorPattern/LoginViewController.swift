//
//  LoginViewController.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 15/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import CoordinatorPattern

class LoginViewController: ViewControllerCoordinator {
    
    weak var coordinator: Coordinator?
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func onLogin() {
        coordinator?.didSendNavigationEvent(event: LoginNavigationEvent.onLogin)
    }
}
