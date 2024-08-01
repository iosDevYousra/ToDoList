import SwiftUI

struct NewPageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedTime = Date()
    @State private var taskName = ""
    @State private var repeatDays: [String: Bool] = [
        "EVERY SUNDAY": false, "EVERY MONDAY": false,
        "EVERY TUESDAY": false, "EVERY WEDNESDAY": false,
        "EVERY THURSDAY": false, "EVERY FRIDAY": false,
        "EVERY SATURDAY": false
    ]
    
    var body: some View {
        ZStack {
            Color(red: 230/255, green: 226/255, blue: 223/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                DatePicker(
                    "Select Time",
                    selection: $selectedTime,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(height: 100)
                        .overlay(
                            VStack(spacing: 0) {
                                HStack {
                                    Text("Task")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    TextField("TASK NAME", text: $taskName)
                                        .multilineTextAlignment(.trailing)
                                        .foregroundColor(.gray)
                                        .padding(.trailing)
                                }
                                .padding(.horizontal)
                                .frame(height: 50)
                                
                                Divider()
                                
                                NavigationLink(destination: RepeatScheduleView(repeatDays: $repeatDays)) {
                                    HStack {
                                        Text("Repeat Schedule")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                        
                                        Text(getRepeatText())
                                            .foregroundColor(.gray)
                                            .padding(.trailing)
                                    }
                                    .padding(.horizontal)
                                    .frame(height: 50)
                                }
                            }
                        )
                        .padding(.horizontal)
                }
                
                Button(action: {
                    // Implement delete action here
                }) {
                    Text("DELETE NOTIFICATION")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 100)
        }
        .navigationBarBackButtonHidden(true)
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
                }
                .foregroundColor(.blue)
            }
        }
    }
    
    private func getRepeatText() -> String {
        let selectedDays = repeatDays.filter { $0.value }.keys.sorted()
        
        if selectedDays.isEmpty {
            return "NEVER"
        } else if selectedDays.count == 7 {
            return "EVERY DAY"
        } else {
            return selectedDays.joined(separator: ", ").uppercased()
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
