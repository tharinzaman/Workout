//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI
import NetworkingData
import NetworkingDomain
import SwiftData

@available(
    iOS 17.0.0,
    *
)
public struct ExercisesListScreen: View {
    
    @StateObject var exercisesListScreenVm: ExercisesListScreenViewModel
    @StateObject var exerciseScreenVm: ExerciseScreenViewModel
    
    public init(modelContext: ModelContext) {
        _exercisesListScreenVm = StateObject(
            wrappedValue: ExercisesListScreenViewModel(
                fetch: NetworkingResolver.shared.resolve(
                    Fetch.self
                ),
                alertHelper: AlertHelperImpl()
            )
        )
        _exerciseScreenVm = StateObject(
            wrappedValue: ExerciseScreenViewModel(modelContext: modelContext)
        )
    }
    
    public var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("🏋️ Workouts")
                    .padding(20)
                    .font(.title)
                    .fontWeight(.bold)
                List(
                    exercisesListScreenVm.exercises
                ) { exercise in
                    ExerciseButton(
                        exercise: exercise,
                        vm: exerciseScreenVm
                    )
                }
                .listStyle(
                    .plain
                )
            }
            .task {
                await exercisesListScreenVm.fetchExercises()
            }
            if exercisesListScreenVm.areExercisesLoading {
                LoadingScreen()
            }
        }
        .sheet(
            isPresented: $exerciseScreenVm.shouldPresentExercise
        ) {
            exerciseScreenVm.endWorkout()
        } content: {
            ExerciseScreen(
                vm: self.exerciseScreenVm
            )
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
        .alert(
            item: $exercisesListScreenVm.alert
        ) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}
