//
//  ViewController.swift
//  Calculator
//
//  Created by Dustin Cai on 10/26/19.
//  Copyright © 2019 Dustin Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNum:Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var Label: UILabel!
    @IBAction func Numbers(_ sender: UIButton) {
        if performingMath == true {
            Label.text = String(sender.tag - 1)
            numberOnScreen = Double(Label.text!)!
            performingMath = false
        } else {
            Label.text = Label.text! + String(sender.tag - 1)
            numberOnScreen = Double(Label.text!)!
        }
    }
    
    
    @IBAction func Buttons(_ sender: UIButton) {
        if Label.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNum = Double(Label.text!)!
            
            if sender.tag == 12 {   // Divide
                Label.text = "/";
            } else if sender.tag == 13 { // Multiply
                Label.text = "x";
            } else if sender.tag == 14 { // Minus
                Label.text = "-";
            } else if sender.tag == 15{ // Plus
                Label.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        } else if sender.tag == 16 {
            if operation == 12 {
                Label.text = String(previousNum / numberOnScreen)
            } else if operation == 13 {
                Label.text = String(previousNum * numberOnScreen)
            } else if operation == 14 {
                Label.text = String(previousNum - numberOnScreen)
            } else if operation == 15 {
                Label.text = String(previousNum + numberOnScreen)
            }
        } else if sender.tag == 11 {
            Label.text = ""
            previousNum = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

