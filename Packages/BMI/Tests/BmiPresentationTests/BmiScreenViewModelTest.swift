//
//  BmiScreenViewModelTest.swift
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
final class BmiScreenViewModelTest: XCTestCase {
    
    private var getBmiCategory: GetBmiCategory!
    private var getMetricBmi: GetMetricBmi!
    private var getImperialBmi: GetImperialBmi!
    private var generateAlert: GenerateAlert!
    
    private var vm: BmiScreenViewModel!
    
    override func setUp() {
        getBmiCategory = MockGetBmiCategorySuccess()
        getMetricBmi = MockGetMetricBmiSuccess()
        getImperialBmi = MockGetImperialBmiSuccess()
        generateAlert = MockGenerateAlertSuccess()
        
        vm = BmiScreenViewModel(
            getBmiCategory: getBmiCategory,
            getMetricBmi: getMetricBmi,
            getImperialBmi: getImperialBmi,
            generateAlert: generateAlert
        )
    }
    
    override func tearDown() {
        getBmiCategory = nil
        getMetricBmi = nil
        getImperialBmi = nil
        generateAlert = nil
        
        vm = nil
    }
    
    func test_generateMetricBmiSuccess() {
        // ASSIGN
        // ACT
        vm.getMetricBmi(
            height: 153,
            weight: 57
        )
        // ASSERT
        XCTAssertEqual(
            vm.bmi,
            "24.0"
        )
        XCTAssertEqual(
            vm.bmiCategory,
            .healthy
        )
        XCTAssertNil(
            vm.alert
        )
    }
    
    func test_generateMetricBmi_errorThrown() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: MockGetMetricBmiInvalidHeight(),
            getImperialBmi: self.getImperialBmi,
            generateAlert: self.generateAlert
        )
        // ACT
        vm.getMetricBmi(
            height: 153,
            weight: 57
        )
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            AlertItem.invalidHeight.message
        )
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_generateMetricBmi_useCaseNil() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: nil,
            getImperialBmi: self.getImperialBmi,
            generateAlert: self.generateAlert
        )
        // ACT
        vm.getMetricBmi(
            height: 153,
            weight: 57
        )
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            AlertItem.unableToComplete.message
        )
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_generateImperialBmiSuccess() {
        // ASSIGN
        // ACT
        vm.getImperialBmi(
            weight: 125,
            feet: 5,
            inches: 0
        )
        // ASSERT
        XCTAssertEqual(
            vm.bmi,
            "24.0"
        )
        XCTAssertEqual(
            vm.bmiCategory,
            .healthy
        )
        XCTAssertNil(
            vm.alert
        )
    }
    
    func test_generateImperialBmi_errorThrown() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: self.getMetricBmi,
            getImperialBmi: MockGetImperialBmiInvalidHeight(),
            generateAlert: self.generateAlert
        )
        // ACT
        vm.getImperialBmi(
            weight: 125,
            feet: 5,
            inches: 0
        )
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            AlertItem.invalidHeight.message
        )
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_generateImperialBmi_useCaseNil() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: self.getMetricBmi,
            getImperialBmi: nil,
            generateAlert: self.generateAlert
        )
        // ACT
        vm.getImperialBmi(
            weight: 125,
            feet: 5,
            inches: 0
        )
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            AlertItem.unableToComplete.message
        )
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_getBmiCategory_errorThrown() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: MockGetBmiCategoryFailure(),
            getMetricBmi: self.getMetricBmi,
            getImperialBmi: self.getImperialBmi,
            generateAlert: self.generateAlert
        )
        // ACT
        vm.getMetricBmi(
            height: 153,
            weight: 57
        )
        // ASSERT
        XCTAssertEqual(
            vm.bmi,
            "24.0"
        )
        XCTAssertEqual(
            vm.alert?.message,
            AlertItem.unableToComplete.message
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_getBmiCategory_useCaseNil() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: nil,
            getMetricBmi: self.getMetricBmi,
            getImperialBmi: self.getImperialBmi,
            generateAlert: self.generateAlert
        )
        // ACT
        vm.getMetricBmi(
            height: 153,
            weight: 57
        )
        // ASSERT
        XCTAssertEqual(
            vm.bmi,
            "24.0"
        )
        XCTAssertEqual(
            vm.alert?.message,
            AlertItem.unableToComplete.message
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_getMetricBmi_failure_alertHelperNil() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: MockGetMetricBmiInvalidHeight(),
            getImperialBmi: self.getImperialBmi,
            generateAlert: nil
        )
        // ACT
        vm.getMetricBmi(
            height: 153,
            weight: 57
        )
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            AlertItem.unableToComplete.message
        )
        XCTAssertNil(vm.bmi)
        XCTAssertNil(vm.bmiCategory)
    }
}
