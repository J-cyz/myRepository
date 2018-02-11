//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var num:Int?{
    didSet{
        print("\(String(describing: num))")
    }
}

num = nil
var offLineRouteDic = [1:"好友申请数据",2:"好友申请处理数据",4:"私聊数据",7:"群组申请数据",13:"群组踢人事件",10:"群组邀请数据",11:"群组邀请处理数据",6:"群组解散删除数据",9:"群组退出事件",999:"群组离线消息",33:"客服消息",14:"群组成员名片修改",12:"群组设置管理员",23:"群组取消管理员",8:"群组处理数据"]
for (id,name) in offLineRouteDic.sorted(by: { (a: (key: Int, value: String), b: (key: Int, value: String)) -> Bool in a.key<b.key }){
    print("\(id):\(name)")
}

Double((35+10+9))/45
1.0/45