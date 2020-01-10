//
//  AboutView.swift
//  Bullseye
//
//  Created by Esmaeil MIRZAEE on 10/01/2020.
//  Copyright © 2020 Esmaeil MIRZAEE. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  
  struct HeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
        .font(Font.custom("Avenir-Heavy", size: 30))
        .foregroundColor(Color.black)
    }
  }
  
  struct BodyStyle: ViewModifier {
    func body(content: Content) -> some View {
      return content
        .foregroundColor(Color.black)
        .font(Font.custom("Avenir-Heavy", size: 18))
        .font(.body)
        .padding([.leading, .trailing], 60)
        .padding(.bottom, 20)
    }
  }
  
  var body: some View {
    VStack {
      Text("🎯 Bullseye 🎯").modifier(HeadingStyle()).padding([.top, .bottom], 20)
      Text("This is Bullseye, the game where you can win points and earn frame by dragging a slider.").modifier(BodyStyle()).lineLimit(nil)
      Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(BodyStyle()).lineLimit(nil)
      Text("Enjoy!").modifier(HeadingStyle())
    }
    .background(Color.init(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0))
    .navigationBarTitle("About Bullseye!")
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
