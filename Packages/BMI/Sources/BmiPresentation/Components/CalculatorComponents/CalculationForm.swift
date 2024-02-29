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
    
    @State var height = ""
    @State var weight = ""
    @State var inches = ""
    
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
                    vm.isMetric ? "Height (meters)" : "Height (feet)",
                    text: $height
                ).focused(
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
                        text: $inches
                    ).focused(
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
                    text: $weight
                ).focused(
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

