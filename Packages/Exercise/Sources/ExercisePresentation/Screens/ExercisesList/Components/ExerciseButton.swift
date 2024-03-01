//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI
import ExerciseDomain

@available(
    iOS 15.0.0,
    *
)
struct ExerciseButton: View {
    
    @StateObject var vm: ExerciseScreenViewModel
    
    private let exercise: Exercise
    
    init(
        exercise: Exercise
    ) {
        self.exercise = exercise
        _vm = StateObject(
            wrappedValue: ExerciseScreenViewModel()
        )
    }
    
    var body: some View {
        Button {
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
        .sheet(
            isPresented: $vm.shouldPresentExercise
        ) {
            ExerciseScreen(
                vm: self.vm,
                exercise: self.exercise
            )
        }
    }
}

