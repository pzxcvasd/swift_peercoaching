//
//  week2_lecture.swift
//  swift_peercoaching
//
//  Created by Yeonsu Seo on 1/16/24.
//

import SwiftUI

struct week2_lecture: View {
    @State var checkAmount = 0.0
    @State var nofppl = 0
    @State var tip = 0
    
    let tips = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount",value: $checkAmount,format: .currency(code: "KRW"))
                    Picker("n of ppl",selection: $nofppl) {
                        ForEach(2..<51) {
                            Text("\($0) ppl")
                        }
                    }
                }
                Section {
                    Picker("Tip percentage", selection:$tip) {
                        ForEach(0..<5) {
                            Text("\(tips[$0]) %")
                        }
                        // ForEach(tips, id=\.self) {
                        // Text("\(tips[$0]) %")
                        // }
                        
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Tip")
                }
                
            }.navigationTitle("We Split")
        }
    }
}

#Preview {
    week2_lecture()
}
