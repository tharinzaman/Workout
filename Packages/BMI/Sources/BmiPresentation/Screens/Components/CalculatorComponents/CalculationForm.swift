//
//  SwiftUIView.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import SwiftUI

@available(iOS 15.0, *)
struct CalculationForm: View {
    
    @ObservedObject var vm: BmiScreenViewModel
    
    @FocusState private var focusedTextField: FocusTextField?
    
    init(vm: BmiScreenViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Form {
            Section(
                header: Text(
                    "Height"
                )
            )
            {
                TextField(
                    vm.isMetric ? "Height (cm)" : "Height (ft)",
                    text: $vm.height
                )
                .keyboardType(.decimalPad)
                .focused(
                    $focusedTextField,
                    equals: .height
                )
                .onSubmit {
                    focusedTextField = vm.isMetric ? .weight : .inches
                }
                .submitLabel(
                    .next
                )
                if !vm.isMetric {
                    TextField(
                        "Inches",
                        text: $vm.inches
                    )
                    .keyboardType(.decimalPad)
                    .focused(
                        $focusedTextField,
                        equals: .inches
                    )
                    .onSubmit {
                        focusedTextField = .weight
                    }
                    .submitLabel(
                        .next
                    )
                }
            }
            Section(
                header: Text(
                    "Weight"
                )
            ){
                TextField(
                    vm.isMetric ? "Weight (kg)" : "Weight (lbs)",
                    text: $vm.weight
                )
                .keyboardType(.decimalPad)
                .focused(
                    $focusedTextField,
                    equals: .weight
                )
                .onSubmit {
                    focusedTextField = nil
                }
                .submitLabel(
                    .done
                )
            }
        }

    }
}

enum FocusTextField {
    case height, weight, inches
}

