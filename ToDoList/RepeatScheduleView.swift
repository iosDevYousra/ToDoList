import SwiftUI

struct RepeatScheduleView: View {
    @Binding var repeatDays: [String: Bool]
    @Environment(\.presentationMode) var presentationMode
    
    let days = ["EVERY SUNDAY", "EVERY MONDAY", "EVERY TUESDAY", "EVERY WEDNESDAY", "EVERY THURSDAY", "EVERY FRIDAY", "EVERY SATURDAY"]
    
    var body: some View {
        VStack {
            List {
                ForEach(days, id: \.self) { day in
                    Button(action: {
                        repeatDays[day, default: false].toggle()
                    }) {
                        HStack {
                            Text(day)
                                .foregroundColor(.black)
                            Spacer()
                            if repeatDays[day] == true {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            // Add the icon at the bottom of the page
            Image("Asset 1")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50) // Adjust the size as needed
                .padding(.bottom, 20)
        }
        .navigationBarTitle("Repeat", displayMode: .inline)
        .navigationBarItems(trailing: Button("Done") {
            presentationMode.wrappedValue.dismiss()
        })
    }
}

struct RepeatScheduleView_Previews: PreviewProvider {
    @State static var repeatDays: [String: Bool] = [
        "EVERY SUNDAY": false, "EVERY MONDAY": false,
        "EVERY TUESDAY": false, "EVERY WEDNESDAY": false,
        "EVERY THURSDAY": false, "EVERY FRIDAY": false,
        "EVERY SATURDAY": false
    ]
    
    static var previews: some View {
        RepeatScheduleView(repeatDays: $repeatDays)
    }
}
