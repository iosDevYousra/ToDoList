import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    
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
                        NavigationLink(destination: NewPageView(tasks: $tasks)) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.white.opacity(0.7))
                                .font(.system(size: 75))
                                .padding()
                        }
                    }
                    
                    Spacer()
                    
                    // Display saved tasks
                    if tasks.isEmpty {
                        Text("No tasks available")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                    } else {
                        List(tasks) { task in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(task.taskName)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Text(task.repeatSchedule)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(getTimeString(from: task.time))
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Toggle("", isOn: Binding.constant(task.isNotificationOn))
                                    .labelsHidden()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .listStyle(PlainListStyle())
                    }
                    
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
            .navigationBarHidden(true) // Hides the default navigation bar
        }
    }
    
    private func getTimeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
