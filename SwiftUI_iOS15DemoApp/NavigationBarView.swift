//
//  NavigationBarView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct NavigationBarView: View {
    var title = ""
    var body: some View {
        ZStack{
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            Text(title).font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .frame(width: 36, height: 36)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .cornerRadius(14)
                    .padding(8)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
        }
        .frame(height: 77)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.leading, 20)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "TEST")
    }
}
