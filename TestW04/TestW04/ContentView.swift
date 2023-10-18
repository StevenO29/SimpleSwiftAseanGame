//
//  ContentView.swift
//  TestW04
//
//  Created by Christian on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    @State private var angkaRandom = Int.random(in: 0..<9)
    @State private var savePoints: [Int] = []
    @State private var points = 0
    @State private var chances = 10
    @State private var isGameOver = false
    
    func randomIndex() {
        while true {
            let pilihanRandom = Int.random(in: 0..<asean.count)
            if !savePoints.contains(pilihanRandom) {
                angkaRandom = pilihanRandom
                return
            }
        }
    }
    
    func checkAnswer(_ selectedCountryIndex: Int) {
        if selectedCountryIndex == angkaRandom {
            points += 1
            savePoints.append(angkaRandom)
        }
        chances -= 1
        if chances == 0 {
            isGameOver = true
        } else {
            randomIndex()
        }
    }
    
    func resetGame() {
        points = 0
        chances = 10
        angkaRandom = Int.random(in: 0..<9)
        isGameOver = false
    }
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[angkaRandom])
                    .foregroundStyle(.black)
                Text("\n\nPoints: \(points)")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        checkAnswer(number)
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                        checkAnswer(number)
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                }
            }
            Spacer()
        }
        
        if isGameOver {
            Text("Game Over")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.red)
            Text("Total Points: \(points)")
                .font(.title)
                .foregroundColor(.black)
            Button(action: {
                resetGame()
            }) {
                Text("Play Again")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ContentView()
}
