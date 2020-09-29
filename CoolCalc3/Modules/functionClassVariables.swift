//
//  functionClassVariables.swift
//  CoolCalc3
//
//  Created by Lorenzo Piombini on 9/26/20.
//



import Foundation
import UIKit

// global declaration, these variables are bricks that helped me a lot in building the App, I use them to struct the If scafolding which makes the calc works!

var userInput:String = ""
var first:String? = ""
var second:String? = ""
var operationclicked = false
var endTask = false // to handle an User option like linking more than one calcs
var result = "" 
var counter = 0 // the same as above, variable used in if concatenation to handle some user behavior
var link = false
var history: [String] = [] // this is for the history btn, not installed yet, however I will add it in the future, I personally find it really helpful to see your old math operation

// function to allowed any operators btn to act like a equals btn
// I created this func days after the equals btn and Userexperience wise
// I think it should be slighty different than the equal btn
// after making my code little dry I think this func has to be in place in order to avoid crash due to over flow and handle user experience like alowed +  -  / to behave like an = btn.
func equalAction (givenNumber: UILabel) -> String{
    
    switch userInput {
    case "+":
        givenNumber.text = makingtheMath(first: first!, andSecond: givenNumber.text!, forThisOperator: userInput)
        
        return givenNumber.text!
    case "-":
        if endTask == false {
            second = givenNumber.text
            givenNumber.text = makingtheMath(first: first!, andSecond: givenNumber.text!, forThisOperator: userInput)
        } else {
            givenNumber.text = makingtheMath(first: first!, andSecond: givenNumber.text!, forThisOperator: userInput)
        }
        return givenNumber.text!
    case "/":
        if endTask == false {
            second = givenNumber.text
            givenNumber.text = makingtheMath(first: first!, andSecond: givenNumber.text!, forThisOperator: userInput)
        } else {
            givenNumber.text = makingtheMath(first: first!, andSecond: givenNumber.text!, forThisOperator: userInput)
        }
        
        return givenNumber.text!

        case "*":
            if counter == 0 {
                givenNumber.text = makingtheMath(first: first!, andSecond: givenNumber.text!, forThisOperator: userInput)
            operationclicked = false
            counter += 1
            link = false
            }
           
         return givenNumber.text!

    default:
        givenNumber.text = "Not a number"
        return givenNumber.text!
    }
    
}

// I am studying my code over and i think it is not really DRY,
// i will provide a better version:
// i`m putting together peaces of my code

func makingtheMath (first: String, andSecond:String, forThisOperator: String) -> String{
    
    var result:String = ""
    
    
    switch forThisOperator {
    case "+":
        if let integerFirst = Int(first), let integerSecond = Int(andSecond){
            result = "\(integerFirst + integerSecond )"

            } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
            result = "\(doubleFirst + doubleSecond)"
        }
        operationclicked = false
        counter += 1
        link = false
        endTask = true
     return result
        
    case "-":
       
        if let integerFirst = Int(first), let integerSecond = Int(andSecond){
                result = "\(integerFirst - integerSecond)"
            } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
                result = "\(doubleFirst - doubleSecond)"
            }
        operationclicked = false
        counter += 1
        link = false
        endTask = true
         return result
        
    case "*":
    if let integerFirst = Int64(first), let integerSecond = Int64(andSecond){
         result = "\(integerFirst * integerSecond)"
        
        } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
        result = "\(doubleFirst * doubleSecond)"
        }
        operationclicked = false
        counter += 1
        link = false
        endTask = true
 return result
    case "/":
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
        operationclicked = false
        counter += 1
        link = false
        endTask = true
    return result
    default :
        return ""
    }
    
    
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
    //i tryed to prevent any options with debugging
    // and i probably need to check it better cause i think there are some tests they will never happen
    
    if value == "." && andthisLbl.text == "0" {
        andthisLbl.text?.append("\(value)")
    }else if (andthisLbl.text == "0" && counter == 0) || (endTask == true )  {
         andthisLbl.text = "\(value)"
         endTask = false
    } else if andthisLbl.text != "0" && operationclicked == false{
        andthisLbl.text?.append("\(value)")
        
    }else if andthisLbl.text != "0" && link == true && counter >= 1 && operationclicked == true && endTask == true {
        andthisLbl.text = ("\(value)")
        operationclicked = false
    
    }else if andthisLbl.text != "0" && link == true && counter >= 1 && operationclicked == false && endTask == true {
        andthisLbl.text?.append("\(value)")
    }else if andthisLbl.text != "0" && link == true && counter >= 1 && operationclicked == true {
        andthisLbl.text?.append("\(value)")
}else if andthisLbl.text != "0" && link == true && counter > 1 && operationclicked == false  {
        andthisLbl.text = "\(value)"
    }else if andthisLbl.text != "0" && operationclicked == true && counter > 1{
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


// i created a class but after all of the work done, i think it doesen`t make much sense
// i leave it in place anyway cause it works ! and I am waiting for your suggestion!

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
    

    
    
    
//this was the old code before understanding it was not dry
// so i put everything together under the func makingTheMath
   
    
//    func add (first: String, andSecond:String )-> String{
//        var result:String = ""
//        var managingOverFlow:Int = 0
//
//        if let integerFirst = Int(first), let integerSecond = Int(andSecond){
//           managingOverFlow = integerFirst + integerSecond
//            result = "\(managingOverFlow)"
//            } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
//            result = "\(doubleFirst + doubleSecond)"
//        }
//     return result
//
//        }
//
//func sub(first: String, andSecond:String) -> String {
//        var result:String = ""
//    if let integerFirst = Int(first), let integerSecond = Int(andSecond){
//            result = "\(integerFirst - integerSecond)"
//        } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
//            result = "\(doubleFirst - doubleSecond)"
//        }
//     return result
//    }
//
//
//
//    func div(first: String, andSecond:String) -> String {
//        var result:String = ""
//        if andSecond == "0"{
//            result = "Not a number"
//        }else if  first.contains(".") || andSecond.contains("."){
//            let doubleFirst = Double(first)!
//            let doubleSecond = Double(andSecond)!
//            result = "\(doubleFirst / doubleSecond)"
//        }else if let integerFirst = Int(first), let integerSecond = Int(andSecond){
//            if  integerFirst % integerSecond == 0 {
//                result = "\(integerFirst / integerSecond)"
//            }else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
//            result = "\(doubleFirst / doubleSecond)"
//        }
//        }
//        return result
//    }
//
//    func multiply(first: String, andSecond:String )-> String{
//        var result:String = ""
//        if let integerFirst = Int64(first), let integerSecond = Int64(andSecond){
//             result = "\(integerFirst * integerSecond)"
//
//            } else if let doubleFirst = Double(first), let doubleSecond = Double(andSecond) {
//            result = "\(doubleFirst * doubleSecond)"
//        }
//     return result
//
//    }
//
//    func percentage(first: String, andSecond:String )-> String{
//        var result:String = ""
//        if  first.contains(".") || andSecond.contains("."){
//           let doubleFirst = Double(first)!
//           let doubleSecond = Double(andSecond)!
//            result = "\((doubleFirst / doubleSecond)/100)"}
//        else if let integerFirst = Int(first), let integerSecond = Int(andSecond){
//            if  integerFirst % integerSecond == 0 {
//                result = "\((integerFirst * integerSecond)/100)"
//            }else {
//                result = "\(Double((integerFirst * integerSecond)/100))"
//            }
//            }
//     return result
//
//        }
//
//
    }

let number = Number()
