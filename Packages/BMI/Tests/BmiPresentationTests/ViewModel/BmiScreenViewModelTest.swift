//
//  BmiScreenViewModelTest.swift
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
final class BmiScreenViewModelTest: XCTestCase {
    
    private var getBmiCategory: GetBmiCategory!
    private var getMetricBmi: GetMetricBmi!
    private var getImperialBmi: GetImperialBmi!
    private var alertHelper: AlertHelper!
    
    private var vm: BmiScreenViewModel!
    
    override func setUp() {
        getBmiCategory = MockGetBmiCategorySuccess()
        getMetricBmi = MockGetMetricBmiSuccess()
        getImperialBmi = MockGetImperialBmiSuccess()
        alertHelper = MockAlertHelperSuccess()
        
        vm = BmiScreenViewModel(
            getBmiCategory: getBmiCategory,
            getMetricBmi: getMetricBmi,
            getImperialBmi: getImperialBmi,
            alertHelper: alertHelper
        )
    }
    
    override func tearDown() {
        getBmiCategory = nil
        getMetricBmi = nil
        getImperialBmi = nil
        alertHelper = nil
        
        vm = nil
    }
    
    func test_calculateMetricBmiSuccess() {
        // ASSIGN
        // ACT
        vm.calculateMetricBmi()
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
    
    func test_calculateMetricBmi_errorThrown() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: MockGetMetricBmiInvalidHeight(),
            getImperialBmi: self.getImperialBmi,
            alertHelper: self.alertHelper
        )
        // ACT
        vm.calculateMetricBmi()
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.invalidHeight.message
        )
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_calculateMetricBmi_useCaseNil() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: nil,
            getImperialBmi: self.getImperialBmi,
            alertHelper: self.alertHelper
        )
        // ACT
        vm.calculateMetricBmi()
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.unableToComplete.message
        )
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_calculateImperialBmiSuccess() {
        // ASSIGN
        vm.inches = "3"
        // ACT
        vm.calculateImperialBmi()
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
    
    func test_calculateImperialBmi_errorThrown() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: self.getMetricBmi,
            getImperialBmi: MockGetImperialBmiInvalidHeight(),
            alertHelper: self.alertHelper
        )
        // ACT
        vm.calculateImperialBmi()
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.invalidHeight.message
        )
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
    func test_calculateImperialBmi_noInchesPassed() {
        // ASSIGN
        vm.inches = ""
        // ACT
        vm.calculateImperialBmi()
        // ASSERT
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.invalidHeight.message
        )
    }
    
    func test_calculateImperialBmi_inchesLessThanZero() {
        // ASSIGN
        vm.inches = "-1"
        // ACT
        vm.calculateImperialBmi()
        // ASSERT
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.invalidHeight.message
        )
    }
    
    func test_calculateImoerialBmi_inchesMoreThanTwelve() {
        // ASSIGN
        vm.inches = "13"
        // ACT
        vm.calculateImperialBmi()
        // ASSERT
        XCTAssertNil(
            vm.bmi
        )
        XCTAssertNil(
            vm.bmiCategory
        )
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.invalidHeight.message
        )
    }
    
    func test_calculateImperialBmi_useCaseNil() {
        // ASSIGN
        vm = BmiScreenViewModel(
            getBmiCategory: self.getBmiCategory,
            getMetricBmi: self.getMetricBmi,
            getImperialBmi: nil,
            alertHelper: self.alertHelper
        )
        // ACT
        vm.calculateImperialBmi()
        // ASSERT
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.unableToComplete.message
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
            alertHelper: self.alertHelper
        )
        // ACT
        vm.calculateMetricBmi()
        // ASSERT
        XCTAssertEqual(
            vm.bmi,
            "24.0"
        )
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.unableToComplete.message
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
            alertHelper: self.alertHelper
        )
        // ACT
        vm.calculateMetricBmi()
        // ASSERT
        XCTAssertEqual(
            vm.bmi,
            "24.0"
        )
        XCTAssertEqual(
            vm.alert?.message,
            BmiAlertItem.unableToComplete.message
        )
        XCTAssertNil(
            vm.bmiCategory
        )
    }
    
}
