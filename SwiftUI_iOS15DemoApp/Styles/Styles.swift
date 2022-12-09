//
//  Styles.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/9.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    var isDarkScheme: Bool { colorScheme == .dark }
    var blackColor: Color { .black.opacity(isDarkScheme ? 0.6 : 0.3) }
    var whiteColor: Color { .white.opacity(isDarkScheme ? 0.3 : 0.1) }
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius,style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [blackColor, whiteColor],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
            //                .stroke(Color.primary, style: .init(lineWidth: 5, lineCap: .square, lineJoin: .round, miterLimit: .infinity, dash: [10, 11], dashPhase: 1))
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
