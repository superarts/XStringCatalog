//
//  ContentView.swift
//  StringCatalogEnumSample
//
//  Created by Vatsal Patel  on 3/21/24.
//

import SwiftUI

struct ContentView: View {
    let user = "Aarav"
    let noOfBets = 4
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black
            
            VStack(alignment: .leading) {
                TopBar()
                Text(
                    String(format: NSLocalizedString("welcomeBack", comment: "displayed as a greeting on top of app"), user)
                )
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                
                Text(String.localizedStringWithFormat(NSLocalizedString(XCS.bets.rawValue, comment: ""),noOfBets))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                
                Text(XCS.trendingNewsForBasketball.key)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top)
                    .padding(.horizontal)

                VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(0..<5){ i in
                                Card()
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

#Preview("Spanish") {
    ContentView()
        .environment(\.locale, Locale(identifier: "ES"))
}
