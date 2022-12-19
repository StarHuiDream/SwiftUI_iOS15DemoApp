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
    @State var address: Address = Address(id: 1, country: "China")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @ObservedObject var coinModel = CoinMode()
    
    var pinTitle: (title: String,imageName: String) {
        ((ispinned ? "unpin" : "pin") , (ispinned ? "pin.slash" : "pin"))
    }
    
    var body: some View {
        NavigationView {
            List {
                profile
                settings
                lite
                websites
                coins
                signOutButton
            }
            .task {
                await fetchCountryData()
                await coinModel.fetchCoin()
            }
            .refreshable {
                await fetchCountryData()
                await coinModel.fetchCoin()
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle(
                Text("Account")
            )
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems( trailing: Button {
                dismiss()
            } label: {
                Text("Done").bold()
            })
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
                ).background(
                    BlobView().offset(x: 100, y: -100)
                )
            Text("StarHui")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text(address.country)
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
    
    var lite: some View {
        Section {
            Toggle(isOn: $isLiteMode) {
                Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
            }
            .accentColor(.primary)
        }
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
    
    var coins: some View {
        Section(header: Text("Coins")) {
            ForEach(coinModel.coins) { coin in
                HStack {
                    AsyncImage(url: URL(string: coin.logo)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32)
                    .padding(2)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(coin.coin_name)
                        Text(coin.acronym)
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
            }
        }
    }
    
    var pinButton: some View {
        Button(action: { ispinned.toggle() }) {
            Label(pinTitle.title, systemImage: pinTitle.imageName)
        }.tint(.yellow)
    }
    
    var signOutButton: some View {
        Button {
            isLogged = false
            dismiss()
        } label: {
            Text("Sign out")
                .tint(.red)
        }
    }
    
    func fetchCountryData() async  {
        do {
            let url = URL(string: "https://random-data-api.com/api/address/random_address")!
            let (data, _) = try await URLSession.shared.data(from: url)
            address =  try JSONDecoder().decode(Address.self, from: data)
        } catch {
            print("Error!!!");
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
