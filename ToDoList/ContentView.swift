import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                        NavigationLink(destination: NewPageView()) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.white.opacity(0.7))
                                .font(.system(size: 75))
                                .padding()
                        }
                    }
                    
                    Spacer()
                    
                    // Navigation bar at the bottom
                    HStack {
                        Spacer()
                        
                        // Center image in navigation bar
                        Image("Asset 1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(height: 120)
                    .background(Color.white.opacity(0.7))
                }
            }
            .navigationBarTitle("") // Hides the title
            .navigationBarHidden(false) // Ensure navigation bar is visible for the next views
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
