//
//  Calculator_SwiftApp.swift
//  Calculator-Swift
//
//  Created by Bill Haku on 2021/06/15.
//

import SwiftUI

class calculator {
    var a: Double
    var b: Double
    var type: Character
    var dot: Character
    var result: Double
    func work() -> Double {
        if(self.type == "+") {
            return self.a + self.b
        }
        if(self.type == "-") {
            return self.a - self.b
        }
        if(self.type == "*") {
            return self.a * self.b
        }
        if(self.type == "/") {
            return self.a / self.b
        }
        else {
            return 0
        }
    }
    init(a: Double, b: Double, type: Character, dot: Character, result: Double) {
        self.a = a
        self.b = b
        self.type = type
        self.dot = dot
        self.result = result
    }
}

var cal = calculator(a: 0, b: 0, type: "?", dot: " ", result: 0)

@main
struct Calculator_SwiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
