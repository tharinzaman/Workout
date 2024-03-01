//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import SwiftUI

@available(
    iOS 17.0.0,
    *
)
struct BmiCalculatorView: View {
    
    @ObservedObject var vm: BmiScreenViewModel
    
    init(
        vm: BmiScreenViewModel
    ) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            UnitToggle(
                vm: vm
            )
            CalculationForm(
                vm: vm
            )
        }
        
    }
}



