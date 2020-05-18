//
//  DeepLink.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

enum DeepLink {
    case feed(Int)
}

extension DeepLink {

    static func build(itemId: Int) -> DeepLink {
        DeepLink.feed(itemId)
    }
}
