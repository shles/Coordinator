//
//  BaseCoordinator.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

class BaseCoordinator {

    private var childCoordinators: [BaseCoordinator] = []

    func start() {
        start(with: nil)
    }

    func start(with deepLink: DeepLink?) { }

    func attachChild(_ coordinator: BaseCoordinator) {
        if childCoordinators.contains(where: { $0 === coordinator }) { return }
        childCoordinators.append(coordinator)
    }

    func detachChild(_ coordinator: BaseCoordinator) {
        if childCoordinators.isEmpty { return }

        if !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.detachChild($0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func detachAllChilds() {
        childCoordinators.removeAll()
    }
}
