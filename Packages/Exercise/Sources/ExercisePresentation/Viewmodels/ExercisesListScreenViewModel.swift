//
//  File.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation
import NetworkingDomain

@available(
    iOS 13.0,
    *
)
final class ExercisesListScreenViewModel: ObservableObject {
    
    private let fetch: Fetch?
    private let alertHelper: AlertHelper
    
    private let urlString = "https://github.com/terrenjpeterson/workout-planner/blob/master/exercises.json"
    
    init(
        fetch: Fetch?,
        alertHelper: AlertHelper
    ) {
        self.fetch = fetch
        self.alertHelper = alertHelper
    }
    
    @Published var exercises: [Exercise] = []
    @Published var alert: AlertModel? = nil
    @Published var areExercisesLoading: Bool = false
    
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
                self.alert = alertHelper.errorToWorkoutErrorAlert(
                    error: error
                )
                areExercisesLoading = false
            }
        } else {
            self.alert = AlertItem.unableToFetchExercises
            areExercisesLoading = false
        }
    }
}
