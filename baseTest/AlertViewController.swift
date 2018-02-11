//
//  AlertViewController.swift
//  baseTest
//
//  Created by macmini on 2017/8/8.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    @IBAction func AlertBt(_ sender: UIButton) {
        showAlertView("", "是否确认要关闭") { 
            print("成功")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
    /*
     let titleAttribute = NSMutableAttributedString.init(string: self.title!)
     titleAttribute.addAttributes([NSFontAttributeName:titleFont,
     NSForegroundColorAttributeName:UIColor.red],
     range:NSMakeRange(0, (self.title?.characters.count)
    */
    
    
    
    func showAlertView(_ title:String, _ msg:String, check:@escaping ()->()){
        let alertController = MyAlertController(title: "\(title)", message: "\(msg)", preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "确定", style: .default) { (UIAlertAction) in
            check()
        }
        let cancelAction = UIAlertAction(title: "取消", style:.default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(checkAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
