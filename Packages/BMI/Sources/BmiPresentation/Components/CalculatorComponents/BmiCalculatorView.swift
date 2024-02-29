//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import SwiftUI

@available(
    iOS 15.0.0,
    *
)
struct BmiCalculatorView: View {
    
    @ObservedObject var vm: BmiScreenViewModel
    
    public init(
        vm: BmiScreenViewModel
    ) {
        self.vm = vm
    }
    
    var body: some View {
        Toggle(
            vm.isMetric ? "Metric" : "Imperial",
            isOn: $vm.isMetric
        )
        CalculationForm(vm: vm)
    }
}



