//
//  ContentView.swift
//  StackTest
//
//  Created by RGMCode on 25.05.24.
//

import SwiftUI

struct ContentView: View {
    
    // Definiere die @State-Variablen für Farben und Symbole
    @State private var colors: [[Color]]
    @State private var icons: [[String]]
    
    // Statische Funktion, um eine zufällige Farbe zu generieren
    static func randomColor() -> Color {
        let colors: [Color] = [.red, .green, .yellow, .purple, .orange, .gray, .black, .white]
        return colors.randomElement() ?? .black
    }
    
    // Statische Funktion, um ein zufälliges Symbol zu generieren
    static func randomIcon() -> String {
        let icons: [String] = ["leaf.fill", "globe", "camera", "hand.thumbsup.circle.fill", "applelogo", "newspaper.circle", "visionpro.circle.fill", "airpodsmax"]
        return icons.randomElement() ?? "leaf.fill"
    }
    
    // Statische Funktion, um eine 2D-Array von zufälligen Farben zu generieren
    static func generateRandomColors() -> [[Color]] {
        var tempColors: [[Color]] = []
        for _ in 0..<5 {
            var colorRow: [Color] = []
            for _ in 0..<3 {
                colorRow.append(randomColor())
            }
            tempColors.append(colorRow)
        }
        return tempColors
    }
    
    // Statische Funktion, um eine 2D-Array von zufälligen Symbolen zu generieren
    static func generateRandomIcons() -> [[String]] {
        var tempIcons: [[String]] = []
        for _ in 0..<5 {
            var iconRow: [String] = []
            for _ in 0..<3 {
                iconRow.append(randomIcon())
            }
            tempIcons.append(iconRow)
        }
        return tempIcons
    }
    
    // Initialisierung der View
    init() {
        // Initialisiere die @State-Variablen mit zufälligen Farben und Symbolen
        _colors = State(initialValue: Self.generateRandomColors())
        _icons = State(initialValue: Self.generateRandomIcons())
    }
    
    // Funktion, um alle Farben und Symbole zufällig zu ändern
    func randomizeAll() {
        colors = Self.generateRandomColors()
        icons = Self.generateRandomIcons()
    }
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Zufällige Symbole und Farben")
                    .font(.title)
                    .bold()
                ForEach(0..<5, id: \.self) { rowIndex in
                    VStack {
                        HStack {
                            ForEach(0..<3, id: \.self) { colIndex in
                                Button(action: {
                                    randomizeAll() // Bei Button-Klick alle Farben und Symbole zufällig ändern
                                }) {
                                    Image(systemName: icons[rowIndex][colIndex])
                                        .font(.system(size: 90))
                                        .foregroundColor(colors[rowIndex][colIndex])
                                }.padding(10)
                            }
                        }
                    }.padding()
                }
            }
        }
        // Hintergrundgradient
        .background(LinearGradient(gradient: Gradient(colors: [.teal, .cyan, .green]), startPoint: .top, endPoint: .bottom).opacity(0.6))
    }
}

#Preview {
    ContentView()
}
