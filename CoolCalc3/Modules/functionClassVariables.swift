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
//    if endTask == true || userInput == "" || userInput.isEmpty == false {
    if andthisLbl.text == "0" || endTask == true {
         andthisLbl.text = "\(value)"
         endTask = false
        
    } else if andthisLbl.text != "0" && operationclicked == false  {andthisLbl.text?.append("\(value)")
    } else if operationclicked == true && andthisLbl.text?.isEmpty == false {
        andthisLbl.text = "\(value)"
        operationclicked = false
    } else {
        andthisLbl.text?.append("\(value)")
    }
//    }
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
        if let integerFirst = Int(first), let integerSecond = Int(andSecond){
                result = "\(integerFirst + integerSecond)"
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
        if let integerFirst = Int(first), let integerSecond = Int(andSecond){
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
