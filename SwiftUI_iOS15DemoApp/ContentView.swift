//
//  ContentView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/9.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTabBar") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack (alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notifications:
                HomeView()
            case .library:
                AccountView()
            }
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
        }.safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 34)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }.environmentObject(Model())
    }
}
