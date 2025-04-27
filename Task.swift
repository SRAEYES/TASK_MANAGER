import Foundation
import FirebaseFirestoreSwift

enum Priority: String, Codable, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

struct Task: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var priority: Priority
}
