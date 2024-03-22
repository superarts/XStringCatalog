import SwiftUI

struct WelcomScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(XCS.welcomeToSanFrancisco.string)
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .padding(.bottom, 50)
                    
                    NavigationLink(destination: DestinationsView()) {
                        ZStack {
                            Rectangle()
                                .fill(.black)
                                .frame(width: 250, height: 40)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                            Text(XCS.getTravelDestinations.string)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .accentColor(.black)
    }
}
