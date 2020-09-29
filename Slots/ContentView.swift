//
//  ContentView.swift
//  A simple slots game.
//  Created by Kira Toal on 9/27/20.
//
// This code was adapted from a tutorial by CodeWithChris on Youtube.
// The original tutorial can be found here:
// https://www.youtube.com/watch?v=51Z9Kun7tFo&ab_channel=CodeWithChris
//

import SwiftUI

struct ContentView: View {
    
    public var primaryColor = Color(red: 147/255, green: 196/255, blue: 209/255)
    
    public var secondaryColor = Color(red: 62/255, green: 136/255, blue: 165/255)
    
    public var buttonColor = Color(red: 45/255, green: 95/255, blue: 110/255)

    private var symbols = ["apple", "star", "cherry"]
    
    // Stats let us automatically update the UI
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    private var betAmount = 5
    
    func getCardEquivalence(numbers: [Int]) -> Bool {
        for i in 1...numbers.count - 1 {
            if numbers[0] != numbers[i] {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        // ZStacks overlay children and align them in both axes.
        ZStack {
            // Background
            Rectangle()
                .foregroundColor(primaryColor)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            // VStacks arrange child views in a vertical line.
            VStack {
                Spacer()
                
                // Title
                // HStacks arrange child views in a horizontal line.
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(secondaryColor)
                    Text("SwiftUI Slots")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Image(systemName: "heart.fill")
                        .foregroundColor(secondaryColor)
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
                    if getCardEquivalence(numbers: self.numbers) {
                        self.credits += self.betAmount * 10
                    } else {
                        self.credits -= self.betAmount
                    }   
                }) {
                    Text("Spin")
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(buttonColor)
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
