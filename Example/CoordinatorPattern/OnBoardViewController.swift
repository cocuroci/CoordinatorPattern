//
//  OnBoardViewController.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 15/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import CoordinatorPattern

class OnBoardViewController: ViewControllerCoordinator {
    
    weak var coordinator: Coordinator?
    
    lazy var logoffButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logoff", for: .normal)
        button.addTarget(self, action: #selector(onLogoff), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(logoffButton)
        
        NSLayoutConstraint.activate([
            logoffButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoffButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    @objc private func onLogoff() {
        coordinator?.didSendNavigationEvent(event: OnBoardNavigationEvent.onLogoff)
    }
}
