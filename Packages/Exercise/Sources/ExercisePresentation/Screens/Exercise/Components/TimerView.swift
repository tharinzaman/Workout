//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI

@available(
    iOS 17.0.0,
    *
)
struct TimerView: View {
    
    @ObservedObject var vm: ExerciseScreenViewModel
        
    var body: some View {
        ZStack {
            Rectangle()
                .frame(
                    width: 150,
                    height: 50
                )
                .clipShape(
                    .rect(
                        cornerRadius: 10
                    )
                )
                .foregroundColor(
                    .green
                )
            Text(
                vm.workoutDurationString
            )
            .font(
                .title3
            )
            .fontWeight(
                .semibold
            )
        }
    }
    
}

                          
    

