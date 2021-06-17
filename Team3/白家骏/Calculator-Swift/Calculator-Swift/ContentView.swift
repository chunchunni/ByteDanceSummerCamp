//
//  ContentView.swift
//  Calculator-Swift
//
//  Created by Bill Haku on 2021/06/15.
//

import SwiftUI

extension View {
    func expandable () -> some View {
        ZStack {
            Color.clear
            self
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    @State var result = (cal.result == floor(cal.result) ? ("\(Int(cal.result))") : ("\(cal.result))"))
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("\(result)")
                    .frame(height: 100, alignment: .center)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("AC")
                        .foregroundColor(Color.black)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.lightGray))
                    .clipShape(Circle())
                    .padding(5)
                Button(action: {}, label: {
                    Text("+/-")
                        .foregroundColor(Color.black)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.lightGray))
                    .clipShape(Circle())
                    .padding(5)
                Button(action: {}, label: {
                    Text("%")
                        .foregroundColor(Color.black)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.lightGray))
                    .clipShape(Circle())
                    .padding(5)
                Button(action: {}, label: {
                    Text("÷")
                        .foregroundColor(.white)
                })
                .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                .background(Color(.sRGB, red: 255/255, green: 169/255, blue: 11/255))
                .clipShape(Circle())
                .padding(5)
            }
            
            HStack {
                Button(action: {}, label: {
                    Text("7")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)
                
                Button(action: {}, label: {
                    Text("8")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("9")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("×")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.sRGB, red: 255/255, green: 169/255, blue: 11/255))
                    .clipShape(Circle())
                    .padding(5)

            }
            HStack {
                Button(action: {}, label: {
                    Text("4")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("5")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("6")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("-")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.sRGB, red: 255/255, green: 169/255, blue: 11/255))
                    .clipShape(Circle())
                    .padding(5)

            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("1")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("2")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("3")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("+")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.sRGB, red: 255/255, green: 169/255, blue: 11/255))
                    .clipShape(Circle())
                    .padding(5)

            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Text("0")
                            .foregroundColor(.white)
                            .padding(25)
                        Spacer()
                    }
                })
                    .frame(width: screenWidth / 2.5, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .cornerRadius(70)
                    .padding(5)

                Button(action: {}, label: {
                    Text(".")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.darkGray))
                    .clipShape(Circle())
                    .padding(5)

                Button(action: {}, label: {
                    Text("=")
                        .foregroundColor(.white)
                })
                    .frame(width: screenWidth / 6, height: screenWidth / 6, alignment: .center)
                    .background(Color(.sRGB, red: 255/255, green: 169/255, blue: 11/255))
                    .clipShape(Circle())
                    .padding(5)

            }
        }
        .font(.title3)
        .expandable()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
