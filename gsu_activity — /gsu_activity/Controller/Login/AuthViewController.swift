//
//  AuthViewController.swift
//  gsu_activity
//
//  Created by юра шинкар on 16.01.23.
//

import UIKit

class AuthViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    var service = Service.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closeVC(_ sender: Any) {
        delegate.closeVC()
    }
}
