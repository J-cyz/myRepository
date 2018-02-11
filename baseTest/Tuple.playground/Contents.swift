//: Playground - noun: a place where people can play

import UIKit

let rect = CGRect(x: 0, y: 0, width: 100, height: 100)

/*
 
    atDistance:切割大小
    from:
        XY轴正方向 ↘︎
        .maxXEdge:从X轴最大边缘处反向开始切割
        .maxYEdge:从Y轴最大边缘处反向开始切割
        .minXEdge:从X轴最小边缘处正向开始切割
        .minYEdge:从Y轴最小边缘处正向开始切割
*/

let (rectMaxX_one,rectMaxX_two) = rect.divided(atDistance: 80, from: .maxXEdge)
let (rectMaxY_one,rectMaxY_two) = rect.divided(atDistance: 80, from: .maxYEdge)
let (rectMinX_one,rectMinX_two) = rect.divided(atDistance: 80, from: .minXEdge)
let (rectMinY_one,rectMinY_two) = rect.divided(atDistance: 80, from: .minYEdge)

print(rectMaxX_one,rectMaxX_two)
print(rectMaxY_one,rectMaxY_two)
print(rectMinX_one,rectMinX_two)
print(rectMinY_one,rectMinY_two)

//将元组进行分解获取
let tuple = (code:404,message:"Not Found")
var (code,message) = tuple
print(code,message)
print(tuple.0,tuple.1)
print(tuple.code,tuple.message)

//元组的大小比较
//逐个元组成员对比,得到结果时返回,字符串按照字符串内字符逐个比较知道得出结果
(9,8,7,6,5,4) > (4,9,8,7,6,5)
("applez",1) > ("applea",1)



10+25+65.14
56.2+61.5+1850+141+97
7190.84-(10+25+65.14+56.2+61.5+1850+141+97)





