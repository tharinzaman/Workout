//
//  File.swift
//
//
//  Created by Tharin Zaman on 25/02/2024.
//

import Foundation
import NotificationsDomain

public class RegisterNotificationImpl: RegisterNotification {
    
    private let helper: NotificationHelper
    
    init(
        helper: NotificationHelper
    ) {
        self.helper = helper
    }
    
    public func execute(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws {
        try helper.registerNotification(
            identifier: identifier,
            title: title,
            body: body,
            hour: hour,
            minute: minute,
            daily: daily
        )
    }
    
}
