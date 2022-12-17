//
//  HomeView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct HomeView: View {
    
    let coordinateSpaceName = "homeScroll"
    @Namespace var namespace
    @EnvironmentObject var model: Model
    @State var selectedCourse: Course = courses[0]
    @State var isScrolled = false
    @State var isShowed = false
    @State var isHideStatusBar = false
    @State var showCourse = false
    @State var showedCourse: Course = featuredCourses[0]
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                GeometryReader { proxy in
                    Color.clear.preference(key: ScrollViewKey.self, value: proxy.frame(in: .named(coordinateSpaceName)).minY)
                }
                .onPreferenceChange(ScrollViewKey.self, perform: { value in
                    withAnimation {
                        isScrolled = !(value < 0)
                    }
                })
                .frame(height: 0)
                tabView
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    cards
                }
            }
            .coordinateSpace(name: coordinateSpaceName)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBarView(title: "Featured", isScrolled: $isScrolled)
            )
            
            if isShowed {
                CourseView(matchedViewNameSpace: namespace, course: selectedCourse, isShowed: $isShowed)
                    .zIndex(1)
            }
        }
        .background(
            Color("Background")
        )
        .statusBar(hidden: isHideStatusBar)
        .onChange(of: isShowed) { newValue in
            withAnimation(.closeCard) {
                isHideStatusBar = newValue
                
            }
        }
    }
    
    var tabView: some View {
        TabView{
            ForEach(featuredCourses) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    VStack{
                        FeatureItemView(course: item)
                            .frame(maxWidth: 500)
                            .frame(maxWidth: .infinity)
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
                            .onTapGesture {
                                showedCourse = item
                                showCourse = true
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x: 250, y: -100))
        .sheet(isPresented: $showCourse) {
            CourseView(matchedViewNameSpace: namespace, course: showedCourse, isShowed: $showCourse)
        }
    }
    
    var cards: some View {
        ForEach(courses) { course in
            if !isShowed {
                CourseItemView(matchedViewNameSpace: namespace ,course: course)
                    .onTapGesture {
                        withAnimation(.openCard) {
                            isShowed.toggle()
                            model.showDetail.toggle()
                            self.selectedCourse = course
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.white)
                    .frame(height: 300)
                    .cornerRadius(30)
                    .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                    .opacity(0.3)
                    .padding(.horizontal, 30)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
