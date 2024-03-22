//
//  Card.swift
//  StringCatalogEnumSample
//
//  Created by Vatsal Patel  on 3/21/24.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Card: View {
    var body: some View {
        ZStack(alignment:.topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.10, green: 0.10, blue: 0.10))
            VStack(alignment: .leading) {
                Image("nba")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                    .padding(.bottom)
                VStack(alignment: .leading, spacing: 10) {
                    Text(XCS.chasingHistoryNuggetsReachNbaSummitEp31.key)
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text(XCS.afterA47YearWaitTheNuggetsAreNbaChampsAfterAGame5WinVsTheHeatInWhichNikolaJokicClaimedBillRussellNbaFinalsMvpHonors.key)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .padding(.horizontal, 8)
            }
        }
        .foregroundStyle(.white)
        .padding()
        .frame(width:350, height: 375)
    }
}

#Preview {
    Card()
}


// Chasing History: Nuggets reach NBA summit (Ep. 31)
// After a 47-year wait, the Nuggets are NBA champs after a Game 5 win vs. the Heat in which Nikola Jokic claimed Bill Russell NBA Finals MVP honors.
