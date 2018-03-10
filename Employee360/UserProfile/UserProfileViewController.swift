//
//  UserProfileViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 10/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

var userId: String?

class UserProfileViewController: UIViewController {
    
    var employeeDetails: [EmployeeDetails]?

    @IBOutlet weak var userImageButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contactNumberLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addHamBurgerIcon()
        self.navigationItem.title = "Profile Information"
        
        userImageButton.setImage(UIImage(named: "ProfileImage"), for: .normal)
    }
    
    
    @IBAction func userImageButtonAction(_ sender: Any) {
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        if let userId = userId {
            let url = "http://10.184.179.116:8080/events/webapi/employee?empId=\(userId)"
            self.fetchEmployeeDetails(url: url)
        }
    }
    
    private func fetchEmployeeDetails(url: String) {
        networkController.getEmployeeDetailsRequest(url: url) { result in
            switch result {
            case .success(let employeeDetailsInfo):
                self.employeeDetails = employeeDetailsInfo
                
                if let employeeDetails = self.employeeDetails {
                    self.nameLabel.text = employeeDetails[0].name
                    self.contactNumberLabel.text = employeeDetails[0].mobileNumber
                    self.addressLabel.text = employeeDetails[0].address
                }
                
            default:
                break
            }
        }
    }
}
