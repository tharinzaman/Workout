//
//  TestView.swift
//  Workout
//
//  Created by Tharin Zaman on 28/02/2024.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 10
        ) {
            Text(
                "YOUR BMI"
            )
            Text(
                "24"
            )
            .fontWeight(
                .bold
            )
            Text(
                "Healthy"
            )
            Text(
                "Your weight is healthy, keep it how it is"
            )
        }
    }
}

#Preview {
    TestView()
}
