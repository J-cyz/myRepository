//
//  MyAlertViewController.swift
//  baseTest
//
//  Created by macmini on 2017/8/8.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class MyAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor.black
        
//        let messageFontDescriptor = UIFontDescriptor.init(fontAttributes: [
//            UIFontDescriptorFamilyAttribute:"Arial",
//            UIFontDescriptorNameAttribute:"Arial-ItalicMT",
//            ])
        
        let messageFont = UIFont.init(descriptor: UIFontDescriptor(), size: 15.0)
        let messageAttribute = NSMutableAttributedString.init(string: self.message!)
        messageAttribute.addAttributes([NSFontAttributeName:messageFont,
                                        NSForegroundColorAttributeName:UIColor.black],
                                       range:NSMakeRange(0, (self.message?.characters.count)!))
        self.setValue(messageAttribute, forKey: "attributedMessage")
    }
}
