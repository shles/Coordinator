//
//  TabsDependency.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

struct TabsDependency {
    let itemRepository: ItemRepository
}

extension TabsDependency {

    var feedDependency: FeedDependency {
        FeedDependency(itemRepository: itemRepository)
    }
}
