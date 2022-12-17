//
//  Suggestion.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/17.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]

