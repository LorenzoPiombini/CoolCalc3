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
var conc = false
var calcWithPoint = true
var forceTheInput = true
var handleInput = true  //it allows the user to have correct input if i wants to put more than one number
var endTask = false // to handle an User option like linking more than one calcs
var result = ""
var forceTheInputWithZeroPoint = false
var counter = 0 // the same as above, variable used in if concatenation to handle some user behavior
var link = false
var history: [String] = [] // this is for the history btn, not installed yet, however I will add it in the future, I personally find it really helpful to see your old math operation

// the following is a function to allowed any operators btn to act like a equals btn(besides of multiply)
// I created this func days after the equals btn and Userexperience wise
// I think it should be slighty different than the equal btn
// I know it is not really DRY, however in order to have the behavior of equal btn on the operators btn is neccesery keep these functions separate

func equalAction (givenNumber: UILabel) -> String{
    
    switch userInput {
    case "+":
        if endTask == false {
            second = givenNumber.text
            givenNumber.text = add(first: first!, andSecond: givenNumber.text!)
        } else {
            givenNumber.text = add(first: givenNumber.text!, andSecond: second!)
        }
        operationclicked = false
        counter += 1
        endTask = true
        return givenNumber.text!
    case "-":
        if endTask == false {
            second = givenNumber.text
            givenNumber.text = sub(first: first!, andSecond: givenNumber.text!)
        } else {
            givenNumber.text = sub(first: givenNumber.text!, andSecond: second!)
        }
        operationclicked = false
        counter += 1
        endTask = true
        return givenNumber.text!
    case "/":
        if endTask == false {
            second = givenNumber.text
            givenNumber.text = div(first: first!, andSecond: givenNumber.text!)
        } else {
            givenNumber.text = div(first: givenNumber.text!, andSecond: second!)
        }
        operationclicked = false
        counter += 1
        endTask = true
        return givenNumber.text!

        case "*":
            if endTask == false  {
                second = givenNumber.text
            givenNumber.text = multiply(first: first!, andSecond: givenNumber.text!)
            }else if givenNumber.text!.count >= 11{
                //handling the overflow Integer issue
                    if let isAnInt = Int64 (givenNumber.text!){
                        givenNumber.text = "stop calc! preventing over Flow"
                        operationclicked = false
                        counter += 1
                        link = false
                    }else if let isADouble = Double(givenNumber.text!){
                        givenNumber.text = multiply(first: first!, andSecond: givenNumber.text!)
                        operationclicked = false
                        counter += 1
                        link = false
                    }} else {
                        givenNumber.text = multiply(first: givenNumber.text!, andSecond: second!)
                operationclicked = false
                counter += 1
                link = false
                
            }
            operationclicked = false
            counter += 1
            endTask = true
           
         return givenNumber.text!

    default:
        givenNumber.text = "Not a number"
        return givenNumber.text!
    }
    
}

// I am studying my code over and i think it is not really DRY,
// i will provide a better version:
// i`m putting together peaces of my code
// with this func I tryed to put everything together, how ever i was starting to lose every single detail that I reached.
func makingtheMath (first: String, andSecond:String, forThisOperator: String, usingThisLabel: UILabel ) -> String{
    
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













//functions to configure the button numbers, and showing the numbers on the Label( user input )
func autofill(forthisBtn: UIButton, andthisLbl: UILabel){
    var  title = forthisBtn.titleLabel
    var value:String = ""
    
    switch title?.text {
    case ".":
            value = number.point
        forceTheInputWithZeroPoint = true
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
    if value == "." && andthisLbl.text == "0" {
        andthisLbl.text?.append("\(value)") //if the user start using the point
    
    }else if value == "." && operationclicked == true && andthisLbl.text != "0" {
        andthisLbl.text = "0."
        calcWithPoint = false // it helps to get right behavior in an other else if 
    }
    else if andthisLbl.text == "0." && operationclicked == false{
        andthisLbl.text?.append("\(value)")//adding number after the value 0.
        
    }else if andthisLbl.text == "0." && operationclicked == true && forceTheInputWithZeroPoint == true{
        andthisLbl.text?.append("\(value)")//adding number after the value 0.
        endTask = false //it helps having a correct input scenario
        forceTheInput = false //it helps having a correct input scenario
    }
    else if andthisLbl.text!.contains("0.") && operationclicked == true && calcWithPoint == false  {
        andthisLbl.text?.append("\(value)") // this is for keep adding after the point if it is the second number of the calc
         
    }else if andthisLbl.text!.contains("0.") && operationclicked == true && calcWithPoint == true && forceTheInput == true{
        andthisLbl.text = ("\(value)") // allowed the user to put a new input after a link between calc using decimals
            handleInput = false //allows propper input in a else if
    }
    else if value == "." && andthisLbl.text != "0" && operationclicked == true && counter >= 0 && andthisLbl.text?.contains(".") == false {
        andthisLbl.text = "0" + value
        endTask = false
        forceTheInputWithZeroPoint = true // it helps trig the right input
        operationclicked = false // the same as above
    }else if (andthisLbl.text == "0" && counter == 0) || (endTask == true  )  {
         andthisLbl.text = "\(value)"// this is for the first number when the app start and for every first linked operation
        
         endTask = false // it helps getting the right outcome User wise
         
    } else if andthisLbl.text != "0" && operationclicked == false  {
        andthisLbl.text?.append("\(value)") //this If is for the second number and all the other inputs before making the first math calc
           
    }else if andthisLbl.text != "0" && operationclicked == true && handleInput == false{
        andthisLbl.text?.append("\(value)")
    }
    else if andthisLbl.text != "0" && operationclicked == true && conc == false {
        andthisLbl.text = "\(value)" // first figure of the second number 
        conc = true
    }else if andthisLbl.text != "0" && operationclicked == true && conc == true{
        andthisLbl.text?.append("\(value)") // second figure of the second number and so on 
    }
    // I believe after this point is avrything usless,
    // i won`t cancel to avoid headache!!!
    else if andthisLbl.text != "0" && link == true && counter >= 1 && operationclicked == true && endTask == true {
        andthisLbl.text = ("\(value)")
        operationclicked = false
    
    }
    else if andthisLbl.text != "0" && link == true && counter >= 1 && operationclicked == false && endTask == true {
        andthisLbl.text?.append("\(value)")
    }else if andthisLbl.text != "0" && link == true && counter == 0 && operationclicked == false && endTask == false{
        andthisLbl.text?.append("\(value)")
    }else if andthisLbl.text != "0" && link == true && counter == 0 && operationclicked == true && endTask == false{
        andthisLbl.text?.append("\(value)")
    }else if andthisLbl.text != "0" && link == true && counter >= 1 && operationclicked == true {
        andthisLbl.text?.append("\(value)")
}else if andthisLbl.text != "0" && link == true && counter > 1 && operationclicked == false  {
        andthisLbl.text = "\(value)"
    }else if andthisLbl.text != "0" && operationclicked == true && counter > 1{
        andthisLbl.text?.append("\(value)")
    }
    else if operationclicked == true && endTask == false && counter >= 1 {
        andthisLbl.text!.append("\(value)")
        //operationclicked = false
        //counter = 0
    }else if operationclicked == true && endTask == false && counter == 0{
        andthisLbl.text = "\(value)"
    }
    else if operationclicked == true && endTask == true {
        andthisLbl.text = "\(value)"
    }else if andthisLbl.text != "0" && link == true && counter == 0 && operationclicked == true && endTask == true {
        andthisLbl.text = "\(value)"
        operationclicked = false
    }else if andthisLbl.text != "0" && link == true && counter == 0 && operationclicked == true && endTask == false {
        andthisLbl.text!.append("\(value)")
    }
    else {
        andthisLbl.text = ("\(value)")
        link = true
    }
}

// i will keep the follwing functions as they are, cause i do not want to lose the options that i set up.

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


// i created a class but after all of the work done, i think it doesen`t make much sense
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
    
   
    }

let number = Number()
