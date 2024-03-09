//
//  GenerateAlertImplTest.swift
//
//
//  Created by Tharin Zaman on 29/02/2024.
//

import XCTest
import BmiDomain
import Alerts
@testable import BmiPresentation

@available(
    iOS 13.0,
    *
)
final class AlertImplTest: XCTestCase {
    
    private var alertHelper: AlertHelper!
    
    override func setUp() {
        alertHelper = BmiAlertHelperImpl()
    }
    
    override func tearDown() {
        alertHelper = nil
    }
    
    func test_invalidBmiError_success() {
        // ASSIGN
        let expectedResult = BmiAlertItem.unableToComplete
        // ACT
        let result = alertHelper.errorToAlert(
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
        let expectedResult = BmiAlertItem.invalidWeight
        // ACT
        let result = alertHelper.errorToAlert(
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
        let expectedResult = BmiAlertItem.invalidHeight
        // ACT
        let result = alertHelper.errorToAlert(
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
        let expectedResult = BmiAlertItem.unableToComplete
        // ACT
        let result = alertHelper.errorToAlert(
            error: URLError(.badURL)
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult.message,
            result.message
        )
    }
    
}
