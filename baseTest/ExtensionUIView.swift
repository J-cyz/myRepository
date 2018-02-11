//
//  ExtensionUIView.swift
//  baseTest
//
//  Created by macmini on 2017/6/29.
//  Copyright © 2017年 macmini. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    var x:CGFloat {
        get {
            return frame.origin.x
        }
        set(newVal) {
            var tmpFrame:CGRect = frame
            tmpFrame.origin.x = newVal
            frame = tmpFrame
        }
    }
    
    var y:CGFloat {
        get {
            return frame.origin.y
        }
        set(newVal) {
            var tmpFrame:CGRect = frame
            tmpFrame.origin.y = newVal
            frame = tmpFrame
        }
    }
    
    var height:CGFloat {
        get {
            return frame.size.height
        }
        set(newVal) {
            var tmpFrame:CGRect = frame
            tmpFrame.size.height = newVal
            frame = tmpFrame
        }
    }
    
    var width : CGFloat {
        get {
            return frame.size.width
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.width = newVal
            frame = tmpFrame
        }
    }
}
