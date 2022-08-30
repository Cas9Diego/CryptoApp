//
//  CoinViewModel.swift
//  CryptoApp
//
//  Created by Diego Castro on 29/08/22.
//

import Foundation

struct CoinViewModel: Codable, Hashable {
    
    let coin: Coin
    
    var name: String {
        return coin.name
    }
    
    var price: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        guard let price = Double(coin.price), let formattedPrice = numberFormatter.string(from: NSNumber(value: price)) else { return "" }
        return formattedPrice
    }
    
    init (_ coin: Coin) {
        self.coin = coin
    }
    
}
