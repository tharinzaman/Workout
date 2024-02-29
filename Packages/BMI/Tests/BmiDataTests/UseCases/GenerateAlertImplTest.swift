//
//  GenerateAlertImplTest.swift
//
//
//  Created by Tharin Zaman on 29/02/2024.
//

import XCTest
import BmiDomain
@testable import BmiData

@available(
    iOS 13.0,
    *
)
final class GenerateAlertImplTest: XCTestCase {
    
    func test_generateAlert_success() {
        // ASSIGN
        let helper = MockAlertHelperSuccess()
        let generateAlert = GenerateAlertImpl(
            alertHelper: helper
        )
        let expectedResult = AlertItem.invalidHeight
        // ACT
        let result = generateAlert.execute(
            error: BmiError.invalidHeightPassed
        )
        // ASSERT
        XCTAssertEqual(
            result.message,
            expectedResult.message
        )
        XCTAssertTrue(helper.errorToBmiAlertCalled)
    }
    
    func test_generateAlert_failure() {
        // ASSIGN
        let helper = MockAlertHelperFailure()
        let generateAlert = GenerateAlertImpl(
            alertHelper: helper
        )
        let expectedResult = AlertItem.unableToComplete
        // ACT
        let result = generateAlert.execute(
            error: BmiError.invalidHeightPassed
        )
        // ASSERT
        XCTAssertEqual(
            result.message,
            expectedResult.message
        )
        XCTAssertTrue(helper.errorToBmiAlertCalled)
    }
    
}
