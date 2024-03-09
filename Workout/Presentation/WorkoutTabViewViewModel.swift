//
//  WorkoutTabViewViewModel.swift
//  Workout
//
//  Created by Tharin Zaman on 07/03/2024.
//

import Foundation
import NotificationsDomain

final class WorkoutTabViewViewModel: ObservableObject {
    
    private let registerNotification: RegisterNotification?
    
    init(
        registerNotification: RegisterNotification?
    ) {
        self.registerNotification = registerNotification
    }
    
    func registerNotificationForWorkout() {
        do {
            if let registerNotification {
                try registerNotification.execute(
                    identifier: "morning-workout-notification",
                    title: "Time to workout",
                    body: "Let's get exercising",
                    hour: 09,
                    minute: 00,
                    daily: true
                )
            }
        } catch {
        }
    }
    
}
    
