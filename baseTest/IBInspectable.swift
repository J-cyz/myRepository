//
//  IBInspectable.swift
//  baseTest
//
//  Created by macmini on 2017/7/1.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

//单独设置类需要耦合设置class文件,可以在sb上实时显示
@IBDesignable class cuntomLabel: UILabel {
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            if newValue > 0{
                layer.borderWidth = newValue
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor{
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}

//对控件拓展不需要耦合设置class文件,但无法在sb上实时显示
extension UILabel{
    @IBInspectable var cornerRadius_ex: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth_ex: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            if newValue > 0{
                layer.borderWidth = newValue
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    @IBInspectable var borderColor_ex: UIColor{
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
