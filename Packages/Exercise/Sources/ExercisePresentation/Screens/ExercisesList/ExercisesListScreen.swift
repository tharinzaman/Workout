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
        /**
         If we are in debug mode and performing a UI test, then we will pass a mocked fetch use case. Depending on if the networkingSuccess argument is true or false,  we pass successful or failing mock.
         If we are in debug mode but NOT performing a UI test, then the fetch use case will be whatever was passed in the initializer.
         If we are not in debug mode, then the locationHelper and client will also be whatever was passed in the initializer.
         */
        #if DEBUG
        let mockFetch: Fetch = ExerciseUITestingHelper.networkingSuccess ? MockFetchSuccess() : MockFetchInvalidResponse()
        _exercisesListScreenVm = StateObject(
            wrappedValue: ExerciseUITestingHelper.isUITest ?
            ExercisesListScreenViewModel(
                fetch: mockFetch,
                alertHelper: AlertHelperImpl()
            ) :
            ExercisesListScreenViewModel(
                fetch: NetworkingResolver.shared.resolve(
                    Fetch.self
                ),
                alertHelper: AlertHelperImpl()
                )
        )
        #else
        _exercisesListScreenVm = StateObject(
            wrappedValue: ExercisesListScreenViewModel(
                fetch: NetworkingResolver.shared.resolve(
                    Fetch.self
                ),
                alertHelper: AlertHelperImpl()
            )
        )
        #endif
        _exerciseScreenVm = StateObject(
            wrappedValue: ExerciseScreenViewModel(modelContext: modelContext)
        )
    }
    
    public var body: some View {
        ZStack {
            NavigationStack {
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
                    .navigationTitle("🏋️ Workouts")
                    .accessibilityIdentifier("exercise-list")
            }
            if exercisesListScreenVm.areExercisesLoading {
                LoadingScreen()
            }
        }
        .task {
            await exercisesListScreenVm.fetchExercises()
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
