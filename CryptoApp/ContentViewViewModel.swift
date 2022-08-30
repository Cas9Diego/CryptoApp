//
//  ContentViewViewModel.swift
//  CryptoApp
//
//  Created by Diego Castro on 29/08/22.
//

import Foundation
import Combine

class ContentViewViewModel: ObservableObject {
    
    private let cryptoService = CryptoService()
    
    @Published var coinViewModels = [CoinViewModel]()
    
    var cancellable: AnyCancellable?
    
    func fetchCoins() {
        cancellable = cryptoService.fetchCoins().sink(receiveCompletion: { _ in }, receiveValue: { cryptoContainer in
            self.coinViewModels = cryptoContainer.data.coins.map { CoinViewModel($0)
            }
        })
    }
    
}
