//
//  LeftMenuViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 09/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {
    
    var titles = [String]()
    
    lazy var tableView: UITableView = {
        let tableView  = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 141.0/255.0, alpha: 1.0)
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        self.tableView.sectionHeaderHeight = 183
        view.addSubview(tableView)
        changeLanguage()
    }
}


// MARK : TableViewDataSource & Delegate Methods

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    @objc func changeLanguage(){
        
        titles = ["Home", "Personal Info", "Self Tasks", "Payroll", "Health & Fitness"]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let images: [String] = ["icons8-house", "icons8-user", "icons8-task-planning", "icons8-money", "icons8-exercise"]
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Lato-Regular", size: 45)
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text  = titles[(indexPath as IndexPath).row]
        cell.selectionStyle = .none
        cell.imageView?.image = UIImage(named: images[(indexPath as IndexPath).row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        let label1 = UILabel(frame: CGRect(x: 20, y: 60, width: 152, height: 61))
        label1.font = UIFont(name: "Lato-Regular", size: 40)
        label1.textColor = UIColor.white

        view.addSubview(label1)
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath as IndexPath).row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController:homeViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        case 1:
            
            let storyboard = UIStoryboard(name: "ProfileStoryboard", bundle: nil)
            let userProfileViewController = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController")  as! UserProfileViewController
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController:userProfileViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let selfTasksViewController = storyboard.instantiateViewController(withIdentifier: "SelfTasksViewController") as! SelfTasksViewController
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController:selfTasksViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        case 3:
            let storyboard = UIStoryboard(name: "PayrollStoryboard", bundle: nil)
            let payrollViewController = storyboard.instantiateViewController(withIdentifier: "PayrollViewController")  as! PayrollViewController

            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: payrollViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        case 4:
            
            let storyboard = UIStoryboard(name: "hAndAStoryboard", bundle: nil)
            let settingsViewController = storyboard.instantiateViewController(withIdentifier: "healthAndFitnessViewController") as! healthAndFitnessViewController

            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: settingsViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        default:
            break
        }
        
        
    }
    
}
