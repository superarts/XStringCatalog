//
//  DestinationViewModel.swift
//  TravelGuide
//
//  Created by Ankit  Mane on 3/20/24.
//

import Foundation
class DestinationViewModel: ObservableObject {
    @Published var destination: Destination
    
    init(destination: Destination) {
        self.destination = destination
    }
}
