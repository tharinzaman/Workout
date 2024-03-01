//
//  File.swift
//
//
//  Created by Tharin Zaman on 25/02/2024.
//

import Foundation
import SwiftUI
import BmiDomain
import BmiData

@available(
    iOS 17.0,
    *
)
public struct BmiScreen: View {
    
    @StateObject var vm: BmiScreenViewModel
    
    public init() {
        _vm = StateObject(
            wrappedValue: BmiScreenViewModel(
                getBmiCategory: BmiResolver.shared.resolve(
                    GetBmiCategory.self
                ),
                getMetricBmi: BmiResolver.shared.resolve(
                    GetMetricBmi.self
                ),
                getImperialBmi: BmiResolver.shared.resolve(
                    GetImperialBmi.self
                ),
                alertHelper: AlertHelperImpl()
            )
        )
    }
    
    public var body: some View {
        VStack(
            spacing: 20
        ) {
            BmiCalculatorView(
                vm: vm
            ).frame(height: 400)
            CalculateButton(
                vm: vm
            )
            BmiResultView(
                vm: vm
            )
        }.alert(
            item: $vm.alert
        ) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton
            )
        }
    }
    
}
