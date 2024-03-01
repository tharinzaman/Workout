//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 29/02/2024.
//

import SwiftUI

@available(
    iOS 15.0.0,
    *
)
struct CalculateButton: View {
    
    @ObservedObject var vm: BmiScreenViewModel
    
    var body: some View {
        Button {
            if vm.isMetric {
                vm.calculateMetricBmi()
            } else {
                vm.calculateImperialBmi()
            }
        } label: {
            Text(
                "CALCULATE"
            )
            .fontWeight(
                .bold
            )
        }
        .buttonStyle(
            .borderedProminent
        )
        .controlSize(
            .large
        )
        .tint(
            .green
        )
    }
}
