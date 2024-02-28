//
//  File.swift
//
//
//  Created by Tharin Zaman on 25/02/2024.
//

import Foundation
import SwiftUI
import BmiDomain

@available(
    iOS 14.0,
    *
)
struct BmiScreen: View {
    
    @StateObject var vm: BmiScreenViewModel
    
    init(
        getBmiCategory: GetBmiCategory,
        getMetricBmi: GetMetricBmi,
        getImperialBmi: GetImperialBmi
    ) {
        _vm = StateObject(
            wrappedValue: BmiScreenViewModel(
                getBmiCategory: getBmiCategory,
                getMetricBmi: getMetricBmi,
                getImperialBmi: getImperialBmi
            )
        )
    }
    
    var body: some View {
        VStack {
            BmiResultView(vm: vm)
        }
    }
    
}
