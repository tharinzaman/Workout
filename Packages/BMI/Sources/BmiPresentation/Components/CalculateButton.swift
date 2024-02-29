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
                vm.getMetricBmi(
                    height: Double(
                        vm.height
                    ) ?? -1,
                    weight: Double(
                        vm.weight
                    ) ?? -1
                )
            } else {
                vm.getImperialBmi(
                    weight: Double(vm.weight) ?? -1,
                    feet: Int(vm.height) ?? -1,
                    inches: Int(vm.inches) ?? -1
                )
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
