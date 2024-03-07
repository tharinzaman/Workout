//
//  File.swift
//  
//
//  Created by Tharin Zaman on 07/03/2024.
//

import SwiftUI
import ExerciseDomain

@available(iOS 17, *)
struct RecordCell: View {
    
    let record: Record
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(
                record.timestamp
                    .formatted(date: .numeric, time: .standard)
                    .replacingOccurrences(of: ",", with: "")
            )
            .frame(width: 100, alignment: .leading)
            Spacer()
            Text(
                record.exerciseName
                    .capitalized
            )
            .multilineTextAlignment(.center)
            .frame(width: 100, alignment: .center)
            Spacer()
            Text(
                record.duration
            )
            .frame(width: 100, alignment: .trailing)
        }
    }
}
