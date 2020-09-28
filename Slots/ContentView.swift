//
//  ContentView.swift
//  Slots
//
//  Created by Kira Toal on 9/27/20.
//

import SwiftUI

struct ContentView: View {
    
    public var primaryColor = Color(red: 38/255, green: 190/255, blue: 255/255)
    public var secondaryColor = Color(red: 38/255, green: 255/255, blue: 186/255)
    
    
    
    // Stats let us automatically update the UI
    @State private var credits = 1000
    
    
    var body: some View {
        // ZStacks overlay children and align them in both axes.
        ZStack {
            // Background
            Rectangle()
                .foregroundColor(primaryColor)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Rectangle()
                .foregroundColor(secondaryColor)
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            // VStacks arrange child views in a vertical line.
            VStack {
                Spacer()
                
                // Title
                // HStacks arrange child views in a horizontal line.
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                    Text("SwiftUI Slots")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }.scaleEffect(2)
                
                Spacer()
                
                // Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Cards
                HStack {
                    Spacer()
                    Image("star")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image("star")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image("star")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                }
                
                Spacer()
                
                // Button
                Button(action: {
                    self.credits += 1
                }) {
                    Text("Spin")
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11 Pro")
        }
    }
}
