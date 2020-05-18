//
//  TabBarController.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    struct Tab {
        let onSelectFlow: OnTabSelect
        let title: String
        let imageName: String
    }

    typealias OnTabSelect = ((UINavigationController) -> Void)

    private let tabs: [Tab]
    private let selectedOnLoadIndex: Int

    init(tabs: [Tab], selectedOnLoadIndex: Int) {
        self.tabs = tabs
        self.selectedOnLoadIndex = selectedOnLoadIndex
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .black
        viewControllers = makeViewControllers()
        delegate = self

        selectedIndex = selectedOnLoadIndex
        let onLoadFlow = tabs[selectedIndex].onSelectFlow
        if let controller = viewControllers?[selectedIndex] as? UINavigationController {
            onLoadFlow(controller)
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        tabs[selectedIndex].onSelectFlow(controller)
    }

    // MARK: -

    private func makeViewControllers() -> [UIViewController] {
        var viewControllers = [UINavigationController]()
        for tab in tabs {
            let viewController = UINavigationController()
            let tabBarItem = UITabBarItem(title: tab.title,
                                          image: UIImage(named: tab.imageName),
                                          selectedImage: UIImage(named: tab.imageName))
            viewController.tabBarItem = tabBarItem
            viewControllers.append(viewController)
        }
        return viewControllers
    }
}
