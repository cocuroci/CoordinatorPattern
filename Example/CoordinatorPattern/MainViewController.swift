//
//  MainViewController.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 17/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import CoordinatorPattern

final class MainViewController: ViewControllerCoordinator {
    
    weak var coordinator: Coordinator?
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(openLogin), for: .touchUpInside)
        return loginButton
    }()
    
    lazy var onBoardButton: UIButton = {
        let onBoardButton = UIButton(type: .system)
        onBoardButton.translatesAutoresizingMaskIntoConstraints = false
        onBoardButton.setTitle("On Boarding", for: .normal)
        onBoardButton.addTarget(self, action: #selector(openOnboarding), for: .touchUpInside)
        return onBoardButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(onBoardButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func openLogin() {
        coordinator?.didSendNavigationEvent(event: LoginNavigationEvent.openLogin)
    }
    
    @objc private func openOnboarding() {
        coordinator?.didSendNavigationEvent(event: OnBoardNavigationEvent.openOnBoarding)
    }
}
