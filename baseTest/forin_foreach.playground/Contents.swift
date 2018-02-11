//: Playground - noun: a place where people can play

//循环
//https://www.jianshu.com/p/d3a4ca133b55

import UIKit

var array = [["1","2","3","4"],
             ["1","2","3","4"],
             ["1","2","3","4"],
             ["1","2","3","4"]]

//for-in
func printUsingForIn(){
    for (index,rows) in array.enumerated() {
        for one in rows{
            if one == "1"{
                continue //跳过本次循环余下代码
            }
            if one == "3"{
                return //跳出函数
            }
            if one == "4"{
                break //跳出循环
            }
            print("row_\(index) "+one)
        }
    }
}
printUsingForIn()
print("**********************")

//foreach
func printUsingForEach(){
    var index = 0
    array.forEach { (rows) in
        rows.forEach({ (one) in
            if one == "3"{
                return //跳过本次循环余下代码,forEach无法跳出函数,且无continue、break方法
            }
            print("row_\(index) "+one)
        })
        index += 1
    }
}
printUsingForEach()





