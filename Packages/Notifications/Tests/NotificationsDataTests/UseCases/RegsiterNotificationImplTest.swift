//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import XCTest
import NotificationsDomain
@testable import NotificationsData

final class RegisterNotificationImplTest: XCTestCase {
    
    func test_execute_success() {
        // ASSIGN
        let helper = MockNotificationHelperSuccess()
        let registerNotification = RegisterNotificationImpl(
            helper: helper
        )
        // ACT
        // ASSERT
        XCTAssertNoThrow(
            try registerNotification.execute(
                identifier: "Test identifier",
                title: "Test title",
                body: "Test body",
                hour: 9,
                minute: 0,
                daily: true
            )
        )
        XCTAssertTrue(helper.registerNotificationCalled)
    }
    
    func test_execute_failure_missingPremissions() {
        // ASSIGN
        let helper = MockNotificationHelperMissingPermissions()
        let registerNotification = RegisterNotificationImpl(
            helper: helper
        )
        // ACT
        do {
            let _ = try registerNotification.execute(
                identifier: "Test identifier",
                title: "Test title",
                body: "Test body",
                hour: 9,
                minute: 0,
                daily: true
            )
        } catch {
            guard let notificationError = error as? NotificationError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                notificationError,
                NotificationError.missingPermissions
            )
            XCTAssertTrue(helper.registerNotificationCalled)
        }
    }
    
    func test_execute_failure_failedToRegisterNotification() {
        // ASSIGN
        let helper = MockNotificationHelperFailedToRegisterNotif()
        let registerNotification = RegisterNotificationImpl(
            helper: helper
        )
        // ACT
        do {
            let _ = try registerNotification.execute(
                identifier: "Test identifier",
                title: "Test title",
                body: "Test body",
                hour: 9,
                minute: 0,
                daily: true
            )
        } catch {
            guard let notificationError = error as? NotificationError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                notificationError,
                NotificationError.failedToRegisterNotification
            )
            XCTAssertTrue(helper.registerNotificationCalled)
        }
    }
    
    func test_execute_failure_unknownNotificationError() {
        // ASSIGN
        let helper = MockNotificationHelperUnknownNotifError()
        let registerNotification = RegisterNotificationImpl(
            helper: helper
        )
        // ACT
        do {
            let _ = try registerNotification.execute(
                identifier: "Test identifier",
                title: "Test title",
                body: "Test body",
                hour: 9,
                minute: 0,
                daily: true
            )
        } catch {
            guard let notificationError = error as? NotificationError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            // ASSERT
            XCTAssertEqual(
                notificationError,
                NotificationError.unknownNotificationError
            )
            XCTAssertTrue(helper.registerNotificationCalled)
        }
    }
}
