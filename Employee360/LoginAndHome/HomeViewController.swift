//
//  HomeViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 09/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var quickLink1Button: UIButton!
    
    @IBOutlet weak var quickLink2Button: UIButton!
    
    @IBOutlet weak var quickLink3Button: UIButton!
    
    @IBOutlet weak var quickLink4Button: UIButton!
    
    @IBOutlet weak var quickLink5Button: UIButton!
    
    let networkController = NetworkController()
    
    var eventData: [EventsList]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        
        for button in [quickLink1Button, quickLink2Button, quickLink3Button, quickLink4Button, quickLink5Button] {
            button?.layer.cornerRadius = 10.0
        }
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        let url = "http://10.184.179.116:8080/events/webapi/event"
        self.fetchEventDetails(url: url)
        
//        let url = "http://10.184.178.131:2403/employee"
//        self.fetchEventDetails(url: url)
    }
    
    private func fetchEventDetails(url: String) {
        networkController.getEventsRequest(url: url) { result in
            switch result {
            case .success(let events):
                self.eventData = events
                
                
            default:
                break
                
            }
        }
    }
}
