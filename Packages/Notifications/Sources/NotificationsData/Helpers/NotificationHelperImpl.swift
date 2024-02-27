import NotificationsDomain
import UserNotifications

internal class NotificationHelperImpl: NotificationHelper {
    
    private let notificationCenter : UNUserNotificationCenter
    
    init(notificationCenter: UNUserNotificationCenter) {
        self.notificationCenter = notificationCenter
    }
    
    func registerNotification(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws {
        do {
            if try checkNotificationStatus() == true {
                dispatchNotification(
                    identifier: identifier,
                    title: title,
                    body: body,
                    hour: hour,
                    minute: minute,
                    daily: daily
                )
            } else {
                throw NotificationError.unknownNotificationError
            }
        } catch {
            throw error
        }
    }
    
    private func checkNotificationStatus() throws -> Bool {
        var result: Bool = false
        var throwable: Error? = nil
        notificationCenter.getNotificationSettings { [self] settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                let requestStatus = requestNotificationsAuthorization()
                if requestStatus == nil {
                    result = true
                } else {
                    throwable = requestStatus
                }
            case .denied:
                result = false
                throwable = NotificationError.missingPermissions
            case .authorized:
                result = true
            case .provisional:
                result = true
            case .ephemeral:
                result = true
            @unknown default:
                result = false
            }
        }
        if throwable != nil {
            throw throwable ?? NotificationError.unknownNotificationError
        }
        return result
    }
    
    private func requestNotificationsAuthorization() -> NotificationError? {
        var result: NotificationError? = nil
        notificationCenter.requestAuthorization(
            options: [
                .alert,
                .sound
            ]
        ) {
            didAllow,
            error in
            if error != nil {
                result = .failedToRegisterNotification
            }
            if didAllow == false {
                result = .missingPermissions
            }
        }
        return result
    }
    
    private func dispatchNotification(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(
            calendar: calendar,
            timeZone: TimeZone.current
        )
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: daily
        )
        let request = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: trigger
        )
        
        notificationCenter.removePendingNotificationRequests(
            withIdentifiers: [identifier]
        )
        notificationCenter.add(
            request
        )
    }
    
}
