//
//  AppDelegate.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var applicationCoordinator: AppCoordinator = {
        let appRouter = AppRouter(window: window!)
        let dependency = AppDependency(itemRepository: ItemRepository())
        return AppCoordinator(dependency: dependency, appRouter: appRouter)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let deepLink = DeepLink.build(itemId: 2)
        applicationCoordinator.start(with: deepLink)

        //scheduleDeAuth()

        return true
    }

    private func scheduleDeAuth() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            LaunchFlow.authenticated = false
            self.applicationCoordinator.detachAllChilds()
            self.applicationCoordinator.start()
        })
    }
}
