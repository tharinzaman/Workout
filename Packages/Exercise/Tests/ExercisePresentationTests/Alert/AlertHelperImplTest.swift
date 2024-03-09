//
//  AlertHelperImplTest.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import XCTest
import ExerciseDomain
import NetworkingDomain
import Alerts
@testable import ExercisePresentation

@available(
    iOS 13.0,
    *
)
final class AlertHelperImplTest: XCTestCase {
    
    private var alertHelper: AlertHelper!
    
    override func setUp() {
        alertHelper = ExerciseAlertHelperImpl()
    }
    
    override func tearDown() {
        alertHelper = nil
    }
    
    func test_badURLError_success() {
        // ASSIGN
        let expectedResult = ExerciseAlertItem.badUrl
        // ACT
        let result = alertHelper.errorToAlert(
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
        let expectedResult = ExerciseAlertItem.badResponse
        // ACT
        let result = alertHelper.errorToAlert(
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
        let expectedResult = ExerciseAlertItem.badData
        // ACT
        let result = alertHelper.errorToAlert(
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
        let expectedResult = ExerciseAlertItem.unableToFetchExercises
        // ACT
        let result = alertHelper.errorToAlert(
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
