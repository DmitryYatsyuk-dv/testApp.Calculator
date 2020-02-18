//
//  ViewController.swift
//  CalculatorTest
//
//  Created by Lucky on 18/02/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayResultLabel: UILabel!
    
    var stillTyping = false
    
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            // Limit added digits
            if displayResultLabel.text!.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
            } else {
                displayResultLabel.text = number
                stillTyping = true
            }
        }
    
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
    }

    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        switch operationSign {
        case "+":
            operateWithTwoOperands { $0 + $1 }
        case "-":
            operateWithTwoOperands { $0 - $1 }

        case "×":
            operateWithTwoOperands { $0 * $1 }

        case "÷":
            operateWithTwoOperands { $0 / $1 }

        default:
            break
        }
    }
    
}

