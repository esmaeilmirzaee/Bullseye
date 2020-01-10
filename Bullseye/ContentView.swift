//
//  ContentView.swift
//  Bullseye
//
//  Created by Esmaeil MIRZAEE on 05/01/2020.
//  Copyright © 2020 Esmaeil MIRZAEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var hitme_is_visible = false
  @State var start_over_is_visible = false
  @State var info_is_visible = false
  @State var slider_value = 50.0
  @State var target = Int.random(in: 1...100)
  @State var score = 0
  @State var number_of_rounds = 1
  
  struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
        .foregroundColor(Color.white)
        .font(Font.custom("Arial Rounded MT Bold", size: 18))
    }
  }
  
  struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
        .font(Font.custom("Avenir-MediumOblique ", size: 24))
        .foregroundColor(Color.yellow)
        .font(.body)
    }
  }
  
  var body: some View {
    VStack {
      Spacer()
      HStack {
        Text("Put the bullseye as close as you can to.").modifier(LabelStyle())
          .font(.headline)
        Text("\(target)").modifier(ValueStyle())
          .font(.subheadline)
      }
      Spacer()
      // Slider row
      HStack {
        Text("1").modifier(LabelStyle())
          .font(.body)
        Slider(value: self.$slider_value, in: 1...100)
        Text("100").modifier(LabelStyle())
          .font(.body)
      }
      
      HStack {
        // MARK - hitme button
        Button(action: {
          self.hitme_is_visible = true
        }) {
          Text("Hit me!").modifier(LabelStyle())
        }
        .alert(isPresented: $hitme_is_visible) { () ->
          Alert in
          return Alert(title: Text(alertTitle()), message: Text(
            "The slider's value is \(self.slider_value.rounded()).\n" +
            "You scored \(pointsForCurrentRound()) point(s) this round."
            ), dismissButton: .default(Text("Try Again!")) {
              self.score += self.pointsForCurrentRound()
              self.target = Int.random(in: 1..<101)
              self.number_of_rounds += 1
            })
        }
        .background(Image("button"))
      }
      
      Spacer()
      HStack {
        // MARK StartOverButton
        Button(action: {
          self.start_over_is_visible = true
        }) {
          HStack {
            Image("StartOverIcon")
            Text("Start Over").modifier(LabelStyle())
          }
        }
        .alert(isPresented: $start_over_is_visible) { () ->
          Alert in
          return Alert(title: Text("New Game"), message: (Text("Have fun!")), dismissButton: .default(Text("❤️")) {
            self.score = 0
            self.number_of_rounds = 0
            })
        }
        
        Spacer()
        Text("Score:").modifier(LabelStyle())
          .font(.body)
        Text("\(score)").modifier(ValueStyle())
          .font(.body)
        Spacer()
        Text("Round:").modifier(LabelStyle())
          .font(.body)
        Text("\(number_of_rounds)").modifier(ValueStyle())
        Spacer()
        
        // Mark InfoButton
        Button(action: {
          self.info_is_visible = true
        }) {
          HStack {
            Image("InfoIcon")
            Text("Info")
          }
        }
        .alert(isPresented: $info_is_visible) { () ->
          Alert in
          return Alert(title: Text("Bullseye"), message: Text("A simple game app."), dismissButton: .default(Text("Have fun🤓")))
        }
      }
      .padding([.leading, .bottom, .trailing], 20)
    }
    .background(Image("Background"), alignment: .center)
  }
  
  func amountOff() -> Int {
    abs(target - Int(slider_value.rounded()))
  }
  
  func pointsForCurrentRound() -> Int {
    let maximum_score = 100
    let bonus: Int
    if 0 == amountOff() {
      bonus = 100
    } else if 1 == amountOff() {
      bonus = 50
    } else {
      bonus = 0
    }
    return maximum_score - amountOff() + bonus
  }
  
  func alertTitle() -> String {
    let difference = amountOff()
    let title: String
    switch difference {
      case 0:
        title = "Perfect"
      case 1...5:
        title = "You almost had it!"
      case 6...10:
        title = "Not bad."
      default:
        title = "Are you even trying?"
    }
    return title
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
