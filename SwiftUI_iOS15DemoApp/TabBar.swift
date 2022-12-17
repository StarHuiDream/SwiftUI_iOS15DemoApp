//
//  TabBar.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTabBar") var selectedTab: Tab = .home
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom > 20
            HStack {
                buttons
            }
            .padding(.top, 14)
            .frame(height: hasHomeIndicator ? 88 : 62 , alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: hasHomeIndicator ? 34 : 0, style: .continuous))
            .background(
                background
            ).overlay(
                overlay
            )
                .strokeStyle(cornerRadius: hasHomeIndicator ? 34 : 0)
                .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
    
    var buttons: some View {
        ForEach(items) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = item.tab
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 40, height: 29)
                    Text(item.text).font(.caption2)
                }
                .frame(maxWidth: .infinity)
            }.foregroundColor( selectedTab == item.tab ? .primary : .secondary )
                .overlay(
                    GeometryReader { proxy in
                        Color.clear.preference(key:TabPreferenceKey.self , value: proxy.size.width )
                    }
                ).onPreferenceChange(TabPreferenceKey.self) { value in
                    tabItemWidth = value
                }
        }
    }
    
    var background: some View {
        HStack{
            if selectedTab == .library { Spacer() }
            if selectedTab == .explore { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Circle().fill(Color.teal).frame(width: tabItemWidth)
            if selectedTab == .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer() }
        }
    }
    
    var overlay: some View {
        HStack{
            if selectedTab == .library { Spacer() }
            if selectedTab == .explore { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(.teal)
                .frame(width: 44, height: 5, alignment: .top)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer() }
        }
        .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
