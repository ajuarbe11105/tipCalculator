//
//  TotalViewController.swift
//  tipCalculator
//
//  Created by Alberto Juarbe on 5/22/20.
//  Copyright © 2020 Alberto Juarbe. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalWithTip: UILabel!
    
    var result = "0.0"
    var tip = 10
    var divided = 2
        
    override func viewDidLoad() {
    super.viewDidLoad()

        
        totalAmountLabel.text = result
        totalWithTip.text = "The total amount split with \(divided) people."
        
    }
    
    @IBAction func calculateAgain(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
