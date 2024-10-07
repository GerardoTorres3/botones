//
//  ContentView.swift
//  botones2
//
//  Created by Geraldine Torres García  on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDifficulty: String? = nil
    @State private var rotateScreen = false
   
    var body: some View {
        VStack {
            Text("Selecciona tu nivel de dificultad")
                .font(.largeTitle)
                .padding()

            HStack {
                difficultyButton("Fácil", icon: "person.fill", color: .green)
                difficultyButton("Normal", icon: "person.2.fill", color: .yellow)
                difficultyButton("Difícil", icon: "person.3.fill", color: .red)
            }
            .rotationEffect(.degrees(rotateScreen ? 180 : 0)) // Rotar pantalla

            if let difficulty = selectedDifficulty {
                Text("Has seleccionado \(difficulty)")
                    .font(.title2)
                    .foregroundColor(.blue)
            }

            Button(action: {
                withAnimation {
                    rotateScreen.toggle()
                }
            }) {
                Text("Rotar pantalla")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
   
    // Función para crear un botón de dificultad
    func difficultyButton(_ title: String, icon: String, color: Color) -> some View {
        Button(action: {
            withAnimation {
                selectedDifficulty = title
            }
        }) {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(title)
                    .font(.headline)
            }
            .padding()
            .background(selectedDifficulty == title ? color.opacity(0.5) : color)
            .cornerRadius(10)
            .scaleEffect(selectedDifficulty == title ? 1.2 : 1) // Escalar botón
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
