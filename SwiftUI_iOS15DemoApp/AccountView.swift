//
//  AccountView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/9.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var ispinned = false
    
    var pinTitle: (title: String,imageName: String) {
        ((ispinned ? "unpin" : "pin") , (ispinned ? "pin.slash" : "pin"))
    }
    
    var body: some View {
        NavigationView {
            List {
                profile
                settings
                websites
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle(
                Text("Account")
            )
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    var profile : some View {
        VStack (alignment: .center, spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    Image(systemName: "hexagon")
                        .foregroundColor(.blue)
                        .symbolVariant(.fill)
                        .font(.system(size: 200))
                        .offset(x: -50, y: -100)
                )
            Text("StarHui")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("China")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var settings : some View {
        Section {
            NavigationLink { ContentView() } label: {
                Label("Setting", systemImage: "gear")
            }
            NavigationLink { Label("Billing", systemImage: "creditcard") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            Label("Help", systemImage: "questionmark")
        }.listRowSeparator(.hidden)
            .accentColor(.primary)
    }
    
    var websites : some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://www.starhui.cn")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }.swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }.tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://apple.com")!) {
                HStack {
                    Label("TEST", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
        }
        .accentColor(.primary)
    }
    
    var pinButton: some View {
        Button(action: { ispinned.toggle() }) {
            Label(pinTitle.title, systemImage: pinTitle.imageName)
        }.tint(.yellow)
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
