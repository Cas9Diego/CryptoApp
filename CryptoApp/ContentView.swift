//
//  ContentView.swift
//  CryptoApp
//
//  Created by Diego Castro on 29/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var VModel = ContentViewViewModel()
    
    var body: some View {
        
        NavigationView {
        List(VModel.coinViewModels, id: \.self) {
            coinViewModel in
            
            Text(coinViewModel.name + " - " + coinViewModel.price)
            
        } .onAppear{self.VModel.fetchCoins()}
                .navigationBarTitle("Coins")
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
