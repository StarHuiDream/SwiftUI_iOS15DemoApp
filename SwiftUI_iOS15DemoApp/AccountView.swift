//
//  AccountView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/9.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
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
                
                
                Section {
                    Label("Setting", systemImage: "gear")
                        .foregroundStyle(.blue, .yellow)
                    Label("Billing", systemImage: "creditcard")
                    Label("Help", systemImage: "questionmark")
                }.listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle(
                Text("Account")
            )
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
