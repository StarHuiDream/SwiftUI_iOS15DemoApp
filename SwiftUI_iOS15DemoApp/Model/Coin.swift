//
//  Coin.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/18.
//

import Foundation

struct Coin: Identifiable, Decodable {
    var id: Int
    var coin_name: String
    var acronym: String
    var logo: String
}

class CoinMode: ObservableObject {
    @Published var coins: [Coin] = []
    
    @MainActor
    func fetchCoin() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=12")!
            let (data, _) = try await URLSession.shared.data(from: url)
            coins = try JSONDecoder().decode([Coin].self, from: data)
        } catch {
            print("Error !!!")
        }
    }
}
