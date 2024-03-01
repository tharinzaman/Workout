//
//  GenerateAlertImplTest.swift
//
//
//  Created by Tharin Zaman on 29/02/2024.
//

import XCTest
import BmiDomain
@testable import BmiPresentation

@available(
    iOS 13.0,
    *
)
final class AlertImplTest: XCTestCase {
    
    private var alertHelper: AlertHelper!
    
    override func setUp() {
        alertHelper = AlertHelperImpl()
    }
    
    override func tearDown() {
        alertHelper = nil
    }
    
    func test_invalidBmiError_success() {
        // ASSIGN
        let expectedResult = AlertItem.unableToComplete
        // ACT
        let result = alertHelper.errorToBmiErrorAlert(
            error: BmiError.invalidBmiPassed
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
    func test_invalidWeightError_success() {
        // ASSIGN
        let expectedResult = AlertItem.invalidWeight
        // ACT
        let result = alertHelper.errorToBmiErrorAlert(
            error: BmiError.invalidWeightPassed
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
    func test_invalidHeightError_success() {
        // ASSIGN
        let expectedResult = AlertItem.invalidHeight
        // ACT
        let result = alertHelper.errorToBmiErrorAlert(
            error: BmiError.invalidHeightPassed
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
    func test_otherError_success() {
        // ASSIGN
        let expectedResult = AlertItem.unableToComplete
        // ACT
        let result = alertHelper.errorToBmiErrorAlert(
            error: URLError(.badURL)
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
}
