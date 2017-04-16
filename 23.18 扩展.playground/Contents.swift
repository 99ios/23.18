//: Playground - noun: a place where people can play

import UIKit

/*****************计算型属性****************/
extension Int{
    var B: Int { return self }
    var KB : Int { return self * 1024 }
    var MB: Int { return self * 1024*1024 }
    var GB: Int { return self * 1024*1024*1024 }
}

let fileSize = 4.KB
print("1KB = \(fileSize) Byte")

let bigFileSize = 4.GB
print("1GB = \(bigFileSize) Byte")

let sum = 1024.KB + 3.MB

print("1024B + 3KB = \(sum) Byte")


/*****************构造器****************/
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    func toString()  {
        print("[origin:(\(origin.x),\(origin.y)),size:(\(size.width),\(size.height))]")
    }
}
extension Rect{
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let r1 = Rect()
r1.toString()

let r2 = Rect(origin: Point(x:10,y:10), size: Size(width: 6.0, height: 6.0))
r2.toString()

let r3 = Rect(center: Point(x:13,y:13), size: Size(width: 6.0, height: 6.0))
r3.toString()


/*******************方法******************/
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
//调用三次闭包函数
3.repetitions{
    print("Hello!")
}
//Hello!
//Hello!
//Hello!

//如果函数最后一个参数是闭包，也可以使用尾随闭包让调用更加简洁
3.repetitions {
    print("Goodbye!")
}
//Goodbye!
//Goodbye!
//Goodbye!

/******************可变实例方法******************/
extension Int {
    mutating func addOne() {
        self +=  1
    }
}
var someInt = 3
someInt.addOne()
//someInt现在的值为4

/******************下标******************/

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]  // 返回 5
746381295[1] // 返回 9


/******************嵌套类型******************/
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
        case .Zero:
            print("0 ", terminator: "")
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])

