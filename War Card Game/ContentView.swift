//
//  ContentView.swift
//  War Card Game
//
//  Created by jaston on 10/30/23.
//

import SwiftUI

struct ContentView: View {
    
   @State var playerCard = "card5"
   @State var cpuCard = "card3"
   @State var playerScore: Int = 0
   @State var cpuScore: Int = 0
    var body: some View {
        
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack(
                spacing: 50
            ){
                Image("logo")
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })

                HStack{
                    Spacer()
                    VStack{
                        Text("Player").padding(.bottom, 10)
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU").padding(.bottom, 10)
                        Text(String(cpuScore)).font(.largeTitle)
                    }
                    Spacer()
                }
                .font(.headline)
                .foregroundStyle(.white).fontWeight(.semibold)
            }
        }
    }
    
    func deal(){
       // randomize the player  and CPU's number on card
        playerCard = "card" + String(Int.random(in: 2...14))
        cpuCard  = "card" + String(Int.random(in: 2...14))
        
        // update the score sheet
        
        if playerCard > cpuCard{
            playerScore+=1
        }else if playerCard < cpuCard{
            cpuScore+=1
        }else {
            return
        }
    }
}

#Preview {
    ContentView()
}
