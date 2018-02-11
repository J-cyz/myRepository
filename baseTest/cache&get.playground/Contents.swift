//: Playground - noun: a place where people can play
//http://www.hangge.com/blog/cache/detail_765.html
//PS:在playground中无法进行缓存写入

import UIKit

////                    创建根目录
class pathConfig{
   static var creatPath:String{
        //自定义目录
        let path = NSHomeDirectory() + "/Library/Caches/path"
        //查询是否存在该根目录
        if !FileManager.default.fileExists(atPath: path){
            //创建根目录
            let _ = try? FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
        }
        //返回创建好目录
        return NSHomeDirectory() + "/Library/Caches/path"
    }
}
//创建目录并返回创建的目录
let path = pathConfig.creatPath


////                    获取根目录

//1.Home目录，整个应用程序各文档所在的目录
let homeDirectory = NSHomeDirectory()

//2.Documnets目录，用户文档目录，iTunes备份和恢复的时候会包括此目录
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
let paths = try FileManager.default.contentsOfDirectory(atPath: cachePath)
print(paths)
for path in paths {
    let cacheDictionary = NSDictionary(contentsOfFile: cachePath + "/\(path)")
}

let manage = FileManager.default
let subFilePath = manage.subpaths(atPath: homeDirectory)
var fileSize:Double = 0
for path in subFilePath! {
    let fileAbsoluePath = homeDirectory + "/" + path
//    fileSize += retureFileSize(fileAbsoluePath)
}

/*缓存文件整体过程
    1.从url获取data
    2.data转字典
    3.创建根目录
    4.写入字典至根目录
*/














