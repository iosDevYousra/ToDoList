import SwiftUI

struct NewPageView: View {
    var body: some View {
        ZStack {
            // Background color with Hex #E6E2DF
            Color(red: 230/0, green: 226/0, blue: 223/255.0)
                .edgesIgnoringSafeArea(.all)
            
            // Content of the new page
            Text("This is the new page!")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
    }
}

struct NewPageView_Previews: PreviewProvider {
    static var previews: some View {
        NewPageView()
    }
}
