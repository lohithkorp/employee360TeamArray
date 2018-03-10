//
//  ViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 09/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginUIView: UIView!
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let sideMenu = SSASideMenu(contentViewController: UINavigationController(rootViewController: homeViewController), leftMenuViewController: LeftMenuViewController())
        sideMenu.configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: false))
        sideMenu.configure(SSASideMenu.ContentViewEffect(alpha: 1.0, scale: 0.7))
        sideMenu.configure(SSASideMenu.ContentViewShadow(enabled: true, color: UIColor.black, opacity: 0.6, radius: 6.0))
        
        self.present(sideMenu, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginUIView.layer.cornerRadius = 10.0
        loginButton.layer.cornerRadius = 10.0
        
    }
}

