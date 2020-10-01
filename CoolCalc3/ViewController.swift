//
//  ViewController.swift
//  CoolCalc3
//
//  Created by Lorenzo piombini on 9/26/20.
//

import UIKit

class ViewController: UIViewController {
//outletdeclaration
    @IBOutlet weak var resultAndEnteringLbl: styleLblResultAndInput!
    @IBOutlet weak var pointBtn: styleOtherBtn!
    @IBOutlet weak var zeroBtn: styleNumbersBtn!
    @IBOutlet weak var oneBtn: styleNumbersBtn!
    @IBOutlet weak var twoBtn: styleNumbersBtn!
    @IBOutlet weak var threeBtn: styleNumbersBtn!
    @IBOutlet weak var fourBtn: styleNumbersBtn!
    @IBOutlet weak var fiveBtn: styleNumbersBtn!
    @IBOutlet weak var sixBtn: styleNumbersBtn!
    @IBOutlet weak var sevenBtn: styleNumbersBtn!
    @IBOutlet weak var eightBtn: styleNumbersBtn!
    @IBOutlet weak var ninebtn: styleNumbersBtn!
//actions
    @IBAction func givingValueZero(_ sender: Any) {
        autofill(forthisBtn: zeroBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    @IBAction func creatingDouble(_ sender: Any) {
        autofill(forthisBtn: pointBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    @IBAction func givingValueOne(_ sender: Any) {
        autofill(forthisBtn: oneBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    @IBAction func givingValueTwo(_ sender: Any) {
        autofill(forthisBtn: twoBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    
    @IBAction func givingValueThree(_ sender: Any) {
        autofill(forthisBtn: threeBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    
    @IBAction func givingValueFour(_ sender: Any) {
        autofill(forthisBtn: fourBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    @IBAction func givingValueFive(_ sender: Any) {
        autofill(forthisBtn: fiveBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    
    @IBAction func givingValueSiz(_ sender: Any) {
        autofill(forthisBtn: sixBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    @IBAction func givingValueSeven(_ sender: Any) {
        autofill(forthisBtn: sevenBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    @IBAction func givingValueEight(_ sender: Any) {
        autofill(forthisBtn: eightBtn, andthisLbl: resultAndEnteringLbl)
    }
    
    
    @IBAction func givingValueNine(_ sender: Any) {
        autofill(forthisBtn: ninebtn, andthisLbl: resultAndEnteringLbl)
    }
    
    
    
    @IBAction func delBtn(_ sender: Any) {
        if resultAndEnteringLbl.text!.count > 1{
            resultAndEnteringLbl.text!.popLast()
        }else {
            resultAndEnteringLbl.text = "0"
        }
    }
    
    @IBAction func clearbtn(_ sender: Any) {
        resultAndEnteringLbl.text = "0"
        userInput = ""
        first = ""
        second = ""
        operationclicked = false
        conc = false
        calcWithPoint = true
        forceTheInput = true
        handleInput = true
        endTask = false
        result = ""
        forceTheInputWithZeroPoint = false
        counter = 0
        link = false
    }
    
    
    
    @IBAction func givingOperatorsDiv(_ sender: Any) {
        
        if link == true {
            resultAndEnteringLbl.text = equalAction(givenNumber: resultAndEnteringLbl)
            first = resultAndEnteringLbl.text
            userInput = number.division
            operationclicked = true
            link = true
            
        } else{
            first = resultAndEnteringLbl.text
            userInput = number.division
            operationclicked = true
            link = true
            
        }
        
        
    }
    
    @IBAction func givingOperatorsMult(_ sender: Any) {
        if link == true {
            resultAndEnteringLbl.text = equalAction(givenNumber: resultAndEnteringLbl)
            first = resultAndEnteringLbl.text
            userInput = number.multiplication
            operationclicked = true
            link = true
            
        } else {
            first = resultAndEnteringLbl.text
            userInput = number.multiplication
            operationclicked = true
            link = true
           
        }
        
    }
    
    @IBAction func givingOperatorsAdd(_ sender: Any) {
        if link == true {
            resultAndEnteringLbl.text = equalAction(givenNumber: resultAndEnteringLbl)
            first = resultAndEnteringLbl.text
            userInput = number.addition
            operationclicked = true
            link = true
            
        } else{
        first = resultAndEnteringLbl.text
        userInput = number.addition
        operationclicked = true
        link = true
            
        }
        
            
        
    }
    
    @IBAction func givingOperatorSub(_ sender: Any) {
        if link == true {
            resultAndEnteringLbl.text = equalAction(givenNumber: resultAndEnteringLbl)
            first = resultAndEnteringLbl.text
            userInput = number.subtraction
            operationclicked = true
            link = true
            
        } else{
        first = resultAndEnteringLbl.text
        userInput = number.subtraction
        operationclicked = true
        link = true
            
        }
        
        
    }
    
    
    @IBAction func percentageBtn(_ sender: Any) {
        switch userInput {
        case "*":
            resultAndEnteringLbl.text = "\((Double(multiply(first: first!, andSecond: resultAndEnteringLbl.text!))!)/100)"
            if resultAndEnteringLbl.text!.contains(".0") {
                resultAndEnteringLbl.text!.popLast()
                resultAndEnteringLbl.text!.popLast()
            }
            operationclicked = false
        default:
            break
        }
        }
        
    
    @IBAction func puttingMinus(_ sender: Any) {
        if resultAndEnteringLbl.text != "0" {
        if resultAndEnteringLbl.text!.hasPrefix("-") {
            resultAndEnteringLbl.text!.removeFirst()
        }else {
            resultAndEnteringLbl.text?.insert("-", at: resultAndEnteringLbl.text!.startIndex)
        }
        }}
    
    
    
    
    
    @IBAction func calcandShowTheResult(_ sender: Any) {
        
        
        switch userInput {
        case "+":
            resultAndEnteringLbl.text = add(first: first!, andSecond: resultAndEnteringLbl.text!)
            operationclicked = false
            counter += 1
            link = false
        case "-":
            //this first if is to set the Operator btn acting like an equal btn
            // with using endTask the program knows that if it is false the user did not pres the equal btn, however i thought was nice to set this btn as an equal to repet always the same math
            if endTask == false {
                second = resultAndEnteringLbl.text
            resultAndEnteringLbl.text = sub(first: first!, andSecond: resultAndEnteringLbl.text!)
            } else {
                resultAndEnteringLbl.text = sub(first: resultAndEnteringLbl.text!, andSecond: second!)
            }
            operationclicked = false
            counter += 1
            link = false
        case "/":
            if endTask == false {
                second = resultAndEnteringLbl.text
            resultAndEnteringLbl.text = div(first: first!, andSecond: resultAndEnteringLbl.text!)
            } else {
                resultAndEnteringLbl.text = div(first: resultAndEnteringLbl.text!, andSecond: second!)
            }
            operationclicked = false
            counter += 1
            link = false
        case "*":
            // here I tryed to prevet the Over Flow issue with the Int type
            // I tryed also to look into Documentation, it was`t that clear .
            if resultAndEnteringLbl.text!.count >= 17  {
                if let isAnInt = Int64 (resultAndEnteringLbl.text!){
                    resultAndEnteringLbl.text = "stop calc! preventing over Flow"
                    operationclicked = false
                    counter += 1
                    link = false
                }else if let isADouble = Double(resultAndEnteringLbl.text!){
                    resultAndEnteringLbl.text = multiply(first: first!, andSecond: resultAndEnteringLbl.text!)
                    operationclicked = false
                    counter += 1
                    link = false
                }} else {
            resultAndEnteringLbl.text = multiply(first: first!, andSecond: resultAndEnteringLbl.text!)
            operationclicked = false
            counter += 1
            link = false
            }
        case "":
            break
        default:
            resultAndEnteringLbl.text = "Not a number"
        }
        endTask = true
        
        
        
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }


}

