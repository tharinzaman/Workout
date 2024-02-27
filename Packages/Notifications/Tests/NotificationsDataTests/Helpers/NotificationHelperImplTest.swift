//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import XCTest
import NotificationsDomain
@testable import NotificationsData

@available(
    iOS 13.0.0,
    *
)
class NotificationHelperImplTest: XCTestCase {
    
    func test_registerNotification_success() throws {
        // ASSIGN
        let notificationCenter = MockUNUserNotificationCenter_PermissionsGranted()
        let helper = NotificationHelperImpl(
            notificationCenter: notificationCenter
        )
        // ACT
        // ASSERT
        XCTAssertNoThrow(
            try helper.registerNotification(
                identifier: "",
                title: "",
                body: "",
                hour: 1,
                minute: 1,
                daily: true
            )
        )
        XCTAssertTrue(
            notificationCenter.getNotificationSettingsCalled
        )
        XCTAssertTrue(
            notificationCenter.removePendingNotificationRequestsCalled
        )
        XCTAssertTrue(
            notificationCenter.addCalled
        )
        XCTAssertFalse(
            notificationCenter.requestAuthorizationCalled
        )
    }
    
    func test_registerNotification_deniedPermissions() {
        // ASSIGN
        let notificationCenter = MockUNUserNotificationCenter_PermissionsDenied()
        let helper = NotificationHelperImpl(
            notificationCenter: notificationCenter
        )
        // ACT
        // ASSERT
        do {
            let _ = try helper.registerNotification(
                identifier: "",
                title: "",
                body: "",
                hour: 1,
                minute: 1,
                daily: true
            )
        } catch {
            guard let thrownError = error as? NotificationError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            XCTAssertEqual(
                thrownError,
                .missingPermissions
            )
            XCTAssertTrue(
                notificationCenter.getNotificationSettingsCalled
            )
            XCTAssertFalse(
                notificationCenter.requestAuthorizationCalled
            )
            XCTAssertFalse(
                notificationCenter.removePendingNotificationRequestsCalled
            )
            XCTAssertFalse(
                notificationCenter.addCalled
            )
        }
    }
    
    func test_registerNotification_failedToRegisterNotif() {
        // ASSIGN
        let notificationCenter = MockUNUserNotificationCenter_RequestAuthReturnsError()
        let helper = NotificationHelperImpl(
            notificationCenter: notificationCenter
        )
        // ACT
        // ASSERT
        do {
            let _ = try helper.registerNotification(
                identifier: "",
                title: "",
                body: "",
                hour: 1,
                minute: 1,
                daily: true
            )
        } catch {
            guard let thrownError = error as? NotificationError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            XCTAssertEqual(
                thrownError,
                .failedToRegisterNotification
            )
            XCTAssertTrue(
                notificationCenter.getNotificationSettingsCalled
            )
            XCTAssertTrue(
                notificationCenter.requestAuthorizationCalled
            )
            XCTAssertFalse(
                notificationCenter.removePendingNotificationRequestsCalled
            )
            XCTAssertFalse(
                notificationCenter.addCalled
            )
        }
    }
    
    func test_registerNotification_userDidNotAllow() {
        // ASSIGN
        let notificationCenter = MockUNUserNotificationCenter_UserDidNotAllow()
        let helper = NotificationHelperImpl(
            notificationCenter: notificationCenter
        )
        // ACT
        // ASSERT
        do {
            let _ = try helper.registerNotification(
                identifier: "",
                title: "",
                body: "",
                hour: 1,
                minute: 1,
                daily: true
            )
        } catch {
            guard let thrownError = error as? NotificationError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            XCTAssertEqual(
                thrownError,
                .missingPermissions
            )
            XCTAssertTrue(
                notificationCenter.getNotificationSettingsCalled
            )
            XCTAssertTrue(
                notificationCenter.requestAuthorizationCalled
            )
            XCTAssertFalse(
                notificationCenter.removePendingNotificationRequestsCalled
            )
            XCTAssertFalse(
                notificationCenter.addCalled
            )
        }
    }
}

