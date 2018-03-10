//
//  UserProfileViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 10/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit
import MobileCoreServices

var userId: String?

class UserProfileViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var employeeDetails: [EmployeeDetails]?

    @IBOutlet weak var userImageButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contactNumberLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var roleTitle: UILabel!
    @IBOutlet weak var experienceTitle: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var feedBackTextArea: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    fileprivate var activeTextField:UITextField?
    
    var selectedSubject: String!
    
    var SubjectNames: [String] = ["PT Feedback", "Food Feedback", "Facilities Feedback", "Others"]
    
    @IBAction func submitButtonAction(_ sender: Any) {
        
        
    }
    
    @IBOutlet var img:UIImageView!=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTextField.delegate = self
        categoryTextField.tag = 34
        
        self.addHamBurgerIcon()
        self.navigationItem.title = "Profile Information"
        submitButton.layer.cornerRadius = 10.0
        userImageButton.setImage(UIImage(named: "ProfileImage"), for: .normal)
        
        for labelElement in [categoryLabel, toLabel, feedbackLabel] {
            labelElement?.isHidden = true
        }
        for textFieldElement in [categoryTextField, toTextField] {
            textFieldElement?.isHidden = true
        }
        feedBackTextArea.isHidden = true
        submitButton.isHidden = true
    }
    
    
    @IBAction func userImageButtonAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //imag.mediaTypes = [kUTTypeImage];
            imag.allowsEditing = false
            self.present(imag, animated: true, completion: nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        let selectedImage : UIImage = image
        //var tempImage:UIImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
        img.image=selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func professionalInfoButtonAction(_ sender: Any) {
        contentView.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 141.0/255.0, alpha: 1.0)
        
        for labelElement in [categoryLabel, toLabel, feedbackLabel] {
            labelElement?.isHidden = true
        }
        for textFieldElement in [categoryTextField, toTextField] {
            textFieldElement?.isHidden = true
        }
        feedBackTextArea.isHidden = true
        submitButton.isHidden = true
        
        for profLabelElement in [roleTitle, experienceTitle, roleLabel, experienceLabel] {
            profLabelElement?.isHidden = false
        }
    }
    
    
    @IBAction func feedbackFormButtonAction(_ sender: Any) {
        contentView.backgroundColor = UIColor(red: 209.0/255.0, green: 209.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        
        for labelElement in [categoryLabel, toLabel, feedbackLabel] {
            labelElement?.isHidden = false
        }
        for textFieldElement in [categoryTextField, toTextField] {
            textFieldElement?.isHidden = false
        }
        feedBackTextArea.isHidden = false
        submitButton.isHidden = false
        
        for profLabelElement in [roleTitle, experienceTitle, roleLabel, experienceLabel] {
            profLabelElement?.isHidden = true
        }
        
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
                    self.experienceLabel.text = employeeDetails[0].professionalExperience
                    self.roleLabel.text = employeeDetails[0].role
                }
                
            default:
                break
            }
        }
    }
    
    // MARK: - TextField  data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch activeTextField!.tag {
        case 34:
            return self.SubjectNames[row]
            
        default:
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch activeTextField!.tag {
        case 34:
            return self.SubjectNames.count
            
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch activeTextField!.tag {
        case 34:
            
            selectedSubject = self.SubjectNames[row]
            activeTextField?.text = self.SubjectNames[row]
            break
            
        default:
            break
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeTextField = textField
        switch textField.tag {
        case 34:
            
            let pickerView = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
            pickerView.backgroundColor = .white
            pickerView.showsSelectionIndicator = true
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = false
            toolBar.setShadowImage(UIImage(), forToolbarPosition: .any)
            toolBar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
            toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
            toolBar.sizeToFit()
            toolBar.layoutIfNeeded()
            pickerView.delegate = self
            pickerView.dataSource = self
            
            let doneButton = UIBarButtonItem(title: "Done", style:.plain, target: self, action: #selector(self.donePicker))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.canclePicker))
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            activeTextField!.inputView = pickerView
            activeTextField!.inputAccessoryView = toolBar
            
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            
        default:
            break
        }
    }
    
    @objc func donePicker() {
        switch activeTextField!.tag {
        case 34:
            activeTextField?.text = selectedSubject
            break
            
        default:
            break
        }
        
        activeTextField!.resignFirstResponder()
        
    }
    
    @objc func canclePicker() {
        
        switch activeTextField!.tag {
        case 34:
            activeTextField?.text = ""
            break
            
        default:
            break
        }
        activeTextField!.resignFirstResponder()
    }
}
