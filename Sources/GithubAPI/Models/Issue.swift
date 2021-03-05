import Foundation

public struct Issue: Codable {
    public var title: String
    public var user: User
    public var labels: [Label]
    public var assignees: [User]
}
