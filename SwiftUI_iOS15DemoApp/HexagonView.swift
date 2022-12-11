//
//  HexagonView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/10.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
            context.draw(Text("StarHui"), at: CGPoint(x: 50, y: 50))
            context.draw(Image(systemName: "hexagon.bottomhalf.filled"), in: CGRect(x: 100, y: 100, width: 200, height: 210))
        }.foregroundStyle(
            .linearGradient(colors: [.yellow.opacity(0.2), .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
