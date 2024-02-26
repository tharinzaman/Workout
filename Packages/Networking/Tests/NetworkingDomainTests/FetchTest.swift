//
//  FetchTest.swift
//
//
//  Created by Tharin Zaman on 26/02/2024.
//

import XCTest
@testable import NetworkingDomain

@available(
    iOS 13.0.0,
    *
)
final class FetchTest: XCTestCase {
    
    func test_executeFetch_success() async throws {
        // ASSIGN
        let client = MockNetworkClientSuccess()
        let fetch = Fetch(
            client: client
        )
        // ACT
        let result: [Exercise] = try await fetch.execute(
            from: "",
            session: .shared
        )
        // ASSIGN
        XCTAssertFalse(result.isEmpty)
        XCTAssertEqual(result.count, 20)
        XCTAssertTrue(client.fetchCalled)
    }
    
    func test_executeFetch_invalidURL() async {
        // ASSIGN
        let client = MockNetworkClientInvalidURL()
        let fetch = Fetch(
            client: client
        )
        // ACT
        do {
            let _: [Exercise] =
            try await fetch.execute(
                    from: "",
                    session: .shared
                )
        } catch {
            // ASSIGN
            guard let networkError = error as? NetworkError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                networkError,
                NetworkError.invalidURL
            )
        }
    }
    
    func test_executeFetch_invalidResponse() async {
        // ASSIGN
        let client = MockNetworkClientInvalidResponse()
        let fetch = Fetch(
            client: client
        )
        // ACT
        do {
            let _: [Exercise] =
            try await fetch.execute(
                    from: "",
                    session: .shared
                )
        } catch {
            // ASSIGN
            guard let networkError = error as? NetworkError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                networkError,
                NetworkError.invalidResponse
            )
        }
    }
    
    func test_executeFetch_invalidData() async {
        // ASSIGN
        let client = MockNetworkClientInvalidData()
        let fetch = Fetch(
            client: client
        )
        // ACT
        do {
            let _: [Exercise] =
            try await fetch.execute(
                    from: "",
                    session: .shared
                )
        } catch {
            // ASSIGN
            guard let networkError = error as? NetworkError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                networkError,
                NetworkError.invalidData
            )
        }
    }
    
}
