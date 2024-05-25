//
//  ContentView.swift
//  StackTest
//
//  Created by RGMCode on 25.05.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isTapped = false
    
    func randomColor() -> Color {
        let colors: [Color] = [.red, .green, .yellow, .purple, .orange, .gray, .black, .white]
        return colors.randomElement() ?? .black
    }
    
    func randomIcon() -> String {
            let icons: [String] = ["leaf.fill", "globe", "camera", "hand.thumbsup.circle.fill", "applelogo", "newspaper.circle", "visionpro.circle.fill", "airpodsmax"]
            return icons.randomElement() ?? "leaf.fill"
        }
    
    var body: some View {
        
        VStack {
            ScrollView {
                Text("Random Symbols and Colors")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                ForEach(0..<5) { index in
                    VStack {
                        HStack {
                            ForEach(0..<3) { index in
                                Image(systemName: randomIcon())
                                    .font(.system(size: 90))
                                    .foregroundColor(randomColor())
                            }
                        }
                    }.padding()
                }
            } //Scroll
        }.containerRelativeFrame([.horizontal, .vertical])
         .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
    }
    
}

#Preview {
    ContentView()
}
