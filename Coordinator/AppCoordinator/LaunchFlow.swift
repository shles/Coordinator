//
//  LaunchFlow.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import Foundation

enum LaunchFlow {

    case auth, onboarding, tabs

    static func build(authenticated: Bool = authenticated,
                      onboardingWasShown: Bool = onboardingWasShown) -> LaunchFlow {
        switch (onboardingWasShown, authenticated) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .tabs
        }
    }

    static var onboardingWasShown = false
    static var authenticated = false
}
