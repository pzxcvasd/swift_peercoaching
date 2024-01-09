// 1주차 과제 코드

import SwiftUI

struct week1: View {
    @State var price = ""
    @State var selected = "4 people"
    var people = ["4 people", "5 people", "6 people", "7 people"]
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Enter the price", text:$price)
                    Picker("Number of people", selection: $selected) {
                        ForEach(people,id: \.self) {
                            Text($0)
                        }
                    }
                }
            }.navigationTitle("WeSplit")
        }
    }
}

#Preview {
    week1()
}
