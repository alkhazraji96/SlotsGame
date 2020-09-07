//
//  ContentView.swift
//  Slots
//
//  Created by Ameer Alkhazraji on 3/28/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var credits = 1000
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    
    private var betAmount = 5
    
    var body: some View {
        
        ZStack {
            Rectangle().foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle().foregroundColor(Color(red: 228/225, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                Text("Credits: " + String(credits))
                    .foregroundColor(.black).padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                Spacer()
                
                
                VStack {
                    HStack {
                        Spacer()
                        
                        CardsView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        
                        CardsView(symbol: $symbols[numbers[1]], background: $backgrounds[1])

                        CardsView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        CardsView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        
                        CardsView(symbol: $symbols[numbers[4]], background: $backgrounds[4])

                        CardsView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        CardsView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        
                        CardsView(symbol: $symbols[numbers[7]], background: $backgrounds[7])

                        CardsView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack (spacing: 20) {
                    VStack {
                        
                        Button(action: {
                            
                            self.processResults()
                            
                        }) {
                            Text("Spin")
                            .bold()
                                .foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 30).background(Color.pink).cornerRadius(20)
                        }
                        
                        Text("\(betAmount) Credits").padding(.top, 10).font(.footnote)
                        
                    }
                    VStack {
                        
                        Button(action: {
                            
                            self.processResults(true)
                            
                        }) {
                            Text("Max Spin")
                            .bold()
                                .foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 30).background(Color.pink).cornerRadius(20)
                        }
                        
                        Text("\(betAmount * 5) Credits").padding(.top, 10).font(.footnote)
                        
                    }
                }
                
                
                
                
                Spacer()
            }
        }
    }
    
    func processResults( _ isMax:Bool = false) {
        
        self.backgrounds = self.backgrounds.map({ _ in
            Color.white
        })
        
        if isMax {
            self.numbers = self.numbers.map({ _ in
            Int.random(in: 0..<self.symbols.count)
                })
        }
        else {
            self.numbers[3] = Int.random(in: 0..<self.symbols.count)
            
            self.numbers[4] = Int.random(in: 0..<self.symbols.count)
            
            self.numbers[5] = Int.random(in: 0..<self.symbols.count)
        }
        processWin(isMax)
    }
    
    func processWin( _ isMax:Bool = false) {
        
        var matches = 0
        
        
        if !isMax {
            
            if isMatch(3, 4, 5) {
                matches += 1
            }
            
        }
        
        
        else {
            
            if isMatch(0, 1, 2) {
                matches += 1
            }
            
            
            if isMatch(3, 4, 5) {
                matches += 1
            }
            
            if isMatch(6, 7, 8) {
                matches += 1
            }
            
            if isMatch(0, 4, 8) {
                matches += 1
            }
            
            if isMatch(2, 4, 6) {
                matches += 1
            }
            
        }
        
        if matches > 0 {
            self.credits += matches * betAmount * 5
        }
        else if !isMax {
            self.credits -= betAmount
        }
        else {
            self.credits -= betAmount * 5
        }
        
    }
    
    func isMatch(_ index1:Int,_ index2:Int,_ index3:Int) -> Bool {
        if self.numbers[index1] == self.numbers[index2] && self.numbers[index2] == self.numbers[index3] {
            
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
            return true
        }
        return false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
