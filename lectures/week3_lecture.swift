//
//  week3_lecture.swift
//  swift_peercoaching
//
//  Created by Yeonsu Seo on 1/23/24.
//

import SwiftUI

struct week3_lecture: View {
    
    @State private var score = 0 //점수
    @State private var showingScore = false //점수 표시
    @State private var showingEnd = false //게임 종료 표시
    @State private var scoreTitle = "" // Correct/Wrong
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Russia",
        "Spain",
        "UK",
        "US"
    ].shuffled() //섞어서 저장
    
    @State private var correctFlag = Int.random(in: 0...2) //0,1,2
    @State private var currentQuestion = 1 //현재 몇번째 질문인지
    
    private let numberOfFlags = 3
    private let numberOfQuestions = 5
    
    struct FlagImage: View {
        var image : String
        var body: some View {
            Image(image)
                .renderingMode(.original)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctFlag {
            scoreTitle = "Correct !"
            score += 1
        }
        else {
            scoreTitle = "Wrong 😅. That is [\(countries[number])]"
        }
        
        showingScore = true
    }
    
    func shuffleFlags() {
        countries.shuffle()
        correctFlag = Int.random(in: 0..<3)
    }
    
    func resetGame() {
        currentQuestion = 1
        score = 0
    }
    
    var body: some View {
        ZStack{
//          Color.green   <-- 단색
            RadialGradient(stops: [.init(color: .gray, location: 0.2),.init(color: .black, location: 1.5)],center: .trailing, startRadius: 5, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea() //위 아래 safeArea 까지 채워주기
            VStack(){
                Text("Guess The Flag")
                    .font(.largeTitle)
//                    .font(.largeTitle.weight(.semibold))
                    .foregroundColor(.yellow)
                    .bold()
                    .padding()
                Text("Tap on the \(countries[correctFlag])")
                    .foregroundColor(.white)
                    .bold()
                Text("👉 Question \(currentQuestion) / \(numberOfQuestions) 👈")
                    .foregroundColor(.black)
                    .padding()
                
                ForEach(0..<numberOfFlags, id: \.self) { number in
                    Button() {
                        flagTapped(number)
                        
                    } label: {
                        FlagImage(image: countries[number])
                            .padding()
                    }
                    
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                if currentQuestion == numberOfQuestions {
                    showingEnd = true
                }
                else {
                    currentQuestion += 1
                    shuffleFlags()
                }
            }
        } message: {
            Text("Score : \(score)")
        }
    }
}

#Preview {
    week3_lecture()
}

// 게임 끝났다는 Text, 게임 다시시작 버튼 구현 필요
