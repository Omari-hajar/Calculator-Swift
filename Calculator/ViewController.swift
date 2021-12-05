//
//  ViewController.swift
//  Calculator
//
//  Created by Hajar Alomari on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    //declare UI elements
    @IBOutlet weak var DisplayVIew: UIView!
    
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var ResultVIew: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    //declare variables
    
    var equation = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //rounded corners for view?
        DisplayVIew.layer.cornerRadius = 5
        DisplayVIew.layer.masksToBounds = true
        ResultVIew.layer.cornerRadius = 5
        ResultVIew.layer.masksToBounds = true
    }

    //clear buttons
    @IBAction func clearAllBtn(_ sender: UIButton) {
        equation = ""
        equationLabel.text = equation
        resultLabel.text = ""
        
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        if !equation.isEmpty{
            equation.removeLast()
            equationLabel.text = equation
        }
    }
    
   
    /// math signs buttons
    @IBAction func percentageBtn(_ sender: UIButton) {
        addToEquiation(value: "%")
    }
    
    @IBAction func divideBtn(_ sender: UIButton) {
        addToEquiation(value: "/")
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        addToEquiation(value: "*")
    }
    
    
    @IBAction func minusBtn(_ sender: UIButton) {
        addToEquiation(value: "-")
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        addToEquiation(value: "+")
    }
    
    
    @IBAction func equalBtn(_ sender: UIButton) {
        calculations(value: equation)
    }
    
    // number buttons
    
    @IBAction func decimalBtn(_ sender: UIButton) {
        addToEquiation(value: ".")
    }
    
    @IBAction func btn0(_ sender: UIButton) {
        addToEquiation(value: "0")
    }
    
    
    @IBAction func btn1(_ sender: UIButton) {
        addToEquiation(value: "1")
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        addToEquiation(value: "2")
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        addToEquiation(value: "3")
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        addToEquiation(value: "4")
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        addToEquiation(value: "5")
    }
    
    @IBAction func btn6(_ sender: UIButton) {
        addToEquiation(value: "6")
    }
    
    @IBAction func btn7(_ sender: UIButton) {
        addToEquiation(value: "7")
    }
    
    
    @IBAction func btn8(_ sender: UIButton) {
        addToEquiation(value: "8")
    }
    
    @IBAction func btn9(_ sender: Any) {
        addToEquiation(value: "9")
    }
    
    //math functions//////////////
    
    func addToEquiation(value: String){
        equation = equation + value
        equationLabel.text = equation
    }
    
    func calculations(value : String){
        
        if checkIfValid(){
            
       
        let transformPercentage = equation.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: transformPercentage)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
            //resultLabel.text = String(result)

        if result.truncatingRemainder(dividingBy: 1) == 0{
            resultLabel.text = String(format: "%.0f", result)
        } else {
            resultLabel.text = String(format: "%.2f", result)
        }
        } else{
            resultLabel.text = "Invalid Calculation"
        }
        
    }
    
    func  checkIfValid() -> Bool{
        var specialCharCount = 0
        var specialCharArray = [Int]()
        
        for char in equation {
            
            if specialCharacter(char: char){
                specialCharArray.append(specialCharCount)
            }
            specialCharCount += 1
        }
        
        var previous: Int = -1
        
        for i in specialCharArray {
            if i == 0{
                return false
            }
            
            if i == equation.count - 1 {
                return false
            }
            
            if previous != -1 {
                if i - previous == 1 {
                    return false
                }
            }
            previous = i
        }
        return true
    }
    
    
    func specialCharacter(char: Character) -> Bool {
        
        if char == "*"{
            return true
        }
        if char == "%"{
            return true
        }
        if char == "/"{
            return true
        }
        if char == "+"{
            return true
        }
        if char == "+"{
            return true
        }
        if char == "-"{
            return true
        }
        return false
    }
    
}

