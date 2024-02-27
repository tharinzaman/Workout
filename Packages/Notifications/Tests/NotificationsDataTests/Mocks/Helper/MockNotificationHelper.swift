//
//  File.swift
//  
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import NotificationsDomain

final class MockNotificationHelperSuccess: NotificationHelper {
    
    private(set) var registerNotificationCalled = false
    
    func registerNotification(identifier: String, title: String, body: String, hour: Int, minute: Int, daily: Bool) throws {
        registerNotificationCalled = true
        return
    }
    
}

final class MockNotificationHelperMissingPermissions: NotificationHelper {
    
    private(set) var registerNotificationCalled = false
    
    func registerNotification(identifier: String, title: String, body: String, hour: Int, minute: Int, daily: Bool) throws {
        registerNotificationCalled = true
        throw NotificationError.missingPermissions
    }
    
}

final class MockNotificationHelperFailedToRegisterNotif: NotificationHelper {
    
    private(set) var registerNotificationCalled = false
    
    func registerNotification(identifier: String, title: String, body: String, hour: Int, minute: Int, daily: Bool) throws {
        registerNotificationCalled = true
        throw NotificationError.failedToRegisterNotification
    }
    
}

final class MockNotificationHelperUnknownNotifError: NotificationHelper {
    
    private(set) var registerNotificationCalled = false
    
    func registerNotification(identifier: String, title: String, body: String, hour: Int, minute: Int, daily: Bool) throws {
        registerNotificationCalled = true
        throw NotificationError.unknownNotificationError
    }
    
}

