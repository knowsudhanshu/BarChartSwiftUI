//
//  ContentView.swift
//  BarChartSwiftUI
//
//  Created by Sudhanshu on 03/10/19.
//  Copyright © 2019 Sudhanshu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var data: [BarValue] = [
        BarValue(days: ["Su", "M", "T", "W", "T", "F", "S"], values: [0.4, 0.2, 0.7, 0.3, 0.4, 0.2, 0.7]),
        BarValue(days: ["Su", "M", "T", "W", "T", "F", "S"], values: [0.2, 0.7, 0.3, 0.4, 0.2, 0.7, 0.3]),
        BarValue(days: ["Su", "M", "T", "W", "T", "F", "S"], values: [0.3, 0.4, 0.2, 0.7, 0.3, 0.4, 0.2]),
    ]
    
    var body: some View {
        ZStack {
            
            Color("screen_background_color").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Hello World")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("Picker")) {
                    Text("First").tag(0)
                    Text("Second").tag(1)
                    Text("Third").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack (spacing: 16) {
                    BarView(label: data[pickerSelectedItem].days[0], value: data[pickerSelectedItem].values[0])
                    BarView(label: data[pickerSelectedItem].days[1], value: data[pickerSelectedItem].values[1])
                    BarView(label: data[pickerSelectedItem].days[2], value: data[pickerSelectedItem].values[2])
                    BarView(label: data[pickerSelectedItem].days[3], value: data[pickerSelectedItem].values[3])
                    BarView(label: data[pickerSelectedItem].days[4], value: data[pickerSelectedItem].values[4])
                    BarView(label: data[pickerSelectedItem].days[5], value: data[pickerSelectedItem].values[5])
                    BarView(label: data[pickerSelectedItem].days[6], value: data[pickerSelectedItem].values[6])
                }
                .padding(.top, 16)
                .animation(.default)
            }
        }
    }
}

struct BarValue {
    var days: [String]
    var values: [CGFloat]
}

struct BarView: View {
    var label: String
    var value: CGFloat = 0
    let max: CGFloat = 200
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.2082865608, green: 0.6095343818, blue: 0.8853829339, alpha: 1)))
                Capsule().frame(width: 30, height: max * value)
                    .foregroundColor(.white)
            }
            Text(label)
                .font(.system(size: 14))
                .padding(.top, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
