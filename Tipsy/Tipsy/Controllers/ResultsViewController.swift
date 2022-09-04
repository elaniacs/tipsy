//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Cáren Sousa on 02/09/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPerson: String?
    var numberOfPeople: Int?
    var tipPercentage: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalPerPerson
        if let numberOfPeople = numberOfPeople {
            if let tipPercentage = tipPercentage {
                settingsLabel.text =  "Split between \(numberOfPeople) people, with \(tipPercentage)% tip"
            }
        }
 
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
