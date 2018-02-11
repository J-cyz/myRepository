//
//  transformTest.swift
//  baseTest
//
//  Created by macmini on 2017/6/3.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class transformTest: UIViewController {
    @IBOutlet weak var testView: UIView!
    @IBAction func actionBt(_ sender: Any) {
        animating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func animating(){
        testView.transform = CGAffineTransform(translationX: -280, y: -20)
//        testView.transform.tx = -280
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.testView.transform.tx = 0
            self.testView.transform.ty = 0
        }, completion: nil)
    }

}
