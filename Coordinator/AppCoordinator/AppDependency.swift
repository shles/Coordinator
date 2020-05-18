//
//  AppDependency.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

struct AppDependency {
    let itemRepository: ItemRepository
}

extension AppDependency {

    var tabsDependency: TabsDependency {
        TabsDependency(itemRepository: itemRepository)
    }

    var onboardingDependency: OnboardingDependency {
        OnboardingDependency()
    }

    var authDependency: AuthDependency {
        AuthDependency()
    }
}
