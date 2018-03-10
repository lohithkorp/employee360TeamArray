//
//  UIViewControllerExtension.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 10/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import Foundation
import UIKit

let networkController = NetworkController()

extension UIViewController {
    
    func addHamBurgerIcon() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        let button =  UIButton(type: .custom)
        button.setImage(UIImage(named: "IconHamburger"), for: UIControlState())
        button.addTarget(self, action: #selector(SSASideMenu.presentLeftMenuViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.imageEdgeInsets = UIEdgeInsetsMake(7, -52, 1, -32)//move image to the right
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    
}
