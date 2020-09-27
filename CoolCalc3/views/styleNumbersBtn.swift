//
//  styleNumbersBtn.swift
//  CoolCalc3
//
//  Created by Lorenzo piombini on 9/26/20.
//

import UIKit

@IBDesignable
class styleNumbersBtn: UIButton {

    
        override func prepareForInterfaceBuilder() {
            customBtn()
        }
        
        override  func awakeFromNib() {
            super.awakeFromNib()
            customBtn()
        }

        func customBtn(){
            backgroundColor = #colorLiteral(red: 0.7919034362, green: 0.7920373082, blue: 0.7918857932, alpha: 1)
            layer.cornerRadius = 5
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
        }

    }


