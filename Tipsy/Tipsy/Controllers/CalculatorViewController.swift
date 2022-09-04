//
//  ViewController.swift
//  Tipsy
//
//  Created by Cáren Sousa on 02/09/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    var result = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = (buttonTitleAsANumber / 100)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if let billValue = billTextField.text {
            if let billTextFieldToInt = Double(billValue) {
                let resultParcial = billTextFieldToInt * (tip + 1)
                let resultParcial2 = resultParcial / Double(numberOfPeople)
                result = (String(format: "%.2f", resultParcial2))
                print(result)
            }
        }
        
        //screen transition
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // pass data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // ViewController instance
            let destinationVC = segue.destination as! ResultsViewController
            
            //Set the destination ResultsViewController's properties.
            destinationVC.tipPercentage = Int(tip * 100)
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.totalPerPerson = result
        }
    }
}
