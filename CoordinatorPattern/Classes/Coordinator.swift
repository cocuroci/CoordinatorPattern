//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Andre Cocuroci on 15/05/19.
//

public protocol NavigationEvent {}

public protocol Coordinator: AnyObject {
    
    var childrenCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func finish(coordinator: Coordinator)
    func didSendNavigationEvent(event: NavigationEvent)
}

public extension Coordinator {
    func finish(coordinator: Coordinator) {
        childrenCoordinators = childrenCoordinators.filter { $0 !== coordinator }
    }
}

public protocol ViewCoordinator: AnyObject {
    var coordinator: Coordinator? { get set }
}

public typealias ViewControllerCoordinator = UIViewController & ViewCoordinator
