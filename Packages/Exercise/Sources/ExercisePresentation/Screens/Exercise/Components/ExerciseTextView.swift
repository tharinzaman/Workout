//
//  SwiftUIView.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI
import ExerciseDomain

@available(iOS 14.0.0, *)
struct ExerciseTextView: View {
    
    private let exercise: Exercise

    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(exercise.exercise.capitalized)
                .font(.title)
                .fontWeight(.bold)
                .padding(30)
            Text("Targets: \(exercise.bodyPart.capitalized)")
                .font(.title3)
                .fontWeight(.semibold)
            Text(exercise.description)
                .font(.body)
                .padding(30)
                .multilineTextAlignment(.center)
        }
    }
}

