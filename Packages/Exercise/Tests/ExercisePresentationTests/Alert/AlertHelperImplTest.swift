//
//  AlertHelperImplTest.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import XCTest
import ExerciseDomain
import NetworkingDomain
@testable import ExercisePresentation

@available(
    iOS 13.0,
    *
)
final class AlertHelperImplTest: XCTestCase {
    
    private var alertHelper: AlertHelper!
    
    override func setUp() {
        alertHelper = AlertHelperImpl()
    }
    
    override func tearDown() {
        alertHelper = nil
    }
    
    func test_badURLError_success() {
        // ASSIGN
        let expectedResult = AlertItem.badUrl
        // ACT
        let result = alertHelper.errorToWorkoutErrorAlert(
            error: NetworkError.invalidURL
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
    func test_badResponseError_success() {
        // ASSIGN
        let expectedResult = AlertItem.badResponse
        // ACT
        let result = alertHelper.errorToWorkoutErrorAlert(
            error: NetworkError.invalidResponse
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
    func test_badDataError_success() {
        // ASSIGN
        let expectedResult = AlertItem.badData
        // ACT
        let result = alertHelper.errorToWorkoutErrorAlert(
            error: NetworkError.invalidData
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
    func test_otherError_success() {
        // ASSIGN
        let expectedResult = AlertItem.unableToFetchExercises
        // ACT
        let result = alertHelper.errorToWorkoutErrorAlert(
            error: URLError(
                .badURL
            )
        )
        
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
}
