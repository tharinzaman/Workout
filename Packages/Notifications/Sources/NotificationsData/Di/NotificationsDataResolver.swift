//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import NotificationsDomain
import Swinject
import UserNotifications

class NotificationsDataResolver {
    
    static let shared = NotificationsDataResolver()
    
    private var container = buildDependencyInjectionContainer()
    
    func resolve<T>(
        _ type: T.Type
    ) -> T? {
        return container.resolve(
            T.self
        )
    }
    
}

// We only want outside modules to interact with the use cases, therefore we will only register the use cases.
fileprivate func buildDependencyInjectionContainer() -> Container {
    
    let container = Container()
    
    container.register(
        RegisterNotification.self
    ) { _ in
        return RegisterNotificationImpl(
            helper: NotificationHelperImpl(
                notificationCenter: UNUserNotificationCenter.current()
            )
        )
    }
    
    return container
}
