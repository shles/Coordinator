//
//  ItemRepository.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

struct ItemRepository {

    struct Item {
        let id: Int
        let title: String
    }

    let items = [Item(id: 1, title: "Item 1"),
                 Item(id: 2, title: "Item 2"),
                 Item(id: 3, title: "Item 3")]
}
