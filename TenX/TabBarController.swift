//
//  TabBarController.swift
//  TenX
//
//  Created by BDabrowski on 3/18/17.
//  Copyright © 2017 Broski Studios. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = .black
    }

}
