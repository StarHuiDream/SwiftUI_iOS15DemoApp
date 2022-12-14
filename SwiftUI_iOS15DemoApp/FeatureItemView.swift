//
//  FeatureItemView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct FeatureItemView: View {
    var course: Course = featuredCourses[0]
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Image(course.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(/*@START_MENU_TOKEN@*/13.0/*@END_MENU_TOKEN@*/)
                .strokeStyle(cornerRadius: 20)
            Text(course.title)
                .font(.title)
                .foregroundStyle(.linearGradient(colors: [Color.primary, Color.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text(course.subtitle)
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            Text(course.text)
                .font(.footnote)
                .fontWeight(.medium)
                .lineLimit(2)
//                .frame(width: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .frame(height: 350.0)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .circular))
//        .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
//        .shadow(color: Color("Shadow").opacity(0.8), radius: 10, x: 10, y: 0)
//        .modifier(StrokeStyle())
        .strokeStyle()
        .padding(.horizontal, 20)
    }
}

struct FeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItemView()
    }
}
