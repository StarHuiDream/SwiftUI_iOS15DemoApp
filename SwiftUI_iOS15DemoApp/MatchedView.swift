//
//  MatchedView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/12.
//

import SwiftUI

struct MatchedView: View {
    
    @Namespace var matchedViewNameSpace
    @State var isShowed = true
    
    let titleID = "titleID"
    let subTitleID = "subTitleID"
    let textID = "textID"
    let backgroundID = "backgroundID"
    let maskID = "maskID"
    let blurID = "blurID"
    let imageID = "imageID"
    
    var body: some View {
        ZStack {
            if !isShowed {
                VStack {
                    Spacer()
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Hello, StarHui!")
                            .font(.largeTitle.bold())
                            .matchedGeometryEffect(id: titleID, in: matchedViewNameSpace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("你好呀！")
                            .font(.subheadline)
                            .matchedGeometryEffect(id: subTitleID, in: matchedViewNameSpace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                            .font(.body)
                            .matchedGeometryEffect(id: textID, in: matchedViewNameSpace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: blurID, in: matchedViewNameSpace)
                    )
                }
                .background(
                    Image("Illustration 9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: imageID, in: matchedViewNameSpace)
                )
                .background(
                    Image("Background 5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: backgroundID, in: matchedViewNameSpace)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: maskID, in: matchedViewNameSpace)
                )
                .frame(height: 300)
                .padding(20)
            } else {
                
                ScrollView {
                    VStack{
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .foregroundColor(.black)
                    .background(
                        Image("Illustration 9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: imageID, in: matchedViewNameSpace)
                    )
                    .background(
                        Image("Background 5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: backgroundID, in: matchedViewNameSpace)
                    )
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: maskID, in: matchedViewNameSpace)
                    }
                    .overlay(
                        VStack(alignment: .trailing, spacing: 8) {
                            Spacer()
                            Text("Hello, StarHui!")
                                .font(.largeTitle.bold())
                                .matchedGeometryEffect(id: titleID, in: matchedViewNameSpace)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("你好呀！")
                                .font(.subheadline)
                                .matchedGeometryEffect(id: subTitleID, in: matchedViewNameSpace)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                                .font(.body)
                                .matchedGeometryEffect(id: textID, in: matchedViewNameSpace)
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
                                    .matchedGeometryEffect(id: blurID, in: matchedViewNameSpace)
                            )
                            .offset(y: 200)
                    )
                }
            }
        }.onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.25)) {
                isShowed.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
