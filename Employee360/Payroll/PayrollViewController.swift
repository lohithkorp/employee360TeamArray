//
//  PayrollViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 10/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

class PayrollViewController: UIViewController, UIDocumentInteractionControllerDelegate, UIWebViewDelegate {

    @IBOutlet weak var downloadForm16: UIButton!
    
    @IBOutlet weak var employeeId: UILabel!
    
    var documentController: UIDocumentInteractionController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeId.text = userId
        self.addHamBurgerIcon()
        self.navigationItem.title = "My Payroll"
    }
    
    @IBAction func downloadForm16BtnAction(_ sender: Any) {
        let url = "http://10.184.179.120:8080/events/webapi/form16?empId=1B90&year=2017"
        networkController.getPdfFile(url: url) { result in
            switch result {
            case .success(let fileData):
                print("\(fileData)")
                
                let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("form16.pdf")
                
                do {
                    try fileData.write(to: fileURL, options: .atomic)
                    
                } catch {
                    print(error)
                }
                
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let documentsDirectory = paths[0]
                
                print(documentsDirectory)
                
                let filePath = "\(documentsDirectory)/form16.pdf"
                print("filePath \(filePath)")

                self.documentController = UIDocumentInteractionController(url: URL.init(fileURLWithPath: filePath))
                self.documentController.delegate = self as UIDocumentInteractionControllerDelegate
                self.documentController.presentPreview(animated: true)
                
            default:
                break
            }
        }
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    func documentInteractionControllerDidEndPreview(_ controller: UIDocumentInteractionController) {
        self.documentController.dismissPreview(animated: true)
    }
}
