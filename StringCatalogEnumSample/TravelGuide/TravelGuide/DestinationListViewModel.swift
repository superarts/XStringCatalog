//
//  DestinationListViewModel.swift
//  TravelGuide
//
//  Created by Ankit  Mane on 3/20/24.
//

import Foundation
class DestinationListViewModel: ObservableObject {
    @Published var destinations: [Destination] = []
    
    // Initializer or function to load destinations
    func loadDestinations() {
       
         destinations = [
            Destination(
                name: XCS.bigSur.string,
                imageName: "big_sur_image_name",
                description: XCS.bigSureDesc.string,
                attractionsCount: 3,
                attractions: [
                    XCS.bigSurAttraction1.string,
                    XCS.bigSurAttraction2.string,
                    XCS.bigSurAttraction3.string
                ]
            ),
            Destination(
                name: XCS.goldenGateBridge.string,
                imageName: "golden_gate_bridge_image_name",
                description: XCS.goldenGateBridgeDesc.string,
                attractionsCount: 1,
                attractions: [
                    XCS.goldenGateBridgeAttraction.string
                ]
            ),
            Destination(
                name: XCS.alcatraz.string,
                imageName: "alcatraz_image_name",
                description: XCS.alcatrazDesc.string,
                attractionsCount: 2,
                attractions: [
                    XCS.alcatrazAttraction1.string,
                    XCS.alcatrazAttraction2.string
                ]
            ),
            Destination(
                name: XCS.twinPeaks.string,
                imageName: "twin_peaks_image_name",
                description: XCS.twinPeaksDesc.string,
                attractionsCount: 1,
                attractions: [
                    XCS.twinPeaksAttraction.string
                ]
            )
        ]

    }
}
