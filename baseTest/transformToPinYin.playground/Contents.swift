//: Playground - noun: a place where people can play

import UIKit

let chi:String = "中文"

extension String{
    func transformToPinYin() -> String{
        let mutableString = NSMutableString(string: self)
        //汉字转拼音
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        var string = String(mutableString)
        //去掉拼音的音标
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        //去掉空格
        string = String(mutableString)
        return string.replacingOccurrences(of: " ", with: "")
    }
}

print(chi.transformToPinYin())
for _ in 0...10{
    
}
DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:
    {
        
})