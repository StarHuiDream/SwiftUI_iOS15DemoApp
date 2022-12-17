//
//  Animations.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/14.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.6, dampingFraction: 0.8)
    static let closeCard = Animation.spring(response: 0.7, dampingFraction: 0.9)
}
