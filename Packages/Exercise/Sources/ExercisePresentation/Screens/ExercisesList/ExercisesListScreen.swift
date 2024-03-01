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
        if vm.areExercisesLoading {
            LoadingScreen()
        } else {
            NavigationStack {
                
            }
        }
    }
}
