//
//  File.swift
//  
//
//  Created by Tharin Zaman on 05/03/2024.
//

import Foundation

extension Int {
    
    func durationToString() -> String {
        if self < 10 {
            return "0\(self)"
        } else {
            return String(self)
        }
    }
    
}
