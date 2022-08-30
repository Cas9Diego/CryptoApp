//
//  CryptoService.swift
//  CryptoApp
//
//  Created by Diego Castro on 29/08/22.
//

import Foundation
import Combine

class CryptoService {
    
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coinranking.com"
        components.path = "/v2/coins"
        components.queryItems = [URLQueryItem(name: "base", value: "USD"), URLQueryItem(name: "timePeriod", value: "24h")]
        return components
    }
    
    func fetchCoins () -> AnyPublisher<CoinsModel, Error> {
        print(components.url!, "URL")
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map { $0.data }
            .decode(type: CoinsModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() //This is done in order to return <AnyPublisher>
        
    }
    
}

