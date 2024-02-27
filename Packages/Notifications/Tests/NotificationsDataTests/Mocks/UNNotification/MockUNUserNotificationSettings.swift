//
//  File.swift
//  
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import UserNotifications

final class MockUNNotificationSettingsAuthorized: UNNotificationSettings {
    
    init?() {
        super.init(coder: NSCoder())
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var authorizationStatus: UNAuthorizationStatus {
        return .authorized
    }
}

final class MockUNNotificationSettingsNotDetermined: UNNotificationSettings {
    
    init?() {
        super.init(coder: NSCoder())
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var authorizationStatus: UNAuthorizationStatus {
        return .notDetermined
    }
}

final class MockUNNotificationSettingsDenied: UNNotificationSettings {
    
    init?() {
        super.init(coder: NSCoder())
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var authorizationStatus: UNAuthorizationStatus {
        return .denied
    }
}
