//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain
import SwiftUI

@available(
    iOS 13.0,
    *
)
final internal class BmiScreenViewModel: ObservableObject {
    
    private let getBmiCategory: GetBmiCategory
    private let getMetricBmi: GetMetricBmi
    private let getImperialBmi: GetImperialBmi
    
    @Published var alert: Alert? = nil
    @Published var bmi: String? = nil
    @Published var bmiCategory: BmiCategory? = nil
    
    init(
        getBmiCategory: GetBmiCategory,
        getMetricBmi: GetMetricBmi,
        getImperialBmi: GetImperialBmi
    ) {
        self.getBmiCategory = getBmiCategory
        self.getMetricBmi = getMetricBmi
        self.getImperialBmi = getImperialBmi
    }
    
    func getMetricBmi(
        height: Double,
        weight: Double
    ) {
        do {
            let bmi = try getMetricBmi.execute(
                height: height,
                weight: weight
            )
            self.bmi = String(bmi)
            self.getBmiCategory(
                bmi: bmi
            )
        } catch {
            
        }
    }
    
    func getImperialBmi(
        weight: Double,
        feet: Int,
        inches: Int
    ) {
        do {
            let bmi = try getImperialBmi.execute(
                weight: weight,
                feet: feet,
                inches: inches
            )
            self.bmi = String(bmi)
            self.getBmiCategory(
                bmi: bmi
            )
        } catch {
            
        }
    }
    
    private func getBmiCategory(
        bmi: Double
    ) {
        do {
            self.bmiCategory = try getBmiCategory.execute(
                bmi: bmi
            )
        } catch {
            
        }
    }
}
