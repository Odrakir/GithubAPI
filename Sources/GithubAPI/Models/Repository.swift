import Foundation

public struct Repository: Codable {
    public var id: Int
    public var name: String
    public var fullName: String
    public var owner: User
    public var `private`: Bool
    public var description: String?
    public var fork: Bool
    public var url: String
    public var forksCount: Int
    public var stargazersCount: Int
    public var watchersCount: Int
    public var size: Int
    public var defaultBranch: String
    public var openIssuesCount: Int
    public var topics: [String]?
    public var archived: Bool
    public var disabled: Bool
    public var visibility: String?
    public var pushedAt: Date?
    public var createdAt: Date?
    public var updatedAt: Date?
}

public enum RepositoryType: String {
    case all, `public`, `private`, forks, sources, member, `internal`
}

public enum RepositorySorting: String {
    case created, updated, pushed, full_name
}
