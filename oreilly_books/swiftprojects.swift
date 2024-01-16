//
//  ContentView.swift
//  swift_peercoaching
//
//  Created by Yeonsu Seo on 1/14/24.
//

import SwiftUI

struct swiftprojects: View {
    var body: some View {
        Button(action: {print("Button tapped")}) {
            Text("Button Label")
        }
        Button("Button Label") {
            print("Hello")
        }.padding(10).background(Color.red).foregroundColor(.white)
        Circle().fill(Color.red).frame(width: 50)
    }
}

#Preview {
    swiftprojects()
}
