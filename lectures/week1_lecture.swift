//
//  ContentView.swift
//  swift_basic
//
//  Created by Yeonsu Seo on 1/9/24.
//

// 1주차 수업 코드

import SwiftUI

struct week1_lecture: View {
    
    @State var tapCount = 0
    var names = ["Games", "Movies", "Books"]
    @State var selectedName = "Games"
    @State var userName = ""
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    Button("Tap Count : \(tapCount)") {
                        tapCount += 1
                    }
                    Button("Reset") {
                        tapCount = 0
                    }
                }
                Section {
                    TextField("Type your name",text:$userName)
                    Text("Hello, Your name is \(userName)")
                }
                Section {
                    Picker("Selected your favorite",selection: $selectedName) {
                        ForEach(names, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    Text("Hello")
                }
            }.navigationTitle("Navigation Title")
        }
    }
}

#Preview {
    week1_lecture()
}
