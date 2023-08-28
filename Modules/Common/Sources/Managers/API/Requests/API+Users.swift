import Foundation

public enum API {}

extension API {
    public static func users(_ name: String) -> UsersResource { .init(path: "/users/\(name)") }

    public struct UsersResource {
        /// `/users/{username}`
        public let path: String

        /// Get the profile of the selected user.
        public var get: Request<User> { .init(path: path) }

        /// Access the repos belonging to the user.
        public var repos: ReposResource { .init(path: path + "/repos") }
    }
}

extension API.UsersResource {
    public struct ReposResource {
        /// `/users/{username}/repos`
        public let path: String

        /// Get the list of the repos belonging to the user.
        public var get: Request<[Repo]> { .init(path: path) }
    }
}

public struct User: Decodable {}

public struct Repo: Decodable {
    public let name: String
}
