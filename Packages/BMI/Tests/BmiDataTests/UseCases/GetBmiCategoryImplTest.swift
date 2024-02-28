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

final class GetBmiCategoryImplTest: XCTestCase {
    
    func test_getBmiCategory_success() throws {
        // ASSIGN
        let calculator = MockBmiCalculatorSuccess()
        let getBmiCategory = GetBmiCategoryImpl(calculator: calculator)
        let expectedResult = BmiCategory.healthy
        // ACT
        let result = try getBmiCategory.execute(bmi: 24.0)
        // ASSERT
        XCTAssertEqual(result, expectedResult)
        XCTAssertTrue(calculator.calculateBmiCategoryCalled)
    }
    
    func test_getBmiCategory_failure() {
        // ASSIGN
        let calculator = MockBmiCalculatorInvalidHeight()
        let getBmiCategory = GetBmiCategoryImpl(calculator: calculator)
        // ACT
        do {
            let _ = try getBmiCategory.execute(bmi: 24.0)
        } catch {
            guard let thrownError = error as? BmiError else {
                XCTFail("Wrong type of error")
                return
            }
            // ASSERT
            XCTAssertEqual(thrownError, BmiError.invalidBmiPassed)
            XCTAssertTrue(calculator.calculateBmiCategoryCalled)
        }
    }
}
