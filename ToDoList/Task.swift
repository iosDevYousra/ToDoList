import Foundation

struct Task: Identifiable {
    var id = UUID()
    var time: Date
    var taskName: String
    var repeatSchedule: String
    var isNotificationOn: Bool
}
