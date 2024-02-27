//
//  File.swift
//
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation
import XCTest
import NetworkingDomain
@testable import NetworkingData

@available(
    iOS 13.0.0,
    *
)
class NetworkClientImplTest: XCTestCase {
    
    private let urlString = "https://github.com/terrenjpeterson/workout-planner/blob/master/exercises.json"
    
    private var session: URLSession!
    private var jsonUrl: URL!
    
    private var client = NetworkClientImpl()
    
    override func setUp() {
        jsonUrl = URL(
            string: urlString
        )
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSession.self]
        session = URLSession(
            configuration: configuration
        )
    }
    
    override func tearDown() {
        session = nil
        jsonUrl = nil
    }
    
    func test_makeANetworkRequest_success() async throws {
        // ASSIGN
        let data = StaticLoader.loadJSONFromFileReturnData(
            file: "MockNetworkResponse"
        )
        MockURLSession.loadingHandler = {
            let response = HTTPURLResponse(
                url: self.jsonUrl,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            return (
                response!,
                data
            )
        }
        let expectedResult: [Exercise] = StaticLoader.loadJSONFromFileReturnDecodedData(
            file: "MockNetworkResponse"
        )
        // ACT
        let result: [Exercise] = try await client.fetch(
            from: urlString,
            session: self.session
        )
        // ASSERT
        XCTAssertEqual(
            result,
            expectedResult
        )
    }
    
    func test_makeANetworkRequest_failure_invalidUrl() async throws {
        let data = StaticLoader.loadJSONFromFileReturnData(
            file: "MockNetworkResponse"
        )
        MockURLSession.loadingHandler = {
            let response = HTTPURLResponse()
            return (
                response,
                data            )
        }
        // ACT
        do {
            let _: [Exercise] = try await client.fetch(
                from: urlString,
                session: self.session
            )
        } catch {
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
    
    func test_makeANetworkRequest_failure_invalidResponse() async throws {
        // ASSIGN
        let invalidStatusCode = 400
        MockURLSession.loadingHandler = {
            let response = HTTPURLResponse(
                url: self.jsonUrl,
                statusCode: invalidStatusCode,
                httpVersion: nil,
                headerFields: nil
            )
            return (
                response!,
                nil
            )
        }
        // ACT
        do {
            let _: [Exercise] = try await client.fetch(
                from: urlString,
                session: self.session
            )
        } catch {
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
    
    func test_makeANetworkRequest_failure_invalidData() async throws {
        // ASSIGN
        MockURLSession.loadingHandler = {
            let response = HTTPURLResponse(
                url: self.jsonUrl,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            return (
                response!,
                nil
            )
        }
        // ACT
        do {
            let _: [Exercise] = try await client.fetch(
                from: urlString,
                session: self.session
            )
        } catch {
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
