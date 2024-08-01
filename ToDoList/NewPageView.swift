import SwiftUI

struct NewPageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // State to hold the selected time
    @State private var selectedTime = Date()

    var body: some View {
        ZStack {
            // Background color with Hex #E6E2DF
            Color(red: 230/255, green: 226/255, blue: 223/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                // Time Picker
                DatePicker(
                    "Select Time",
                    selection: $selectedTime,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden() // Hide the "Select Time" label
                
                Spacer() // Push the picker to the center
            }
            .padding(.top, 100) // Adjust the position of the picker
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("CANCEL") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.blue)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("SAVE") {
                    // Implement your save logic here
                    print("Selected time: \(selectedTime)")
                }
                .foregroundColor(.blue)
            }
        }
    }
}

struct NewPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewPageView()
        }
    }
}
