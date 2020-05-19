//
//  AppRouter.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 19/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class AppRouter {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func setRootViewController(_ controller: UIViewController) {
        window.rootViewController = controller
    }
}
