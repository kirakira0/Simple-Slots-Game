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
    
    private var symbols = ["apple", "star", "cherry"]
    
    // Stats let us automatically update the UI
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    private var betAmount = 5
    
    
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
                    Image(symbols[numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(symbols[numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(symbols[numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                }
                
                Spacer()
                
                // Button
                Button(action: {
                    // Change the images
                    for i in 0...self.symbols.count - 1 {
                        self.numbers[i] = Int.random(in: 0...self.symbols.count - 1)
                    }
                    // Check earnings
                    // Check if all elements are equal
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        self.credits += self.betAmount * 10
                    } else {
                        self.credits -= self.betAmount
                    }
                    
                    // TODO: BETTER WAY
                    
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
