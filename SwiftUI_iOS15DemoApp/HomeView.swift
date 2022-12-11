//
//  HomeView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeatureItemView()
        }.overlay(
            NavigationBarView(title: "Featured")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
