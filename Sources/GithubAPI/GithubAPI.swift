import Foundation
import CombineNetworking
import Combine

public class GithubAPI {

    private let loader: HTTPLoader
    private let decoder: JSONDecoder

    public init(token: String, loader: HTTPLoader = URLSession.loader) {
        let applyEnvironment = ApplyEnvironment(
            environment: ServerEnvironment(
                host: "api.github.com",
                pathPrefix: "/repos/toggl/ios"
            )
        )

        let authenticate = Authenticate(username: "username", password: token)
        self.loader = authenticate --> applyEnvironment --> loader

        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }

    public func getIssues(forMilestone milestoneNumber: Int) -> AnyPublisher<[Issue], Error> {
        let request = HTTPRequest(
            path: "/issues",
            queryItems: [
                "state":"closed",
                "per_page": "100",
                "milestone": "\(milestoneNumber)"
            ]
        )

        return loadAndDecode(request)
    }

    public func getMilestones() -> AnyPublisher<[Milestone], Error> {
        let request = HTTPRequest(
            path: "/milestones",
            queryItems: [
                "per_page": "100",
                "state": "all"
            ]
        )

        return loadAndDecode(request)
    }

    private func loadAndDecode<T: Decodable>(_ request: HTTPRequest) -> AnyPublisher<T, Error> {
        return loader.load(request: request)
            .decode(with: decoder)
            .eraseToAnyPublisher()
    }
}

extension GithubAPI {
    public func getIssues(forMilestone milestoneName: String?) -> AnyPublisher<(Milestone, [Issue]), Error> {
        getMilestones()
            .flatMap { milestones -> AnyPublisher<(Milestone, [Issue]), Error> in
                if milestoneName == nil {
                    let latest = milestones.sorted(by: { $0.number > $1.number }).first!
                    return self.getIssues(forMilestone: latest.number)
                        .map { (latest, $0) }
                        .eraseToAnyPublisher()
                }

                guard let milestone = milestones.first(where: { $0.title == milestoneName }) else {
                    fatalError("Milestone not found")
                }

                return self.getIssues(forMilestone: milestone.number)
                    .map { (milestone, $0) }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
