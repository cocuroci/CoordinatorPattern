//
//  OnBoardViewController.swift
//  CoordinatorPattern_Example
//
//  Created by Andre Cocuroci on 15/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import CoordinatorPattern

final class OnBoardViewController: ViewControllerCoordinator {
    
    weak var coordinator: Coordinator?
    
    lazy var logoffButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dismiss Onboarding", for: .normal)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoffButton)
        
        NSLayoutConstraint.activate([
            logoffButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoffButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    @objc private func dismissView() {
        coordinator?.didSendNavigationEvent(event: OnBoardNavigationEvent.dismissOnBoarding)
    }
}
