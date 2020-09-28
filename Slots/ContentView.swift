//
//  ContentView.swift
//  Slots
//
//  Created by Kira Toal on 9/27/20.
//

import SwiftUI

var primaryColor = Color(red: 38/255, green: 190/255, blue: 255/255)
var secondaryColor = Color(red: 38/255, green: 255/255, blue: 186/255)


struct ContentView: View {
    var body: some View {
        // ZStack: a view that overlays its children, aligning them in both axes.
        ZStack {
            // Background
            Rectangle()
                .foregroundColor(primaryColor)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Rectangle()
                .foregroundColor(secondaryColor)
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
