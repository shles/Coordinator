//
//  TabsCoordinator.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class TabsCoordinator: BaseCoordinator {

    private let router: Router
    private let dependency: TabsDependency

    init(dependency: TabsDependency, router: Router) {
        self.dependency = dependency
        self.router = router
    }

    override func start(with deepLink: DeepLink?) {
        let tabBar = makeTabBar(with: deepLink)
        router.setRootViewController(tabBar, hideBar: true)
    }

    private func makeTabBar(with deepLink: DeepLink?) -> TabBarController {
        let tabs = [
            TabBarController.Tab(onSelectFlow: runFeedFlow(with: deepLink),
                                 title: "Feed",
                                 imageName: "tab.feed"),
            TabBarController.Tab(onSelectFlow: runDocumentsFlow(),
                                 title: "Documents",
                                 imageName: "tab.documents"),
            TabBarController.Tab(onSelectFlow: runProfileFlow(),
                                 title: "Profile",
                                 imageName: "tab.profile")
        ]
        return TabBarController(tabs: tabs, selectedOnLoadIndex: 0)
    }

    // MARK: - Tab flow

    private func runFeedFlow(with deepLink: DeepLink?) -> ((UINavigationController) -> Void) {
        return { [unowned self] navController in
            guard navController.viewControllers.isEmpty else { return }
            let coordinator = FeedCoordinator(dependency: self.dependency.feedDependency,
                                              router: Router(rootController: navController))
            self.addDependency(coordinator)
            coordinator.start(with: deepLink)
        }
    }

    private func runDocumentsFlow() -> ((UINavigationController) -> Void) {
        return { _ in }
    }

    private func runProfileFlow() -> ((UINavigationController) -> Void) {
        return { _ in }
    }
}
