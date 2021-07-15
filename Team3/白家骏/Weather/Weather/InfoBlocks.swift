//
//  InfoBlock.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/05.
//

import SwiftUI

struct InfoBlock: View {
    var title: String
    var info: String
    var img: UIImage?
    var tips: String?
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title3)
                Spacer()
                if img != nil {
                    Image(uiImage: img!)
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                }
                Text(info)
                    .multilineTextAlignment(.leading)     
            }
            if tips != nil {
                HStack {
                    Text(tips!)
                        .padding(5)
                    Spacer()
                }
            }
        }
        .padding(10)
    }
}

struct InfoBlockSmall: View {
    var title1: String
    var info1: String
    var title2: String
    var info2: String
    var img: UIImage?
    
    var body: some View {
        HStack {
            VStack {
                Text(title1)
                    .padding(5)
                Text(info1)
                    .font(.title)
            }
            Spacer()
            //.frame(width: UIScreen.main.bounds.width / 2)
            VStack {
                Text(title2)
                    .padding(5)
                Text(info2)
                    .font(.title)
            }
            //.frame(width: UIScreen.main.bounds.width / 2)
        }
        .padding(10)
    }
}

struct InfoBlockHori: View {
    var hours: String
    var tem: String
    var wea_img: UIImage?
    
    var body: some View {
        VStack {
            Text(hours)
            if wea_img != nil {
                Image(uiImage: wea_img!)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(10)
            }
            Text(tem)
        }
        .padding(15)
    }
}

struct InfoBlockFuture: View {
    var day: String
    var wea: String
    var tem1: String
    var tem2: String
    var img: UIImage?
    
    var body: some View {
        HStack {
            Text(day)
            Spacer()
            Text(wea)
            if img != nil {
                Image(uiImage: img!)
                    .resizable()
                    .frame(width: 16, height: 16, alignment: .center)
            }
            Spacer()
            Text("\(tem2) ~ \(tem1)")
        }
    }
}

struct InfoBlock_Previews: PreviewProvider {
    static var previews: some View {
        InfoBlock(title: "Temperature", info: "23", img: UIImage(named: "yun"), tips: "tips")
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 100))
        //InfoBlockSmall(title1: "Wind", info1: "Wind",title2: "" img: nil)
         //   .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 100))
    }
}
