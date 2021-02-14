import Foundation

public struct Issue: Codable {
    public var title: String
    public var user: User
    public var labels: [Label]
    public var assignees: [User]
}

public struct User: Codable {
    public var login: String
}

public struct Label: Codable {
    public var name: String
    public var id: Int
    public var url: String
}

public struct Milestone: Codable {
    public var id: Int
    public var number: Int
    public var state: String
    public var title: String
    public var description: String
    public var url: String
    public var labelsUrl: String
    public var creator: User
    public var openIssues: Int
    public var closedIssues: Int
    public var createdAt: Date
    public var updatedAt: Date?
    public var closedAt: Date?
    public var dueOn: Date?
}
