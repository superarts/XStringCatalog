//
//  DestinationsView.swift
//  TravelGuide
//
//  Created by Ankit  Mane on 3/20/24.
//

import Foundation
import SwiftUI

struct DestinationsView: View {
    @ObservedObject var viewModel = DestinationListViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.destinations, id: \.name) { destination in
                        NavigationLink(destination: DestinationDetailView(destination: destination)) {
                            HStack {
                                Image(destination.imageName) // Ensure you have these images in your assets
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                                Text(destination.name)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                        }
                        .buttonStyle(PlainButtonStyle()) // Remove the button highlight effect on tap
                    }
                }
            }
            .navigationTitle(XCS.travelDestinations.string)
        }
        .onAppear {
            viewModel.loadDestinations() // Load destinations when the view appears
        }
    }
}

