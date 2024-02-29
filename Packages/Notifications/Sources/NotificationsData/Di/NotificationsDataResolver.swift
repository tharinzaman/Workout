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

public struct NotificationsDataResolver {
    
    private init() {}
    
    public static let shared = NotificationsDataResolver()
    
    private var container = buildDependencyInjectionContainer()
    
    public func resolve<T>(
        _ type: T.Type
    ) -> T? {
        return container.resolve(
            T.self
        )
    }
    
}

// We only want outside modules to interact/access the use cases, therefore we will only register the use cases and nothing else in order to hide the others.
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
