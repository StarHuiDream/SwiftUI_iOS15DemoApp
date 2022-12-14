//
//  CourseItemView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/13.
//

import SwiftUI

struct CourseItemView: View {
    
    var matchedViewNameSpace: Namespace.ID
    var course: Course = courses[0]
    
    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading, spacing: 8) {
                Text(course.title)
                    .font(.largeTitle.bold())
                    .matchedGeometryEffect(id: "\(MyConstant.titleID)\(course.id)", in: matchedViewNameSpace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(course.subtitle)
                    .font(.subheadline)
                    .matchedGeometryEffect(id: "\(MyConstant.subTitleID)\(course.id)", in: matchedViewNameSpace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(course.text)
                    .font(.body)
                    .matchedGeometryEffect(id: "\(MyConstant.textID)\(course.id)", in: matchedViewNameSpace)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.white)
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "\(MyConstant.blurID)\(course.id)", in: matchedViewNameSpace)
            )
        }
        .background(
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "\(MyConstant.imageID)\(course.id)", in: matchedViewNameSpace)
        )
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "\(MyConstant.backgroundID)\(course.id)", in: matchedViewNameSpace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "\(MyConstant.maskID)\(course.id)", in: matchedViewNameSpace)
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
