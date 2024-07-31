import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("sky-8763986_1280")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            .navigationTitle("")  // Hide the title
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for the plus button
                        print("Plus button tapped!")
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)  // Set the icon color
                    }
                }
            }
            .background(NavigationConfigurator { nc in
                let customNavBar = UIHostingController(rootView: CustomNavigationBar()).view
                customNavBar?.frame = CGRect(x: 0, y: 0, width: nc.navigationBar.frame.width, height: 100)
                customNavBar?.backgroundColor = .clear
                
                nc.navigationBar.addSubview(customNavBar!)
                nc.navigationBar.sendSubviewToBack(customNavBar!)
            })
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let navController = uiViewController.navigationController {
            configure(navController)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
