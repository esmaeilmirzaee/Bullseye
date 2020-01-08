//
//  ContentView.swift
//  Bullseye
//
//  Created by Esmaeil MIRZAEE on 05/01/2020.
//  Copyright © 2020 Esmaeil MIRZAEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var alertIsVisible: Bool = false
  @State var slider_value: Double = 50.0
  
  var body: some View {
    VStack {
      Spacer()
      HStack {
        Text("Put the bullseye as close as you can to.")
        Text("\(Int.random(in: 1...100))")
      }
      Spacer()
      // Slider row
      HStack {
        Text("1")
        Slider(value: self.$slider_value, in: 1...100)
        Text("100")
      }
      
      HStack {
        Button(action: {
          self.alertIsVisible = true
        }) {
          Text("Hit me!")
        }
        .alert(isPresented: $alertIsVisible) { () ->
          Alert in
          return Alert(title: Text("Hello there!"), message: Text("\(String.init(format: "%.1f", (self.slider_value)))"), dismissButton: .default(Text("Try Again!")))
        }
      }
      
      
      Spacer()
      HStack {
        Button(action: {
          self.alertIsVisible = true
        }) {
          Text("Start Over!")
        }
        .alert(isPresented: $alertIsVisible) { () ->
          Alert in
          return Alert(title: Text("Hello Message"), message: (Text("This is my first pop-up")), dismissButton: .default(Text("Awesome!")))
        }
        Spacer()
        Text("Score:")
        Text("999999")
        Spacer()
        Text("Round:")
        Text("999")
        Spacer()
        Button(action: {
          
        }) {
          Text("Info")
        }
      }
      .padding([.leading, .trailing, .bottom], 20)
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
