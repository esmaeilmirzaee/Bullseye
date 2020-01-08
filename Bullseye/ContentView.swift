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
  @State var knock_is_visible: Bool = false
  
  var body: some View {
    VStack {
      Text("Welcome to my first app.")
        .fontWeight(.heavy)
        .foregroundColor(Color.red)
      HStack {
        Button(action: {
          self.alertIsVisible = true
        }) {
          Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
        }
        .alert(isPresented: $alertIsVisible) { () ->
          Alert in
          return Alert(title: Text("Hello Message"), message: (Text("This is my first pop-up")), dismissButton: .default(Text("Awesome!")))
        }
        Button(action: {
          self.knock_is_visible = true
        }) {
          Text("Knock Knock!")
            .fontWeight(.black)
        }
        .alert(isPresented: $knock_is_visible) { () ->
          Alert in
          return Alert(title: Text("Who's there?"), message: (Text("Little old lady.")), dismissButton: .default(Text("Little old lady who?")))
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
