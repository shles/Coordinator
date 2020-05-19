//
//  AuthCoordinator.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class AuthCoordinator: BaseCoordinator {

    var finishFlow: (() -> Void)?
    
    private let dependency: AuthDependency
    private let appRouter: AppRouter

    init(dependency: AuthDependency, appRouter: AppRouter) {
        self.dependency = dependency
        self.appRouter = appRouter
    }

    override func start() {
        showOnboarding()
    }

    func showOnboarding() {
        guard let vc = UIStoryboard(name: "Auth", bundle: nil)
            .instantiateInitialViewController() as? AuthViewController else { return }
        vc.onFinish = finishFlow
        appRouter.setRootViewController(vc)
    }
}
