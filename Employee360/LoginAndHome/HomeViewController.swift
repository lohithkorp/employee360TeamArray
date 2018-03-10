//
//  HomeViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 09/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var quickLink1Button: UIButton!
    
    @IBOutlet weak var quickLink2Button: UIButton!
    
    @IBOutlet weak var quickLink3Button: UIButton!
    
    @IBOutlet weak var quickLink4Button: UIButton!
    
    @IBOutlet weak var quickLink5Button: UIButton!
    
    var eventData: [EventsList]?
    
    var cell: UITableViewCell!
    
    let images = ["Event1", "Event2", "Hackathon_groupfie", "Event3", "Event1"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let eventDetailCell = UINib(nibName: "EventTableViewCell", bundle: nil)
        self.tableView.register(eventDetailCell, forCellReuseIdentifier: "EventTableViewCell")
        
        for button in [quickLink1Button, quickLink2Button, quickLink3Button, quickLink4Button, quickLink5Button] {
            button?.layer.cornerRadius = 10.0
        }
        
        self.addHamBurgerIcon()
        self.navigationItem.title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let url = "http://10.184.179.116:8080/events/webapi/event"
        self.fetchEventDetails(url: url)
    }
    
    private func fetchEventDetails(url: String) {
        networkController.getEventsRequest(url: url) { result in
            switch result {
            case .success(let events):
                self.eventData = events
                self.tableView.reloadData()
                
            default:
                break
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let eventsCount = self.eventData?.count {
            return eventsCount
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = self.tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        
        if let eventsData = self.eventData {
            (cell as! EventTableViewCell).eventTitle.text = eventsData[indexPath.row].title
            (cell as! EventTableViewCell).eventDescription.text = eventsData[indexPath.row].description
            (cell as! EventTableViewCell).eventImage.image = UIImage(named: images[indexPath.row])
        }
        return cell
    }
}
