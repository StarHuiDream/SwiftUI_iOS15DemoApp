//
//  HomeView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct HomeView: View {
    
    @State var isScrolled = false
    let coordinateSpaceName = "homeScroll"
    
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
//                Text("\(proxy.frame(in: .named(coordinateSpaceName)).minY)")
                Color.clear.preference(key: ScrollViewKey.self, value: proxy.frame(in: .named(coordinateSpaceName)).maxY)
            }
//            .frame(height: 0)
            FeatureItemView()
            Color.yellow.frame(height: 1000)
        }
        .coordinateSpace(name: coordinateSpaceName)
        .onPreferenceChange(ScrollViewKey.self, perform: { value in
            withAnimation {
                isScrolled = value > 0
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBarView(title: "Featured").opacity(isScrolled ? 0 : 1)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
