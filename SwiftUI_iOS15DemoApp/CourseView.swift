//
//  CourseView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/13.
//

import SwiftUI

struct CourseView: View {
    
    var matchedViewNameSpace: Namespace.ID
    @Binding var isShowed: Bool
    
    var body: some View {
        
        ZStack {
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
                        .matchedGeometryEffect(id: MyConstant.imageID, in: matchedViewNameSpace)
                )
                .background(
                    Image("Background 5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: MyConstant.backgroundID, in: matchedViewNameSpace)
                )
                .mask {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: MyConstant.maskID, in: matchedViewNameSpace)
                }
                .overlay(
                    VStack(alignment: .trailing, spacing: 8) {
                        Spacer()
                        Text("Hello, StarHui!")
                            .font(.largeTitle.bold())
                            .matchedGeometryEffect(id: MyConstant.titleID, in: matchedViewNameSpace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("你好呀！")
                            .font(.subheadline)
                            .matchedGeometryEffect(id: MyConstant.subTitleID, in: matchedViewNameSpace)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                            .font(.body)
                            .matchedGeometryEffect(id: MyConstant.textID, in: matchedViewNameSpace)
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
                )
            }.ignoresSafeArea()
            
            
            Button {
                withAnimation(.openCard) {
                    isShowed.toggle()
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
        
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var matchedViewNameSpace
    static var previews: some View {
        CourseView(matchedViewNameSpace: matchedViewNameSpace, isShowed: .constant(true))
    }
}
