import Foundation

final class APIManagerDelegate: APIClientDelegate {
    private var accessToken = ""

    func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    }

    func client(
        _ client: APIClient,
        shouldRetry task: URLSessionTask,
        error: Error,
        attempts: Int
    ) async throws -> Bool {
        if case .unacceptableStatusCode(let statusCode) = error as? APIError, statusCode == 401, attempts == 1 {
            accessToken = try await refreshAccessToken()
            return true
        }
        return false
    }

    private func refreshAccessToken() async throws -> String {
        fatalError("Not implemented")
    }
}
