//
//  OnboardingViewController.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 16/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    var onFinish: (() -> Void)?

    @IBAction func finish(_ sender: Any) {
        onFinish?()
    }
}
