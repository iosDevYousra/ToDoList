import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Full-screen background image
            Image("sky-8763986_1280")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // "+" button at the top-right corner
                HStack {
                    Spacer()
                    Button(action: {
                        // Action for the button
                        print("Plus button tapped")
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.system(size: 74))
                            .padding()
                    }
                }
                
                Spacer()
                
                // Navigation bar at the bottom
                HStack {
                    Spacer()
                }
                .padding()
                .frame(height: 200)
                .background(Color.white.opacity(0.7))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
