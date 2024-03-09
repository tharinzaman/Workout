//
//  ExercisesListScreenViewModelTest.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import XCTest
import NetworkingDomain
@testable import ExercisePresentation

@available(iOS 13.0.0, *)
final class ExercisesListScreenViewModelTest: XCTestCase {
    
    func test_fetchExercises_success() async {
        // ASSIGN
        let fetch = MockFetchSuccess()
        let helper = MockAlertHelperSuccess()
        let vm = ExercisesListScreenViewModel(
            fetch: fetch,
            alertHelper: helper
        )
        // ACT
        await vm.fetchExercises()
        // ASSERT
        XCTAssertFalse(vm.exercises.isEmpty)
        XCTAssertNil(vm.alert)
        XCTAssertTrue(fetch.executeCalled)
        XCTAssertFalse(helper.errorToAlertCalled)
    }
    
    func test_fetchExercises_errorThrown() async {
        // ASSIGN
        let fetch = MockFetchInvalidResponse()
        let helper = MockAlertHelperSuccess()
        let vm = ExercisesListScreenViewModel(
            fetch: fetch,
            alertHelper: helper
        )
        // ACT
        await vm.fetchExercises()
        // ASSERT
        XCTAssertTrue(vm.exercises.isEmpty)
        XCTAssertEqual(vm.alert?.message, ExerciseAlertItem.badResponse.message)
        XCTAssertTrue(fetch.executeCalled)
        XCTAssertTrue(helper.errorToAlertCalled)
    }
    
    func test_fetchExercises_fetchUseCaseNil() async {
        // ASSIGN
        let helper = MockAlertHelperSuccess()
        let vm = ExercisesListScreenViewModel(
            fetch: nil,
            alertHelper: helper
        )
        // ACT
        await vm.fetchExercises()
        // ASSERT
        XCTAssertTrue(vm.exercises.isEmpty)
        XCTAssertEqual(vm.alert?.message, ExerciseAlertItem.unableToFetchExercises.message)
    }
    
}
