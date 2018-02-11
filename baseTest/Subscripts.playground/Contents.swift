//: Playground - noun: a place where people can play

import UIKit

//Subscripts - 返回值都是subscript-get值,下标按照subscript参数
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    //带两个参数的下标
    subscript(row: Int, column: Int) -> Double {
        get {   //只读时，省略get、{}
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {   //用于外部赋值
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 10, columns: 10)
matrix[1,5] = 100
matrix[1,5]










