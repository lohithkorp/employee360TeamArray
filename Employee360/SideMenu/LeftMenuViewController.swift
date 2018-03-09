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
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        view.backgroundColor = UIColor.clear
        self.tableView.sectionHeaderHeight = 183
        view.addSubview(tableView)
        changeLanguage()
    }
    
}


// MARK : TableViewDataSource & Delegate Methods

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    @objc func changeLanguage(){
        
        titles = ["Home", "Personal Info", "Absence Management", "Payroll", "Trainings"]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let images: [String] = ["bulletPointOne", "bulletPointOne", "bulletPointOne", "bulletPointOne", "bulletPointOne"]
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text  = titles[(indexPath as IndexPath).row]
        cell.selectionStyle = .none
        cell.imageView?.image = UIImage(named: images[(indexPath as IndexPath).row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        let label1 = UILabel(frame: CGRect(x: 20, y: 60, width: 152, height: 61))
        label1.font = UIFont(name: "Lato-Regular", size: 26)
        label1.textColor = UIColor.white
        
        label1.text = "Welcome_title"
        
        let label2 = UILabel(frame: CGRect(x: 20, y: 92, width: 162, height: 61))
        
        label2.textColor = UIColor.white
        label2.font = UIFont(name: "Lato-Bold", size:26)
        view.addSubview(label1)
        view.addSubview(label2)
        let px = 1 / UIScreen.main.scale
        let frame = CGRect(x:20, y:168, width:250, height:px)
        let line: UIView = UIView(frame: frame)
        line.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
        view.addSubview(line)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        /*switch (indexPath as IndexPath).row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerID") as! HomeViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            homeViewController.xtraService = appDelegate.xtraService
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController:homeViewController)
            sideMenuViewController?.hideMenuViewController()
            break
        case 1:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let manageProfileViewController = storyboard.instantiateViewController(withIdentifier: "ManageProfileViewControllerID")  as! ManageProfileViewController
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController:manageProfileViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let shopViewController = storyboard.instantiateViewController(withIdentifier: "ShopsAndServicesID") as! ShopsAndServicesViewController
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController:shopViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        case 3:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewControllerID")  as! MapViewController
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: mapViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        case 4:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let settingsViewController = storyboard.instantiateViewController(withIdentifier: "SettingsID") as! SettingsViewController
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: settingsViewController)
            sideMenuViewController?.hideMenuViewController()
            break
            
        default:
            break
        }*/
        
        
    }
    
}
