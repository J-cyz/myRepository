//
//  NSAttr.swift
//  baseTest
//
//  Created by macmini on 2017/11/7.
//  Copyright © 2017年 macmini. All rights reserved.
//

/*
 富文本
 NSAttributedString         //常量富文本容器
 NSMutableAttributedString  //变量富文本容器
 _.addAttributes()  //添加属性
 [NSForegroundColorAttributeName: UIColor(),
 NSFontAttributeName: UIFont()],    //字体属性
 range: NSRange //字符数组
 NSTextAttachment           //子属性
 _.bounds = CGRect(x: _, y: _, width: _, height: _) //相对位置
 _.image = UIImage()    //图片
 NSAttributedString(attachment: _)  //子对象插入富文本容器
 
 拓展
 NSRange    //字符数组
 let nsText = "一二三四五" as NSString
 NSMakeRange(0,4)
 NSRange.init(location: 0, length: nsText.length)
 */


import Foundation
import UIKit

//实例

class NSAttr {
    func test(){
        
        //子原件_图标
        let icon = NSTextAttachment()
        icon.bounds = CGRect(x: 0, y: 0, width: 36, height: 18)
        icon.image = UIImage()
        let img = NSAttributedString(attachment: icon)
        
        //子原件_名字
        let name = NSMutableAttributedString(string: "_趣机直播:_")
        name.addAttributes([NSForegroundColorAttributeName: UIColor.black,
                            NSFontAttributeName: UIFont.systemFont(ofSize: 16)],
                           range: NSMakeRange(0, 6)) //设置字体
        
        //子原件_内容
        let contentText = "内容体"
        let nsContentText = NSString(string: contentText) // contentText as NSString
        let content = NSMutableAttributedString(string: contentText)
        let range = NSRange.init(location: 0, length: nsContentText.length)
        content.addAttributes([NSForegroundColorAttributeName: UIColor.black,
                               NSFontAttributeName: UIFont.systemFont(ofSize: 16)],
                              range: range)
        
        //组装各原件
        let main = NSMutableAttributedString() //主容器
        main.append(img)
        main.append(name)
        main.append(content)
        
        //重排
        let paragraphStyle = NSMutableParagraphStyle() //初始化格式参数
        paragraphStyle.lineBreakMode = .byWordWrapping //换行方式
            /*
             byCharWrapping     //字符为单位
             byClipping         //剪切至文本大小
             byTruncatingHead   //...首端文字
             byTruncatingMiddle //缩略...文字
             byTruncatingTail   //缩略尾部...
             byWordWrapping     //单词为单位,中文中的与byCharWrapping无差别
            */
        paragraphStyle.alignment = .left //对齐方式
        paragraphStyle.lineSpacing = 10 //段落间距
        main.addAttributes([NSParagraphStyleAttributeName: paragraphStyle],
                           range: NSRange.init(location: 0, length: main.length))
        
        //tableViewCell展示所需元素:1.富文本, 2.富文本对应的CGSize, 3.Cell行高(富文本行高+行间距)
        
        //带前缀的大小计算
        let prefix = NSTextAttachment()
        prefix.bounds = CGRect(x: 0, y: 0, width: 18, height: 18)
        
        let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: 18), //字体大小
                     NSParagraphStyleAttributeName: paragraphStyle, //套用重排格式
                     NSAttachmentAttributeName: prefix] //添加的前缀
        
//        let boundingSize = nsText.bounding
    }
}


//NSString.length 计算字符串字数,并不使用字节数计算,更加准确
//String.characters.count 计算字符串字数,并不计算emoji字符数
//NSAttributedString.string 获取富文本对应的字符串












