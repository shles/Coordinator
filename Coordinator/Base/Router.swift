//
//  Router.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class Router {

    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]

    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
    }

    func present(_ controller: UIViewController, animated: Bool = true) {
        rootController?.present(controller, animated: animated, completion: nil)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootController?.dismiss(animated: animated, completion: completion)
    }

    func push(_ controller: UIViewController, animated: Bool = true,
              hideBottomBar: Bool = false, completion: (() -> Void)? = nil) {
        if controller is UINavigationController {
            assertionFailure("UINavigationController in UINavigationController stack not allowed")
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottomBar
        rootController?.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool = true) {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func setRootViewController(_ controller: UIViewController, hideBar: Bool = false) {
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }

    func popToRootViewController(animated: Bool = true) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }

    // MARK: -

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions[controller] = nil
    }
}
