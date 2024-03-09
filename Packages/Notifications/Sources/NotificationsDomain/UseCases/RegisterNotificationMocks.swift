//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation

public final class MockRegisterNotificationSuccess: RegisterNotification {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws {
        executeCalled = true
    }
}

public final class MockRegisterNotificationMissingPermissions: RegisterNotification {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws {
        executeCalled = true
        throw NotificationError.missingPermissions
    }
}

public final class MockRegisterNotificationFailedToRegisterNotif: RegisterNotification {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws {
        executeCalled = true
        throw NotificationError.failedToRegisterNotification
    }
}

public final class MockRegisterNotificationUnknownNotifError: RegisterNotification {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws {
        executeCalled = true
        throw NotificationError.unknownNotificationError
    }
}

