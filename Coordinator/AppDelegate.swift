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
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        let router = Router(rootController: navigationController)
        let dependency = AppDependency(itemRepository: ItemRepository())
        return AppCoordinator(dependency: dependency, router: router)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //applicationCoordinator.start()
        let deepLink = DeepLink.build(itemId: 2)
        applicationCoordinator.start(with: deepLink)

        return true
    }
}
