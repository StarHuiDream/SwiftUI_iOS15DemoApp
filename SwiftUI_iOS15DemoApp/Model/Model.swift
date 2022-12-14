//
//  Model.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/15.
//

import Foundation
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
