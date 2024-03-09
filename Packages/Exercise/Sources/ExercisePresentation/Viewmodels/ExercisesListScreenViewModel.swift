//
//  File.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation
import NetworkingDomain
import ExerciseDomain
import Alerts

@available(
    iOS 13.0,
    *
)
final class ExercisesListScreenViewModel: ObservableObject {
    
    private let fetch: Fetch?
    private let alertHelper: AlertHelper?
    
    private let urlString = "https://raw.githubusercontent.com/terrenjpeterson/workout-planner/master/exercises.json"
    
    init(
        fetch: Fetch?,
        alertHelper: AlertHelper?
    ) {
        self.fetch = fetch
        self.alertHelper = alertHelper
    }
    
    @Published var exercises: [Exercise] = []
    @Published var alert: AlertModel? = nil
    @Published var areExercisesLoading: Bool = false
    
    @MainActor
    func fetchExercises() async {
        areExercisesLoading = true
        if let fetch {
            do {
                self.exercises = try await fetch.execute(
                    from: self.urlString,
                    session: .shared
                )
                areExercisesLoading = false
            } catch {
                if let alertHelper {
                    self.alert = alertHelper.errorToAlert(
                        error: error
                    )
                }
                areExercisesLoading = false
            }
        } else {
            self.alert = ExerciseAlertItem.unableToFetchExercises
            areExercisesLoading = false
        }
    }
}
