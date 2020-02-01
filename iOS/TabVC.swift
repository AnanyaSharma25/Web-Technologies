//
//  TabVC.swift
//  Weather App
//
//  Created by Jai Nijhawan on 03/12/19.
//  Copyright © 2019 Jai Nijhawan. All rights reserved.
//

import UIKit

class TabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func twitterPressed(_ sender: Any) {
    guard let url = URL(string: "https://twitter.com") else { return }
    UIApplication.shared.open(url)
  }
}
