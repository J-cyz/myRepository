//
//  TextFieldViewController.swift
//  baseTest
//
//  Created by macmini on 2018/1/12.
//  Copyright © 2018年 macmini. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //判断是否输入
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //只允许输入数字与.
        guard "0123456789.".contains(string) else{
            if string == "" { //如果为退格键
                return true
            }
            return false
        }
        //若当前为空且输入字符为0或.
        if textField.text! == "" && (string == "0" || string == "." ){
            return false
        }
        //若当前含有.且输入字符为.
        if textField.text!.contains(".") && string == "."{
            return false
        }
        //若当前字符数大于5时,最大字符为6位有效数
        if textField.text!.characters.count > 5 {
            return false
        }
        return true
    }
}
