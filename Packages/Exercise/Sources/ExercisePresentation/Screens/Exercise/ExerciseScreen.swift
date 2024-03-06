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
        
    init(
        vm: ExerciseScreenViewModel
    ) {
        self.vm = vm
    }
    
    var body: some View {
        VStack(
            alignment: .center
        ) {
            ExerciseTextView(
                exercise: vm.selectedExercise
            )
            WorkoutActionButtonsView(
                vm: vm
            ).disabled(
                vm.selectedExercise == Exercise.failedExercise ? true : false
            )
            TimerView(
                vm: vm
            )
            .padding(.top)
        }
    }
    
}

