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

final class GetImperialBmiImplTest: XCTestCase {
    
    func test_getImperialBmi_success() throws {
        // ASSIGN
        let calculator = MockBmiCalculatorSuccess()
        let getImperialBmi = GetImperialBmiImpl(
            calculator: calculator
        )
        let expectedResult = 24.0
        // ACT
        let result = try getImperialBmi.execute(
            weight: 125,
            feet: 5,
            inches: 0
        )
        // ASSERT
        XCTAssertEqual(
            result,
            expectedResult
        )
        XCTAssertTrue(
            calculator.calculateImperialBmiCalled
        )
    }
    
    func test_getImperialBmi_invalidHeightPassed() {
        // ASSIGN
        let calculator = MockBmiCalculatorInvalidHeight()
        let getImperialBmi = GetImperialBmiImpl(
            calculator: calculator
        )
        // ACT
        do {
            let _ = try getImperialBmi.execute(
                weight: 125,
                feet: 5,
                inches: 0
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
                calculator.calculateImperialBmiCalled
            )
        }
    }
    
    func test_getImperialBmi_invalidWeightPassed() {
        // ASSIGN
        let calculator = MockBmiCalculatorInvalidWeight()
        let getImperialBmi = GetImperialBmiImpl(
            calculator: calculator
        )
        // ACT
        do {
            let _ = try getImperialBmi.execute(
                weight: 125,
                feet: 5,
                inches: 0
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
                calculator.calculateImperialBmiCalled
            )
        }
    }
}
