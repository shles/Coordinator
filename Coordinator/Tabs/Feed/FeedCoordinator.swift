//
//  FeedCoordinator.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class FeedCoordinator: BaseCoordinator {

    private let router: Router
    private let dependency: FeedDependency

    init(dependency: FeedDependency, router: Router) {
        self.dependency = dependency
        self.router = router
    }

    override func start(with deepLink: DeepLink?) {
        guard let vc = UIStoryboard(name: "Feed", bundle: nil)
            .instantiateInitialViewController() as? FeedViewController else { return }
        vc.itemRepository = dependency.itemRepository
        vc.onItemSelect = { [unowned self] item in
            self.showItemDetail(item)
        }
        router.setRootViewController(vc)
        switch deepLink {
        case .feed(let itemId):
            if let item = dependency.itemRepository.items.filter({ $0.id == itemId }).first {
                showItemDetail(item)
            }
        default: break
        }
    }

    private func showItemDetail(_ item: ItemRepository.Item) {
        guard let vc = UIStoryboard(name: "Feed", bundle: nil)
            .instantiateViewController(withIdentifier: "ItemViewController") as? ItemViewController else { return }
        vc.item = item
        router.push(vc)
    }
}
