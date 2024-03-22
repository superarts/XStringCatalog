//
//  TopBar.swift
//  StringCatalogEnumSample
//
//  Created by Vatsal Patel  on 3/21/24.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack(alignment: .bottom){
            Image("logoQuible")
                .resizable()
                .frame(width: 80, height: 40)
            Spacer()
            Button {
                print("Notification Clicked!")
            } label: {
                Image(systemName: "bell.fill")
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
            }
        }
        .padding(.top, 50)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .background(Color(red: 0.11, green: 0.11, blue: 0.11))
        .clipShape(RoundedRectangle(
            cornerRadius: 0,
            style: .continuous
        ))
    }
}

#Preview {
    TopBar()
}
