//
//  ContentView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(/*@START_MENU_TOKEN@*/13.0/*@END_MENU_TOKEN@*/)
            Text("Swift UI For iOS 15")
                .font(.title)
                .foregroundStyle(.linearGradient(colors: [Color.primary, Color.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("20 sections - 3 hours.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts, animations and")
                .font(.footnote)
                .fontWeight(.medium)
                .lineLimit(2)
//                .frame(width: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20.0)
        .frame(height: 350.0)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .circular))
//        .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
        .shadow(color: Color("Shadow").opacity(0.8), radius: 10, x: 10, y: 0)
        .overlay(
            RoundedRectangle(cornerRadius: 30,style: .continuous)
                .stroke(
                    .linearGradient(colors: [.black.opacity(0.3), .white.opacity(0.1)], startPoint: .top,
                                        endPoint: .bottom)
                )
                .blendMode(.overlay)
                
//                .stroke(Color.primary, style: .init(lineWidth: 5, lineCap: .square, lineJoin: .round, miterLimit: .infinity, dash: [10, 11], dashPhase: 1))
        )
        .padding(.horizontal, 20)
        .background(Image("Blob 1").offset(x: 250, y: -100))
        .overlay(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
