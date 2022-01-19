//
//  ContentView.swift
//  test
//
//  Created by Parker Allan on 1/16/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cpuScore = 0
    @State private var userScore = 0
    @State private var cpuHand = "hand2"
    @State private var userHand = "hand2"
    @State private var userVal = 2
    
    func resetGame() {
         //reset scores
         userScore = 0
         cpuScore = 0
     }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image(cpuHand)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(userHand)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    //generate randow hand
                    let cpuRand = Int.random(in: 1...3)
                    //let userRand = Int.random(in: 1...3)
                    
                    //update hand, I only want CPU to be random
                    cpuHand = "hand" + String(cpuRand)
                    //userHand = "hand" + String(userRand)
                    
                    //update score
                    if userVal == cpuRand {
                        userScore += 0
                        cpuScore += 0
                    }
                    else if (cpuRand == 3) && (userVal == 1) {
                        cpuScore += 1
                    }
                    else if (cpuRand == 1) && (userVal == 3) {
                        userScore += 1
                    }
                    else if userVal < cpuRand {
                        userScore += 1
                    }
                    else if userVal > cpuRand {
                        cpuScore += 1
                    }
                }) {
                    Text("Roll")
                        .font(.largeTitle)
                        .padding()
                        .border(Color.blue, width: 5)
                }
                Spacer()
                HStack{
                Spacer()
                //These buttons allow user selection, resets value for each new roll
                Button( action: {
                    userVal = 0
                    userHand = "hand2"
                    userVal = 2
                }) {
                    Text("Rock")
                        .padding()
                        .border(Color.blue, width: 3)
                    }
                Spacer()
                Button( action: {
                    userVal = 0
                    userHand = "hand1"
                    userVal = 1
                }) {
                    Text("Paper")
                        .padding()
                        .border(Color.blue, width: 3)
                    }
                Spacer()
                Button( action: {
                    userVal = 0
                    userHand = "hand3"
                    userVal = 3
                }) {
                    Text("Scissors")
                        .padding()
                        .border(Color.blue, width: 3)
                    }
                Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack {
                        Text("CPU Score")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(String(cpuScore))
                            .padding(.bottom, 50.0)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    VStack {
                        Text("Your Score")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(String(userScore))
                            .padding(.bottom, 50.0)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
            }
            //win screen
            if userScore == 5 {
                VStack {
                    Spacer()
                    Image("bunny1")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                    Spacer()
                    Button(action: {
                        resetGame()
                    }) {
                        Text("You Win :)")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .padding()
                            .border(Color.green, width: 3)
                    }
                }
            }
            //lose screen
            if cpuScore == 5 {
                VStack {
                    Spacer()
                    Image("bunny2")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                    Spacer()
                    Button(action: {
                        resetGame()
                    }) {
                        Text("You Lost :(")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .padding()
                            .border(Color.red, width: 3)
                    }
                }
            }
        }.background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
