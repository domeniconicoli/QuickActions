//
//  SecondViewController.swift
//  QuickActions
//
//  Created by Domo on 22/10/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showMessage() {
        let alert = UIAlertController(title: "Hey", message: "Your quick action works!", preferredStyle: .alert)
               let action = UIAlertAction(title: "OK", style: .default, handler: nil)
               alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}
