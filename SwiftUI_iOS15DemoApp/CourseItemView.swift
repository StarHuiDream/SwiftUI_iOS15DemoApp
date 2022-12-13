//
//  CourseItemView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/13.
//

import SwiftUI

struct CourseItemView: View {
    
    var matchedViewNameSpace: Namespace.ID
    
    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading, spacing: 8) {
                Text("Hello, StarHui!")
                    .font(.largeTitle.bold())
                    .matchedGeometryEffect(id: MyConstant.titleID, in: matchedViewNameSpace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("你好呀！")
                    .font(.subheadline)
                    .matchedGeometryEffect(id: MyConstant.subTitleID, in: matchedViewNameSpace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                    .font(.body)
                    .matchedGeometryEffect(id: MyConstant.textID, in: matchedViewNameSpace)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.white)
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: MyConstant.blurID, in: matchedViewNameSpace)
            )
        }
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
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: MyConstant.maskID, in: matchedViewNameSpace)
        )
        .frame(height: 300)
        .padding(20)
    }
}

struct CourseItemView_Previews: PreviewProvider {
    @Namespace static var matchedViewNameSpace
    static var previews: some View {
       CourseItemView(matchedViewNameSpace: matchedViewNameSpace)
    }
}
