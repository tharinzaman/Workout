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

class BmiCalculatorImplTest: XCTestCase {
    
    private var calculator: BmiCalculator!
    
    override func setUp() {
        calculator = BmiCalculatorImpl()
    }
    
    override func tearDown() {
        calculator = nil
    }
    
    func test_calculateMetricBmi_success() throws {
        // ASSIGN
        let expectedResult = 24.0
        // ACT
        let result = try calculator.calculateMetricBmi(
            height: 153,
            weight: 57
        )
        // ASSERT
        print(result)
        XCTAssertEqual(
            result,
            expectedResult
        )
    }
    
    func test_calculateMetricBmi_invalidWeightPassed() {
        // ASSIGN
        // ACT
        do {
            let _ = try calculator.calculateMetricBmi(
                height: 153,
                weight: -12.0
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
        }
    }
    
    func test_calculateMetricBmi_invalidHeightPassed() {
        // ASSIGN
        // ACT
        do {
            let _ = try calculator.calculateMetricBmi(
                height: -242,
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
        }
    }
    
    func test_calculateImperialBmi_success() throws {
        // ASSIGN
        let expectedResult = 24.0
        // ACT
        let result = try calculator.calculateImperialBmi(
            weight: 125,
            feet: 5,
            inches: 0
        )
        // ASSERT
        XCTAssertEqual(
            result,
            expectedResult
        )
    }
    
    func test_calculateImperialBmi_invalidWeightPassed() {
        // ASSIGN
        // ACT
        do {
            let _ = try calculator.calculateImperialBmi(
                weight: -125,
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
        }
    }
    
    func test_calculateImperialBmi_invalidHeightPassed() {
        // ASSIGN
        // ACT
        do {
            let _ = try calculator.calculateImperialBmi(
                weight: 125,
                feet: -5,
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
        }
    }
    
    func test_calculateBmiCategory_success() throws {
        // ASSIGN
        let expectedResult = BmiCategory.healthy
        // ACT
        let result = try calculator.calculateBmiCategory(
            bmi: 24.0
        )
        // ASSERT
        XCTAssertEqual(
            result,
            expectedResult
        )
    }
    
    func test_calculateBmiCategory_invalidBmiPassed() {
        // ASSIGN
        // ACT
        do {
            let _ = try calculator.calculateBmiCategory(
                bmi: -24.0
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
                BmiError.invalidBmiPassed
            )
        }
    }
}
