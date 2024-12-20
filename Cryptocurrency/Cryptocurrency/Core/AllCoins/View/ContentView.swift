//
//  ContentView.swift
//  Cryptocurrency
//
//  Created by Taoufiq El Moutaouakil  12/4/2024
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $viewModel.searchText)
                List {
                    ForEach(viewModel.displayedCoins) { coin in
                        NavigationLink (
                            destination: DetailView(coin: coin),
                            label: {
                                HStack(spacing: 10) {
                                    Text("\(coin.marketCapRank)")
                                        .foregroundColor(Color.theme.secondaryText)
                                    KFImage(coin.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(coin.name)
                                            .fontWeight(.semibold)
                                        
                                        Text(coin.symbol.uppercased())
                                    }
                                    
                                    Spacer()
                                    
                                    MiniChartView(coin: coin)
                                        .frame(width: 60, height: 40)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        Text("$\(coin.currentPrice.asCurrencyWith6Decimals())")
                                            .bold()
                                        Text("\(coin.priceChangePercentage24H?.asPercentString() ?? "")")
                                            .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
                                    }
                                }
                                .font(.footnote)
                            }).tint(Color.theme.secondaryText)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("Coins"))
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
