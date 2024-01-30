//
//  TodoItem.swift
//  swift_peercoaching
//
//  Created by Yeonsu Seo on 1/30/24.
//

// Model

import Foundation

struct TodoItem: Identifiable {
    
    var id=UUID() // Identifiable 프로토콜에 필수요소. 투두리스트의 각 항목들의 이름이 같아도 서로 구분해주기 위함.
    var title: String
    var isCompleted : Bool = false
}
