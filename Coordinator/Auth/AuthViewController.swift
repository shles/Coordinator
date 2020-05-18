//
//  AuthViewController.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {

    var onFinish: (() -> Void)?

    @IBAction func authenticate(_ sender: Any) {
        onFinish?()
    }
}
