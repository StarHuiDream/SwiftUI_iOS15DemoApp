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
    
    @State var isShowed = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            ScrollView {
                GeometryReader { proxy in
                    //                Text("\(proxy.frame(in: .named(coordinateSpaceName)).minY)")
                    Color.clear.preference(key: ScrollViewKey.self, value: proxy.frame(in: .named(coordinateSpaceName)).minY)
                }
                .onPreferenceChange(ScrollViewKey.self, perform: { value in
                    withAnimation {
                        isScrolled = !(value < 0)
                    }
                })
                .frame(height: 0)
                tabView
                
                if !isShowed {
                    CourseItemView(matchedViewNameSpace: namespace)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                isShowed.toggle()
                            }
                        }
                }
                
                //            Color.yellow.frame(height: 1000)
            }
            .coordinateSpace(name: coordinateSpaceName)
            
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBarView(title: "Featured", isScrolled: $isScrolled)
            )
            
            if isShowed {
                CourseView(matchedViewNameSpace: namespace, isShowed: $isShowed)
            }
        }
        .background(
            Color("Background")
        )
    }
    
    var tabView: some View {
        TabView{
            ForEach(courses) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    VStack{
                        //                        Text("\(minX)")
                        FeatureItemView(course: item)
                            .padding(.vertical, 40)
                            .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: Color("Shadow").opacity(0.8), radius: 10, x: 10, y: 0)
                            .modifier(StrokeStyle(cornerRadius: 36))
                            .blur(radius: abs(minX / 40))
                            .overlay(
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 230)
                                    .offset(x: 32, y: -80)
                            )
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x: 250, y: -100))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
