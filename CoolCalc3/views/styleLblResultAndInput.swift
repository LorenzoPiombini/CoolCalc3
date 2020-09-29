//
//  styleLblResultAndInput.swift
//  CoolCalc3
//
//  Created by Lorenzo piombini on 9/26/20.
//

import UIKit

@IBDesignable
class styleLblResultAndInput: UILabel {

    
    override func prepareForInterfaceBuilder() {
        customLbl()
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        customLbl()
    }

    func customLbl(){
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 5
        textColor = .white
        textAlignment = .right
        text = "0"
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.1
        
       
    }
}
