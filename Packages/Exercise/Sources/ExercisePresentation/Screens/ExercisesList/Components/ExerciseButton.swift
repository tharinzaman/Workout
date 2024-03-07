//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI
import ExerciseDomain

@available(
    iOS 17.0.0,
    *
)
struct ExerciseButton: View {
    
    @ObservedObject var vm: ExerciseScreenViewModel
    
    private let exercise: Exercise
    
    init(
        exercise: Exercise,
        vm: ExerciseScreenViewModel
    ) {
        self.exercise = exercise
        self.vm = vm
    }
    
    var body: some View {
        Button {
            vm.selectedExercise = exercise
            vm.shouldPresentExercise = true
        } label: {
            Text(
                exercise.exercise.capitalized
            )
            .fontWeight(
                .bold
            )
            .frame(
                maxWidth: .infinity
            )
        }
        .buttonStyle(
            .borderedProminent
        )
        .controlSize(
            .large
        )
        .buttonBorderShape(
            .capsule
        )
        .tint(
            .green
        )
    }
}

