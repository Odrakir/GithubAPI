import Foundation

public struct Tag: Codable {
    public var name: String
    public var commit: Commit
}

public struct Commit: Codable {
    public var sha: String
    public var url: String
}
