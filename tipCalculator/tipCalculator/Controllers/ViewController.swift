//
//  ViewController.swift
//  tipCalculator
//
//  Created by Alberto Juarbe on 5/22/20.
//  Copyright © 2020 Alberto Juarbe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 1
    var totalBill = 0.0
    var lastResult = "0.0"


    @IBAction func tipAmountChanged(_ sender: UIButton) {
        totalTextField.endEditing(true)
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        fifteenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        let buttonName = sender.currentTitle
        let buttonTitleMinusSign = String(buttonName!.dropLast())
        let buttonNameNumber = Double(buttonTitleMinusSign)!
        tip = buttonNameNumber / 100
        
    
    }
    //Stepper
    @IBAction func peopleChanged(_ sender: UIStepper) {
        numberOfPeopleLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        

    }
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let total = totalTextField.text!
        if total != "" {
            totalBill = Double(total)!
          let result = totalBill * (1 + tip) / Double(numberOfPeople)
            lastResult = String(format: "%.2f", result)
            print(lastResult)
}
        self.performSegue(withIdentifier: "theTotal", sender: self)
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "theTotal" {

                let secondVC = segue.destination as! TotalViewController
                secondVC.result = lastResult
                secondVC.tip = Int(tip * 100)
                secondVC.divided = numberOfPeople
            }
}
}
