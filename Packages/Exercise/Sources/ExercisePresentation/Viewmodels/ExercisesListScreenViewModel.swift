//
//  File.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation
import ExerciseDomain

@available(iOS 13.0, *)
final class ExercisesListScreenViewModel: ObservableObject {
    
    @Published var exercises: [Exercise] = []
    @Published var alertItem: AlertItem? = nil
    @Published var areExercisesLoading: Bool = false
    
    func fetchExercises() {
        
    }
}
