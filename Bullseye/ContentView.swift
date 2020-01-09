//
//  ContentView.swift
//  Bullseye
//
//  Created by Esmaeil MIRZAEE on 05/01/2020.
//  Copyright © 2020 Esmaeil MIRZAEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var alertIsVisible = false
  @State var info_is_visible = false
  @State var slider_value = 50.0
  @State var target = Int.random(in: 1...100)
  @State var score = 0
  @State var round = 0
  
  var body: some View {
    VStack {
      Spacer()
      HStack {
        Text("Put the bullseye as close as you can to.")
        Text("\(target)")
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
          return Alert(title: Text("Hello there!"), message: Text(
            "The slider's value is \(self.slider_value.rounded()).\n" +
            "You scored \(pointsForCurrentRound()) point(s) this round."
            ), dismissButton: .default(Text("Try Again!")) {
              self.score += self.pointsForCurrentRound()
              self.target = Int.random(in: 1..<101)
              self.round += 1
            })
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
          return Alert(title: Text("New Game"), message: (Text("Have fun!")), dismissButton: .default(Text("❤️")) {
            self.score = 0
            self.round = 0
          })
        }
        Spacer()
        Text("Score:")
        Text("\(score)")
        Spacer()
        Text("Round:")
        Text("\(round)")
        Spacer()
        Text("Average:")
        Text("\(self.score / self.round)")
        Spacer()
        Button(action: {
          self.info_is_visible = true
        }) {
          Text("Info")
        }
        .alert(isPresented: $info_is_visible) { () ->
          Alert in
          return Alert(title: Text("Bullseye"), message: Text("A simple game app."), dismissButton: .default(Text("Have fun🤓")))
        }
      }
      .padding([.leading, .trailing, .bottom], 20)
      
    }
  }
  
  func pointsForCurrentRound() -> Int {
    100 - abs(target - Int(slider_value.rounded()))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
