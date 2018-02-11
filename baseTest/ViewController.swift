//
//  ViewController.swift
//  baseTest
//
//  Created by macmini on 2017/5/27.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let bview = UIView()
        bview.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.3921568627, blue: 0.4705882353, alpha: 1)
        super.viewDidLoad()
        //1.Home目录，整个应用程序各文档所在的目录
        let homeDirectory = NSHomeDirectory()
        
        //2.Documnets目录，用户文档目录，iTunes备份和恢复的时候会包括此目录,一般使用改目录存放
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        var documentPath = documentPaths[0]
        documentPath = NSHomeDirectory() + "/Documents" //等价
        
        //3.Library/Preferences目录，存放包含应用程序的偏好设置文件
        let libraryPaths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        var libraryPath = libraryPaths[0]
        libraryPath = NSHomeDirectory() + "/Library" //等价
        
        //4.Library/Caches目录，主要存放缓存文件
        let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        var cachePath = cachePaths[0]
        cachePath = NSHomeDirectory() + "/Library/Caches" //等价
        
        ////                    写入文件
        // data为json文件
        let data = Data()
        // options:[WritingOptions]，写入配置，注意添加try并判断写入结果
        let dataStatus = (try? data.write(to: URL(fileURLWithPath:cachePath + "/data.json"), options: [NSData.WritingOptions.atomic])) != nil
        dataStatus ? print("data文件写入成功") : print("data文件写入失败")
        
        //字典的写入,可在字典内写入data，并标注名字，为便于读取，单个字典对应单个data
        let dictionary:NSDictionary = ["name":"testFile","value":data]
        let dictStatus = dictionary.write(toFile: cachePath + "/\(dictionary["name"] as! String)", atomically: true)
        dictStatus ? print("字典写入成功") : print("字典写入失败")
        
        ////                    读取文件
        //读取某根目录下的所有 文件名
        let paths = try? FileManager.default.contentsOfDirectory(atPath: cachePath)
        print(paths as Any)
        for path in paths! {
            //NSDictionary只识别字典，其余不返回值
            let cacheDictionary = NSDictionary(contentsOfFile: cachePath + "/\(path)")
            print(cacheDictionary as Any)
        }
        
        
        
        let manage = FileManager.default
        //获取homeDirectory路径下的所有子目录及子文件
        let subFilePath = manage.subpaths(atPath: homeDirectory)
        var fileSize:Double = 0
        for path in subFilePath! {
            let fileAbsoluePath = homeDirectory + "/" + path
            print(path)
            fileSize += returnFileSize(path: fileAbsoluePath)
        }
        print("size:\(Float(fileSize))mb")
    }
    func returnFileSize(path:String) -> Double {
        let manager = FileManager.default
        var fileSize:Double = 0
        do {
            let attr = try manager.attributesOfItem(atPath: path)
            fileSize = Double(attr[FileAttributeKey.size] as! UInt64)
            let dict = attr as NSDictionary
            fileSize = Double(dict.fileSize())
        } catch {
            dump(error)
        }
        return fileSize/1024/1024
    }


}

