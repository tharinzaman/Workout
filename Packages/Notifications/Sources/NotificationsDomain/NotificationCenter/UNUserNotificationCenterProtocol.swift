//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import UserNotifications

public protocol UNUserNotificationCenterProtocol {
    
    func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    )
    
    func requestAuthorization(
        options: UNAuthorizationOptions,
        completionHandler: @escaping (
            Bool,
            Error?
        ) -> Void
    )
    
    func removePendingNotificationRequests(
        withIdentifiers identifiers: [String]
    )
    
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?)
}

extension UNUserNotificationCenter: UNUserNotificationCenterProtocol {
}
