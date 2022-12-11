//
//  TabBar.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home
    @State var tabItemWidth: CGFloat = 0
    var body: some View {
        ZStack (alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    AccountView()
                case .notifications:
                    ContentView()
                case .library:
                    AccountView()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
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
            .padding(.top, 14)
            .frame(height: 88 , alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
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
            ).overlay(
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
            )
                .strokeStyle(cornerRadius: 34)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
