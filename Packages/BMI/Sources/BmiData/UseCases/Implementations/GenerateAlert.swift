//
//  File.swift
//
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import BmiDomain

@available(iOS 13.0, *)
internal struct GenerateAlertImpl: GenerateAlert {
    
    private let alertHelper: AlertHelper
    
    init(
        alertHelper: AlertHelper
    ) {
        self.alertHelper = alertHelper
    }
    
    func execute(
        error: Error
    ) -> AlertModel {
        return alertHelper.errorToBmiErrorAlert(
            error: error
        )
    }
    
}
