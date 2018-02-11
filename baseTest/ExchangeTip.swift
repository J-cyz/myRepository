//
//  ExchangeTip.swift
//  baseTest
//
//  Created by macmini on 2017/8/8.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class ExchangeTip: UIView {
    @IBAction func closeBt(_ sender: UIButton) {
        tapClose()
    }
    @IBOutlet weak var currentCash: UILabel!
    @IBOutlet weak var exchangeQubi: UILabel!

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func tapClose(){
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0
        }) { (f) in
            self.removeFromSuperview()
        }
    }
    
//    class func setup()->ExchangeTip{
//        let arr = Bundle.main.loadNibNamed(ExchangeTipView.identifierString, owner: nil, options: nil)
//        let view = arr?.first as! ExchangeTipView
//        view.frame = CGRect(x: 0,y: 0,width: screenWidth,height: screenHeight)
//        view.tag = LoginGiftsView.identifierString.hash
//        view.alpha = 0
//        return view
//    }
}
