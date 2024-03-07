//
//  WorkoutTabViewViewModelTest.swift
//  WorkoutTests
//
//  Created by Tharin Zaman on 07/03/2024.
//

import XCTest
import NotificationsDomain
@testable import Workout

final class WorkoutTabViewViewModelTest: XCTestCase {

    func test_registerNotificationForWorkout_success() {
        // ASSIGN
        let registerNotification = MockRegisterNotificationSuccess()
        let vm = WorkoutTabViewViewModel(registerNotification: registerNotification)
        // ACT
        vm.registerNotificationForWorkout()
        // ASSERT
        XCTAssertTrue(registerNotification.executeCalled)
    }

}
