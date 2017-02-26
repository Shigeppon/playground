//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func timeElapsed <T> (operation: @autoclosure () -> T)  -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    return Double(timeElapsed)
}

func binom_v1(_ n: Int, _ k: Int) -> Int {
    if k == 0 {
        return 1
    } else if n == k {
        return 1
    } else {
        return binom_v1(n - 1, k - 1) + binom_v1(n - 1, k)
    }
}


func binom_v2(_ n: Int, _ k: Int) -> Int {
    if k == 0 {
        return 1
    } else if n == k {
        return 1
    } else {
        return n / k * binom_v2(n - 1, k - 1)
    }
}

let MAXNUM = 1000
var c = [[Int?]](repeating: [Int?](repeating: nil, count: MAXNUM), count: MAXNUM)

func binom_v3(_ n: Int, _ k: Int) -> Int {
    if let k = [k, n - k].min() {
        if let result = c[n][k] {
            print("exist")
            return result
        } else {
            if k == 0 {
                return 1
            } else if n == k {
                return 1
            } else {
                let result = n / k * binom_v2(n - 1, k - 1)
                c[n][k] = result
                return result
            }
        }
    } else {
        return 0
    }
}

func binom_test() {
    for n in 0..<30 {
        for k in 0..<n {
            print(binom_v3(n,k))
        }
    }
}

timeElapsed(operation: binom_test())