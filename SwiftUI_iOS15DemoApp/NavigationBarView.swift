//
//  NavigationBarView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/11.
//

import SwiftUI

struct NavigationBarView: View {
    var title = ""
    @Binding var isScrolled: Bool
    @State var showSearch = false
    @State var showAccount = false
    @AppStorage("showModal") var showModal = false
    
    var body: some View {
        ZStack{
            Color.clear.opacity(isScrolled ? 0 : 1)
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            Text(title)
                .animatableFont(size: isScrolled ? 34 : 22, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: isScrolled ? 0 : -4)
            HStack{
                Button {
                    showSearch = true
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .frame(width: 36, height: 36)
                        .foregroundColor(.secondary)
                        .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .strokeStyle(cornerRadius: 14)
                }
                .sheet(isPresented: $showSearch) {
                    SearchView()
                }
                
                Button {
//                    showAccount = true
                    withAnimation {
                        showModal = true
                    }
                } label: {
                    AvatarView()
                }
                .sheet(isPresented: $showAccount) {
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: isScrolled ? 0 : -4)
        }
        .frame(height: isScrolled ? 77 : 44)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "TEST", isScrolled: .constant(false))
    }
}
