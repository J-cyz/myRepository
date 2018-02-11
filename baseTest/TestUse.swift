//
//  TestUse.swift
//  baseTest
//
//  Created by macmini on 2017/9/25.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class TestUse: UIViewController {
    @IBAction func tap(_ sender: UISwitch) {
        
//        sender.isOn = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        //斜杠测试
//        let str = "\\\\9."  //实际为\\9.
//        let pattern = "^\\\\{2}[0-9]."  //该匹配法则按顺序
//        //邮箱测试
//        let str = "339662012@gmail.com"
//        let pattern = "^\\w*@\\w*(.\\w+)$"    // 邮箱格式: ___@__.__
//        let regex = try? NSRegularExpression(pattern: pattern, options: [])
//        if regex != nil {
//            let results = regex!.matches(in: str, options: [], range: NSRange(location:0, length:str.characters.count))
//            for result in results {
//                print(result.range) //对应位置
//                let string = (str as NSString).substring(with: result.range)
//                print(string)
//            }
//        }
//        let matchRule = "^\\w*@\\w*(.\\w+)$"
//        let matcher:RegexHelper
        
        let dic = ["name":"老王"] as [String:AnyObject]
        let p = Person(dict: dic)
        print(p.name)
        let url = "http://qimg1.store.quji.com/fansgroup/yingyuanbang.png"
        let img = urlToImage(url: url)

    }
    
    func urlToImage(url:String)->UIImage{
        var newurl = url
        if url.contains("/qujifs/"){
            newurl+="@100w_100h.png"
        }
        guard let nsurl = URL(string: newurl) else{
            print("NSURL空url->\(newurl)")
            return UIImage() //后期改成加载失败时图片
        }
        let data:NSData! = NSData(contentsOf: nsurl)
        if data != nil {
            if let img = UIImage(data: data as Data) {
                return img
            }
            return UIImage() //后期改成加载失败时图片
        }else{
            return UIImage() //后期改成加载失败时图片
        }
    }
    
}

class Person: NSObject {
    var name: String?
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}

struct RegexHelper{
    let regex: NSRegularExpression
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        let results = regex.matches(in: input, options: [], range: NSMakeRange(0, input.characters.count))
        return results.count > 0
    }
}
