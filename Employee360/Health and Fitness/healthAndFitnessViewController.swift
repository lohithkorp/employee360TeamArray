//
//  healthAndFitnessViewController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 10/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import UIKit

class healthAndFitnessViewController: UIViewController {

    @IBOutlet weak var bmiResult: UILabel!
    
    @IBOutlet weak var bmiSignificance: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 10.0
        
        self.addHamBurgerIcon()
        self.navigationItem.title = "Health & Fitness"
    }

    @IBAction func calculateButtonAction(_ sender: Any) {
        
        if let weight = weightTextField.text, let height = heightTextField.text {
            let weightForBMI = Float(weight)
            let heightForBMI = Float(height)
            
            let bmiValue = weightForBMI! / powf(heightForBMI!, 2.0)
            
            bmiResult.text = String(bmiValue)
            if bmiValue < 18.5 {
                bmiResult.backgroundColor = UIColor.red
                bmiSignificance.text = "Under Weight"
                bmiSignificance.textColor = UIColor.red
            }
            else if bmiValue < 25 {
                bmiResult.backgroundColor = UIColor.green
                bmiSignificance.text = "Normal Weight"
                bmiSignificance.textColor = UIColor.green
            }
            else if bmiValue < 30 {
                bmiResult.backgroundColor = UIColor.orange
                bmiSignificance.text = "Over Weight"
                bmiSignificance.textColor = UIColor.orange
            }
            else {
                bmiResult.backgroundColor = UIColor.red
                bmiSignificance.text = "Obese"
                bmiSignificance.textColor = UIColor.red
            }
        }
    }
}
