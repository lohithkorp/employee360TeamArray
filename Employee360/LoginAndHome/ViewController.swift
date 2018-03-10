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
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        if (userNameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            isUserLoggedIn = false
            let alert = UIAlertController(title: "Attention!", message: "All fields are mandatory", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            if userNameTextField.text == passwordTextField.text {
                isUserLoggedIn = true
                
                userId = userNameTextField.text
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                
                let sideMenu = SSASideMenu(contentViewController: UINavigationController(rootViewController: homeViewController), leftMenuViewController: LeftMenuViewController())
                sideMenu.configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: false))
                sideMenu.configure(SSASideMenu.ContentViewEffect(alpha: 1.0, scale: 0.7))
                sideMenu.configure(SSASideMenu.ContentViewShadow(enabled: true, color: UIColor.black, opacity: 0.6, radius: 6.0))
                
                self.present(sideMenu, animated: true, completion: nil)
            }
                
            else {
                isUserLoggedIn = false
                let alert = UIAlertController(title: "Attention!", message: "Incorrect Username/Password", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginUIView.layer.cornerRadius = 10.0
        loginButton.layer.cornerRadius = 10.0
        
    }
}

