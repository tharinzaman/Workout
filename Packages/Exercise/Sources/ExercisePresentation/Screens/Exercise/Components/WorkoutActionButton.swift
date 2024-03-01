//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI

@available(
    iOS 14.0.0,
    *
)
struct WorkoutActionButton: View {
    
    private let buttonTitle: String
    private let action: () -> ()
    
    init(
        buttonTitle: String,
        action: @escaping () -> ()
    ) {
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(
                    width: 100,
                    height: 100
                )
                .foregroundColor(
                    .green
                )
            Text(
                buttonTitle
            )
            .fontWeight(
                .bold
            )
            .font(
                .title2
            )
        }.onTapGesture {
            action()
        }
    }
}

