//
//  ContentView.swift
//  Calculator-Swift
//
//  Created by Bill Haku on 2021/06/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("AC")
                        .foregroundColor(Color.black)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 4, alignment: .center)
                    .background(Color(.lightGray))
                    .clipShape(Circle())
                    .padding(5)
                Button(action: {}, label: {
                    Text("+/-")
                        .foregroundColor(Color.black)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 4, alignment: .center)
                    .background(Color(.lightGray))
                    .clipShape(Circle())
                    .padding(5)
                Button(action: {}, label: {
                    Text("%")
                        .foregroundColor(Color.black)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 4, alignment: .center)
                    .background(Color(.lightGray))
                    .clipShape(Circle())
                    .padding(5)
                Button(action: {}, label: {
                    Text("÷")
                        .foregroundColor(Color.black)
                })
                .frame(width: screenWidth / 6, height: screenWidth / 4, alignment: .center)
                .background(Color(.systemYellow))
                .clipShape(Circle())
                .padding(5)
            }
            
            HStack {
                Button(action: {}, label: {
                    Text("7")
                })
                Button(action: {}, label: {
                    Text("8")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("9")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("×")
                })
            }
            HStack {
                Button(action: {}, label: {
                    Text("4")
                })
                Button(action: {}, label: {
                    Text("5")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("6")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("-")
                })
            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("1")
                })
                Button(action: {}, label: {
                    Text("2")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("3")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("+")
                })
            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("0")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text(".")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("=")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
