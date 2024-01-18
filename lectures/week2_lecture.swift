//
//  week2_lecture.swift
//  swift_peercoaching
//
//  Created by Yeonsu Seo on 1/16/24.
//

import SwiftUI

struct week2_lecture: View {
    @State var checkAmount = 0.0 //전체 값
    @State var nofppl = 0 // n분의 1 할 사람 수
    @State var tip = 0 // 낼 팁 퍼센티지
    
    var totalAmount : Double {
        let tipValue = checkAmount * Double(tips[tip])/100 //팁 퍼센티지를 통해 값 계산
        
        return checkAmount + tipValue //낼 돈 (팁 + 값)
        
    }
    
    var totalPerPerson : Double {
        return totalAmount/Double(nofppl+2)
    }
    
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
                } header : {
                    Text("지불 정보 입력")
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
                    Text("팁 얼마?")
                }
                Section {
                    Text(totalAmount,format:.currency(code: "KRW")).foregroundColor(tips[tip] == 0 ? .blue : .black)
                } header: {
                    Text("전체 지불 값")
                }
                
                Section {
                    Text(totalPerPerson,format:.currency(code: "KRW"))
                } header: {
                    Text("실제 1인당 지불 값")
                }
                Section {
                    Text("팁 퍼센트 확인용 : \(tip)")
                }
                
            }.navigationTitle("We Split")
        }
    }
}

#Preview {
    week2_lecture()
}
