//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import XCTest
import BmiDomain
@testable import BmiData

final class GetMetricBmiImplTest: XCTestCase {
    
    func test_getMetricBmi_success() throws {
        // ASSIGN
        let calculator = MockBmiCalculatorSuccess()
        let getMetricBmi = GetMetricBmiImpl(
            calculator: calculator
        )
        let expectedResult = 24.0
        // ACT
        let result = try getMetricBmi.execute(
            height: 1.53,
            weight: 57
        )
        // ASSERT
        XCTAssertEqual(
            result,
            expectedResult
        )
        XCTAssertTrue(
            calculator.calculateMetricBmiCalled
        )
    }
    
    func test_getMetricBmi_invalidHeightPassed() {
        // ASSIGN
        let calculator = MockBmiCalculatorInvalidHeight()
        let getMetricBmi = GetMetricBmiImpl(
            calculator: calculator
        )
        // ACT
        do {
            let _ = try getMetricBmi.execute(
                height: 1.53,
                weight: 57
            )
        } catch {
            guard let thrownError = error as? BmiError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                thrownError,
                BmiError.invalidHeightPassed
            )
            XCTAssertTrue(
                calculator.calculateMetricBmiCalled
            )
        }
    }
    
    func test_getMetricBmi_invalidWeightPassed() {
        // ASSIGN
        let calculator = MockBmiCalculatorInvalidWeight()
        let getMetricBmi = GetMetricBmiImpl(
            calculator: calculator
        )
        // ACT
        do {
            let _ = try getMetricBmi.execute(
                height: 1.53,
                weight: 57
            )
        } catch {
            guard let thrownError = error as? BmiError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                thrownError,
                BmiError.invalidWeightPassed
            )
            XCTAssertTrue(
                calculator.calculateMetricBmiCalled
            )
        }
    }
}
