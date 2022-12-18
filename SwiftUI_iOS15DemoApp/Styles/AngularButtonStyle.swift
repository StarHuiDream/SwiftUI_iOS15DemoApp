//
//  AngularButtonStyle.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/18.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
    @Environment(\.controlSize) var controlSize
    
    var extraPadding: CGFloat {
        switch controlSize {
        case .mini:
            return 0
        case .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        @unknown default:
            return 0
        }
    }
    
    var cornerRadius: CGFloat {
        switch controlSize {
        case .mini:
            return 12
        case .small:
            return 12
        case .regular:
            return 16
        case .large:
            return 20
        @unknown default:
            return 12
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical, 4 + extraPadding)
            .padding(.horizontal, 10 + extraPadding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.6)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.softLight)
            )
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .blur(radius: cornerRadius)
            )
    }
}

extension ButtonStyle where Self == AngularButtonStyle {
    static var angular: Self {
        return AngularButtonStyle.init()
//        Ainit()
    }
}
