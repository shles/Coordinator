//
//  OnboardingCoordinator.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

class OnboardingCoordinator: BaseCoordinator {

    var finishFlow: (() -> Void)?

    private let dependency: OnboardingDependency
    private let appRouter: AppRouter

    init(dependency: OnboardingDependency, appRouter: AppRouter) {
        self.dependency = dependency
        self.appRouter = appRouter
    }

    override func start() {
        showOnboarding()
    }

    func showOnboarding() {
        guard let vc = UIStoryboard(name: "Onboarding", bundle: nil)
            .instantiateInitialViewController() as? OnboardingViewController else { return }
        vc.onFinish = finishFlow
        appRouter.setRootViewController(vc)
    }
}
