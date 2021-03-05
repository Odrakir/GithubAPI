import Foundation

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
