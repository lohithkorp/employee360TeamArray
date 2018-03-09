//
//  HomeViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 09/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var quickLink1Button: UIButton!
    
    @IBOutlet weak var quickLink2Button: UIButton!
    
    @IBOutlet weak var quickLink3Button: UIButton!
    
    @IBOutlet weak var quickLink4Button: UIButton!
    
    @IBOutlet weak var quickLink5Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in [quickLink1Button, quickLink2Button, quickLink3Button, quickLink4Button, quickLink5Button] {
            button?.layer.cornerRadius = 10.0
        }
    }
}
