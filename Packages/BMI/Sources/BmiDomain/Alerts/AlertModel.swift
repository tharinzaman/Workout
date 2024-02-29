//
//  File.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct AlertModel: Identifiable {
    
    init(
        title: String,
        message: String
    ) {
        self.title = Text(
            title
        )
        self.message = Text(
            message
        )
    }
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton = Alert.Button.default(
        Text(
            "OK"
        )
    )
}
