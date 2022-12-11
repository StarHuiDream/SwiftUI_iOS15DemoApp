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
