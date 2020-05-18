//
//  Coordinator.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

protocol Coordinator: class {

    func start()
    func start(with deepLink: DeepLink?)
}
