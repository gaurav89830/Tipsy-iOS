//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Gaurav Sharma on 01/10/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit
class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculateClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    var totalValue = 0.0
    var settingsText = "NA"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(totalValue)
        settingsLabel.text = settingsText
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
