//
//  CourseView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/13.
//

import SwiftUI

struct CourseView: View {
    
    var matchedViewNameSpace: Namespace.ID
    var course: Course = courses[0]
    @Binding var isShowed: Bool
    @State var appear = [false, false, false]
    @State var dragGestureTranslation: CGSize = .zero
    @State var isDraggable = true
    @EnvironmentObject var model: Model
    
    var translationWidth: CGFloat {
        return dragGestureTranslation.width
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .background(
                Color("Background")
            )
            .mask(
                RoundedRectangle(cornerRadius: translationWidth / 3, style: .continuous)
            )
            .scaleEffect(translationWidth / -500 + 1)
            .background(
                .black.opacity(translationWidth / 500)
            )
            .background(.ultraThinMaterial)
            .gesture(isDraggable ? drag : nil)
            button
        }
        .onAppear {
            fadeIn()
        }
        .onChange(of: isShowed) { newValue in
            fadeOut()
        }
        .background(
            Color("Background")
        )
        .ignoresSafeArea()
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let yOffset = proxy.frame(in: .named("scroll")).minY
            VStack{
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: yOffset > 0 ? 500 + yOffset : 500)
            .foregroundColor(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(MyConstant.imageID)\(course.id)", in: matchedViewNameSpace)
                    .offset(y: yOffset > 0 ? yOffset * -0.8 : 0)
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "\(MyConstant.backgroundID)\(course.id)", in: matchedViewNameSpace)
                    .offset(y: yOffset > 0 ? -yOffset : 0)
                    .scaleEffect(yOffset > 0 ? yOffset / 1000 + 1 : 1)
                    .blur(radius: yOffset > 0 ? yOffset / 10 : 0)
            )
            .mask {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "\(MyConstant.maskID)\(course.id)", in: matchedViewNameSpace)
                    .offset(y: yOffset > 0 ? -yOffset : 0)
            }
            .overlay(
                overLayContent
            )
        }
        .frame(height: 500)
    }
    
    var button: some View {
        Button {
            withAnimation(.openCard) {
                isShowed.toggle()
                model.showDetail.toggle()
            }
        } label:{
            Image(systemName: "xmark")
                .padding(8)
                .font(.body.bold())
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(width: 30, height: 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                .font(.title3).fontWeight(.medium)
            Text("This course")
                .font(.title).bold()
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
            Text("Multiplatform app")
                .font(.title).bold()
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
        }
        .padding(20)
        .background(
            Color("Background")
        )
    }
    
    var overLayContent: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Spacer()
            Text(course.title)
                .font(.largeTitle.bold())
                .matchedGeometryEffect(id: "\(MyConstant.titleID)\(course.id)", in: matchedViewNameSpace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(course.subtitle)
                .font(.subheadline)
                .matchedGeometryEffect(id: "\(MyConstant.subTitleID)\(course.id)", in: matchedViewNameSpace)
                .frame(maxWidth: .infinity, alignment: .trailing)
            Text(course.text)
                .font(.body)
                .matchedGeometryEffect(id: "\(MyConstant.textID)\(course.id)", in: matchedViewNameSpace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            HStack  {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("Test by StarHui")
                    .font(.footnote)
            }
            //                            .padding(.horizontal, 20)
        }
        .frame(height: 200)
        
        .padding()
        //                            .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .matchedGeometryEffect(id: MyConstant.blurID, in: matchedViewNameSpace)
        )
        .padding(.horizontal, 20)
        .offset(y: 200)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else {
                    return
                }
                
                guard value.startLocation.x < 100 else {
                    return
                }
                self.dragGestureTranslation = value.translation
                
                if translationWidth > 120 {
                    close()
                }
            }.onEnded{ value in
                if translationWidth > 80 {
                    close()
                } else {
                    self.dragGestureTranslation = .zero
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close() {
        withAnimation(.closeCard.delay(0.4)) {
            isShowed.toggle()
            model.showDetail.toggle()
        }
        
//        withAnimation(.closeCard) {
//            self.dragGestureTranslation = .zero
//        }
        
        isDraggable = false
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var matchedViewNameSpace
    static var previews: some View {
        CourseView(matchedViewNameSpace: matchedViewNameSpace, isShowed: .constant(true))
    }
}
