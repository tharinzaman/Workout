//
//  SwiftUIView.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import SwiftUI
import BmiDomain

@available(
    iOS 13.0.0,
    *
)
struct BmiResultView: View {
    
    @ObservedObject var vm: BmiScreenViewModel
    
    init(vm: BmiScreenViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 10
        ) {
            Text(
                vm.bmi != nil ? "YOUR BMI" : emptyString
            )
            Text(
                vm.bmi ?? emptyString
            )
            .fontWeight(
                .bold
            )
            Text(
                vm.bmiCategory?.rawValue ?? emptyString
            )
            Text(
                advice
            )
        }
    }
        
    private var advice: String {
        switch vm.bmiCategory {
        case .healthy: healthyAdvice
        case .underweight: underweightAdvice
        case .overweight: overweightAdvice
        case .obese: obeseAdvice
        case .invalid, .none: emptyString
        }
    }
        
    private let underweightAdvice = "You are underweight, eat more"
    private let healthyAdvice = "Your weight is healthy, keep it how it is"
    private let overweightAdvice = "You are overweight, eat less"
    private let obeseAdvice = "You are obese, eat MUCH less"
    private let emptyString = ""

}
