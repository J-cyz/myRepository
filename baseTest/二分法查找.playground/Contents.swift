//: Playground - noun: a place where people can play

import UIKit
//为数组添加二分法查询方法(只适用于有序数组)
extension Array where Element == Int {
    func binarySearch(_ x:Int) -> Bool {
        print(self)
        var result = false
        let min = self.startIndex //获取最小值下标
        let max = self.endIndex - 1 //获取最大值下标,endIndex获取到的下标值为最大下标+1

        if min > max {
            return false
        }

        let mid = Int((min + max)/2) //获取中间值下标 0+7/2 = 3
        let value = self[mid] //获取中间值

        if x == value {
            return true
        }
        if x < value {
            let array = min < mid ? Array(self[min..<mid]) : Array<Int>()
            result = array.binarySearch(x) //递归调用
        }
        if x > value {
            let array = mid < max ? Array(self[(mid+1)...]) : Array<Int>()
            result = array.binarySearch(x) //递归调用
        }
        return result
    }
}

let arr  = Array<Int>()

arr.binarySearch(10)


