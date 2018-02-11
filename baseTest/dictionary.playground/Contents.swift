//: Playground - noun: a place where people can play

import UIKit

var nameDict = [Int: String]()
nameDict[1] = "a"
nameDict[2] = "b" //队首入列
                        nameDict
nameDict = [:]
nameDict[3] = "c"
nameDict.updateValue("小王", forKey: 4)   //队尾入列
                        nameDict
nameDict.updateValue("小小", forKey: 3)
                        nameDict
nameDict[3] = nil
nameDict.removeValue(forKey: 4) //删除
                        nameDict
nameDict = [1:"e",2:"d",3:"c",4:"b",5:"a"]
for (key,value) in nameDict{
    print("\(key):\(value)")
}
var list = nameDict.sorted {$0.value < $1.value}
                        print(list)
list = nameDict.sorted(by: < )
                        print(list)
                        print(nameDict)
for key in nameDict.keys{
    
}

for value in nameDict.values{
    
}

4000*50

//对于字典的查找,由于存在无法查找道的情况,故默认返回值为optional
var findItem = nameDict[6]



func textForHeight(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let nsstring = NSString(string: text)
    let size = nsstring.boundingRect(with: CGSize(width: width, height: 0), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil)
    return size.height
}


let title = UILabel()
let body = UILabel()
let imgView = UIImageView()
let moreContentView = UIView()
var imgViewHeight:CGFloat = 0
var bodyHeigt:CGFloat = 0

//var msg:NSDictionary? = nil
var msg:[NSDictionary?] = [
    //错误字典
    ["msgtype":1,"action":"none"],
    //正确字典
    ["content":["body":"文字内容","title":"标题"],"msgtype":1,"action":"none"],                                       //文字不跳转
    ["content":["body":"文字内容","title":"标题"],"msgtype":1,"action":"open","url":"http or inne"],                  //文字跳转
    ["content":["imgurl":"图片地址","title":"标题"],"msgtype":2,"action":"none"],                                     //图片不跳转
    ["content":["imgurl":"图片地址","title":"标题"],"msgtype":2,"action":"open","url":"http or inne"],                //图片跳转
    ["content":["imgurl":"图片地址","body":"文字内容","title":"标题"],"msgtype":3,"action":"none"],                    //图文不跳转
    ["content":["imgurl":"图片地址","body":"文字内容","title":"标题"],"msgtype":3,"action":"open","url":"http or inne"]//图文跳转
]
var msgChose = msg[6]
let content = msgChose?["content"] as? [String:Any]
let msgtype = msgChose?["msgtype"] as? Int
let action = msgChose?["action"] as? String
let url = msgChose?["url"] as? String
let bodyFont = UIFont.systemFont(ofSize: 12)
let titleFont = UIFont.systemFont(ofSize: 12)

func loadMsg(){
    if msgtype != nil {
        let body = content?["body"] as? String
        let imgurl = content?["imgurl"] as? String
        switch msgtype! {
        case 1:
            if body != nil {
                imgViewHeight = 0
                bodyHeigt = textForHeight(text: body!, font: bodyFont, width: 50)
            }
        case 2:
            if imgurl != nil {
                imgViewHeight = 200
                bodyHeigt = 0
            }
        case 3:
            if body != nil && imgurl != nil {
                imgViewHeight = 200
                bodyHeigt = textForHeight(text: content!["body"] as! String, font: bodyFont, width: 50)
            }
        default:
            print("unkonw code")
        }
    }
    
    if action == "open" && url != nil{
        print("跳转至:\(url!)")
    }
}



















