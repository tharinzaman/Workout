//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI
import ExerciseDomain

@available(
    iOS 15.0,
    *
)
struct ExerciseScreen: View {
    
    @ObservedObject var vm: ExerciseScreenViewModel
    
    private let exercise: Exercise
    
    init(
        vm: ExerciseScreenViewModel,
        exercise: Exercise
    ) {
        self.vm = vm
        self.exercise = exercise
    }
    
    var body: some View {
        VStack(alignment: .center) {
            ExerciseTextView(
                exercise: exercise
            )
            WorkoutActionButtonsView(vm: vm)
        }
    }
    
}

