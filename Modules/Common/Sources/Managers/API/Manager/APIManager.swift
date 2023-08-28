import Foundation

public protocol Networking {
    func send<T: Decodable>(_ request: Request<T>) async throws -> Response<T>
}

public final class NetworkManager: Networking {

    private let delegate = APIManagerDelegate()
    private lazy var client =  APIClient(baseURL: URL(string: "https://api.github.com")) { [weak self] in
        $0.delegate = self?.delegate
    }

    @discardableResult
    public func send<T: Decodable>(_ request: Request<T>) async throws -> Response<T> {
        try await client.send(request)
    }
}

private struct NetworkManagerKey: InjectionKey {
    static var currentValue: Networking = NetworkManager()
}

extension InjectedValues {
    public var networkManager: Networking {
        get { Self[NetworkManagerKey.self] }
        set { Self[NetworkManagerKey.self] = newValue }
    }
}
