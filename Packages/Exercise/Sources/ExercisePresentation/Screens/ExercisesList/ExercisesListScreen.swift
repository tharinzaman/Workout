//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI
import NetworkingData
import NetworkingDomain

@available(
    iOS 16.0.0,
    *
)
public struct ExercisesListScreen: View {
    
    @StateObject var vm: ExercisesListScreenViewModel
    
    public init() {
        _vm = StateObject(
            wrappedValue: ExercisesListScreenViewModel(
                fetch: NetworkingResolver.shared.resolve(
                    Fetch.self
                ),
                alertHelper: AlertHelperImpl()
            )
        )
    }
    
    public var body: some View {
        ZStack {
            NavigationStack {
                List(
                    vm.exercises
                ) { exercise in
                    ExerciseButton(
                        exercise: exercise
                    )
                }
                .navigationTitle(
                    "🏋️ Workout"
                )
                .listStyle(
                    .plain
                )
            }.task {
                await vm.fetchExercises()
            }
            if vm.areExercisesLoading {
                LoadingScreen()
            }
        }.alert(
            item: $vm.alert
        ) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}
