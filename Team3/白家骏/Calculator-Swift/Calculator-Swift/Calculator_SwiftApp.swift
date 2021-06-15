//
//  Calculator_SwiftApp.swift
//  Calculator-Swift
//
//  Created by Bill Haku on 2021/06/15.
//

import SwiftUI

class calculator {
    var a: Float
    var b: Float
    var type: Character
    var dot: Character
    func work() -> Float {
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
    init(a: Float, b: Float, type: Character, dot: Character) {
        self.a = a
        self.b = b
        self.type = type
        self.dot = dot
    }
}

var cal = calculator(a: 0, b: 0, type: "?", dot: " ")

@main
struct Calculator_SwiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
