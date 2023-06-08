//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumLabel: UILabel!

    var tip = 0.1
    var totalBill:Float = 0.0
    var answer:Double = 0.0
    var totalPeople = 1
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        if sender.titleLabel?.text == "0%"{
            tip = 0
        }else if sender.titleLabel?.text == "10%"{
            tip = 0.1
        }else{
            tip = 0.2
        }
        print(tip)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumLabel.text =  String(format:"%.0f" ,sender.value)
        totalPeople = Int(sender.value)
    }
    @IBAction func calculateClicked(_ sender: UIButton) {
        totalBill = Float(billTextField.text!) ?? 0
        answer = Double(totalBill + totalBill*Float(tip))
        answer/=Double(totalPeople)
        answer = round(answer * 10) / 10
        print(answer)
        self.performSegue(withIdentifier: "goToResults", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = answer
            destinationVC.settingsText = "Split between \(totalPeople) person(s),\n with \(Int(tip*100))% Tip "
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    


}

