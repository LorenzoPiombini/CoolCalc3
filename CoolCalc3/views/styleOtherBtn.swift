//
//  styleOtherBtn.swift
//  CoolCalc3
//
//  Created by Lorenzo piombini on 9/26/20.
//

import UIKit

@IBDesignable
class styleOtherBtn: UIButton {
    override func prepareForInterfaceBuilder() {
        customBtnOperator()
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        customBtnOperator()
    }

    func customBtnOperator(){
        backgroundColor = #colorLiteral(red: 1, green: 0.3778250217, blue: 0.1979584694, alpha: 1)
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(UIColor.white, for: .normal)
    }


}
