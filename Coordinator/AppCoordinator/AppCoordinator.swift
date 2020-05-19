//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

final class AppCoordinator: BaseCoordinator {

    private let appRouter: AppRouter
    private let dependency: AppDependency

    init(dependency: AppDependency, appRouter: AppRouter) {
        self.appRouter = appRouter
        self.dependency = dependency
    }

    private var launchFlow: LaunchFlow {
        LaunchFlow.build()
    }

    override func start(with deepLink: DeepLink?) {
        switch launchFlow {
        case .auth:
            runAuthFlow(deepLink)
        case .onboarding:
            runOnboardingFlow(deepLink)
        case .tabs:
            runTabsFlow(deepLink)
        }
    }

    private func runAuthFlow(_ deepLink: DeepLink?) {
        let coordinator = AuthCoordinator(dependency: dependency.authDependency, appRouter: appRouter)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            LaunchFlow.authenticated = true
            self.start(with: deepLink)
            self.detachChild(coordinator)
        }
        attachChild(coordinator)
        coordinator.start()
    }

    private func runOnboardingFlow(_ deepLink: DeepLink?) {
        let coordinator = OnboardingCoordinator(dependency: dependency.onboardingDependency, appRouter: appRouter)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            LaunchFlow.onboardingWasShown = true
            self.start(with: deepLink)
            self.detachChild(coordinator)
        }
        attachChild(coordinator)
        coordinator.start()
    }

    private func runTabsFlow(_ deepLink: DeepLink?) {
        let coordinator = TabsCoordinator(dependency: dependency.tabsDependency, appRouter: appRouter)
        attachChild(coordinator)
        coordinator.start(with: deepLink)
    }
}
