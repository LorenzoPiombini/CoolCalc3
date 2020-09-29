//
//  functionClassVariables.swift
//  CoolCalc3
//
//  Created by Lorenzo Piombini on 9/26/20.
//

import Foundation
import UIKit


var userInput:String = ""
var first:String? = ""
var second:String? = ""
var operationclicked = false
var endTask = false
var result = ""
var counter = 0
var link = false
var history: [String] = []

// function to allowed any operators btn to act like a equals btn
// I created this func days after the equals btn
func equalAction (givenNumber: UILabel) -> String{
    
    switch userInput {
    case "+":
        givenNumber.text = number.add(first: first!, andSecond: givenNumber.text!)
        operationclicked = false
        counter += 1
        endTask = true
        return givenNumber.text!
    case "-":
        if endTask == false {
            second = givenNumber.text
            givenNumber.text = number.sub(first: first!, andSecond: givenNumber.text!)
        } else {
            givenNumber.text = number.sub(first: givenNumber.text!, andSecond: second!)
        }
        operationclicked = false
        counter += 1
        endTask = true
        return givenNumber.text!
    case "/":
        if endTask == false {
            second = givenNumber.text
            givenNumber.text = number.div(first: first!, andSecond: givenNumber.text!)
        } else {
            givenNumber.text = number.div(first: givenNumber.text!, andSecond: second!)
        }
        operationclicked = false
        counter += 1
        endTask = true
        return givenNumber.text!
    case "*":
        givenNumber.text = number.multiply(first: first!, andSecond: givenNumber.text!)
        operationclicked = false
        counter += 1
        endTask = true
        return givenNumber.text!
    default:
        givenNumber.text = "Not a number"
        return givenNumber.text!
    }
    
}
//I tryed to use the Overflow method fomr Swift but it is quite confusing for now
//then I create this function to prevent the over flow along the multiply operation to hable the overflow myself, creating a Double with more bit space in the memory avoinding in this way the crash due to over flow

func chekingOverFlow (forThisResult: Int) -> String{
    var newTypeToPreventOverFlow:Double = 0
    var chekingIfItIsADoubleAlready:String = "\(forThisResult)"
    var result = ""
    if chekingIfItIsADoubleAlready.contains(".") {
        result = chekingIfItIsADoubleAlready
    } else if forThisResult > 1000000 {
        newTypeToPreventOverFlow = Double((forThisResult))
        result = "\(newTypeToPreventOverFlow)"
        result.popLast() //to make the result looking like an Int
        result.popLast() //because if we reach this point we are talking about an int! so I am deleting the .0 from the number
    }else {
        result = "\(forThisResult)"
    }
    return result
}


//functions to configure the button numbers, and showing the numbers on the Label
func autofill(forthisBtn: UIButton, andthisLbl: UILabel){
    var  title = forthisBtn.titleLabel
    var value:String = ""
    
    switch title?.text {
    case ".":
        if andthisLbl.text?.contains(".") == false {
            value = number.point}
    case "0":
        value = number.zero
    case "1":
        value = number.one
    case "2":
        value = number.two
    case "3":
        value = number.three
    case "4":
        value = number.four
    case "5":
        value = number.five
    case "6":
        value = number.six
    case "7":
        value = number.seven
    case "8":
        value = number.eight
    case "9":
        value = number.nine

    default:
      let  _ = ""
    }
    
    //conditional structure to perform a correct input
    //as more then one digit, the point to make it decimal and so on..
    
    if value == "." && andthisLbl.text == "0" {
        andthisLbl.text?.append("\(value)")
    }else if (andthisLbl.text == "0" && counter == 0) || (endTask == true ){
         andthisLbl.text = "\(value)"
         endTask = false
    } else if andthisLbl.text != "0" && operationclicked == false{
        andthisLbl.text?.append("\(value)")
    } else if andthisLbl.text != "0" && operationclicked == true && counter > 0{
        andthisLbl.text?.append("\(value)")
    }
    else if operationclicked == true && andthisLbl.text?.isEmpty == false {
        andthisLbl.text = "\(value)"
        operationclicked = false
        counter = 0
    } else if operationclicked == true && andthisLbl.text?.isEmpty == false{
        andthisLbl.text = "\(value)"
    }
}



class Number {
    var point:String
    var zero:String
    var one:String
    var two:String
    var three:String
    var four:String
    var five:String
    var six:String
    var seven:String
    var eight:String
    var nine:String
    var addition:String
    var division:String
    var multiplication:String
    var subtraction:String
    
    
    
    init() {
        point = "."
        zero = "0"
        one = "1"
        two = "2"
        three = "3"
        four = "4"
        five = "5"
        six = "6"
        seven = "7"
        eight  = "8"
        nine = "9"
        addition = "+"
        multiplication = "*"
        subtraction = "-"
        division = "/"
    }
    
    func add (first: String, andSecond:String )-> String{
        var result:String = ""
        var managingOverFlow:Int = 0
        
        if let integerFirst = Int(first), let integerSecond = Int(andSecond){
           managingOverFlow = integerFirst + integerSecond
            result = "\(managingOverFlow)"
            } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
            result = "\(doubleFirst + doubleSecond)"
        }
     return result
        
        }
    
func sub(first: String, andSecond:String) -> String {
        var result:String = ""
    if let integerFirst = Int(first), let integerSecond = Int(andSecond){
            result = "\(integerFirst - integerSecond)"
        } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
            result = "\(doubleFirst - doubleSecond)"
        }
     return result
    }
    
    
    
    func div(first: String, andSecond:String) -> String {
        var result:String = ""
        if andSecond == "0"{
            result = "Not a number"
        }else if  first.contains(".") || andSecond.contains("."){
            let doubleFirst = Double(first)!
            let doubleSecond = Double(andSecond)!
            result = "\(doubleFirst / doubleSecond)"
        }else if let integerFirst = Int(first), let integerSecond = Int(andSecond){
            if  integerFirst % integerSecond == 0 {
                result = "\(integerFirst / integerSecond)"
            }else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
            result = "\(doubleFirst / doubleSecond)"
        }
        }
        return result
    }
        
    func multiply(first: String, andSecond:String )-> String{
        var result:String = ""
        if let integerFirst = Int64(first), let integerSecond = Int64(andSecond){
             result = "\(integerFirst * integerSecond)"
            
            } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
            result = "\(doubleFirst * doubleSecond)"
        }
     return result
        
    }
    func percentage(first: String, andSecond:String )-> String{
        var result:String = ""
        if  first.contains(".") || andSecond.contains("."){
           let doubleFirst = Double(first)!
           let doubleSecond = Double(andSecond)!
            result = "\((doubleFirst / doubleSecond)/100)"}
        else if let integerFirst = Int(first), let integerSecond = Int(andSecond){
            if  integerFirst % integerSecond == 0 {
                result = "\((integerFirst * integerSecond)/100)"
            }else {
                result = "\(Double((integerFirst * integerSecond)/100))"
            }
            }
     return result
        
        }

 
    }

let number = Number()
