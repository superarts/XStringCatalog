//
//  DestinationDetailView.swift
//  TravelGuide
//
//  Created by Ankit  Mane on 3/20/24.
//

import Foundation
import SwiftUI

struct DestinationDetailView: View {
    var destination: Destination

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                                      startPoint: .topLeading,
                                      endPoint: .bottomTrailing)
                       .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Image(destination.imageName) // Ensure you have this image in your assets
                        .resizable()
                        .frame(width: 250, height: 250)
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                    
                    Text(destination.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding([.top, .bottom], 5)
                    
                    Text(destination.description)
                        .font(.body)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(String.localizedStringWithFormat(NSLocalizedString(XCS.lldAttractions.rawValue, comment: ""), Int64(destination.attractionsCount)))
                            .font(.headline)
                            .padding([.top, .bottom, .leading])
                        
                        ForEach(destination.attractions, id: \.self) { attraction in
                            Text("• \(attraction)")
                                .padding([.bottom, .leading])
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                .padding()
            }
            .navigationTitle(destination.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
