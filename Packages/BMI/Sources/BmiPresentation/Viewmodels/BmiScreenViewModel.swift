//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain
import BmiData
import SwiftUI

@available(
    iOS 13.0,
    *
)
final class BmiScreenViewModel: ObservableObject {
    
    private let getBmiCategory: GetBmiCategory?
    private let getMetricBmi: GetMetricBmi?
    private let getImperialBmi: GetImperialBmi?
    private let alertHelper: AlertHelper
    
    @Published var alert: AlertModel? = nil
    @Published var bmi: String? = nil
    @Published var bmiCategory: BmiCategory? = nil
    @Published var isMetric: Bool = true
    
    @Published var height = ""
    @Published var weight = ""
    @Published var inches = ""
    
    init(
        getBmiCategory: GetBmiCategory?,
        getMetricBmi: GetMetricBmi?,
        getImperialBmi: GetImperialBmi?,
        alertHelper: AlertHelper
    ) {
        self.getBmiCategory = getBmiCategory
        self.getMetricBmi = getMetricBmi
        self.getImperialBmi = getImperialBmi
        self.alertHelper = alertHelper
    }
    
    func getMetricBmi(
        height: Double,
        weight: Double
    ) {
        if let getMetricBmi {
            do {
                let bmi = try getMetricBmi.execute(
                    height: height,
                    weight: weight
                )
                self.bmi = String(
                    bmi
                )
                self.getBmiCategory(
                    bmi: bmi
                )
            } catch {
                self.alert = alertHelper.errorToBmiErrorAlert(
                    error: error
                )
            }
        } else {
            self.alert = AlertItem.unableToComplete
        }
        
    }
    
    func getImperialBmi(
        weight: Double,
        feet: Int,
        inches: Int
    ) {
        if let getImperialBmi {
            do {
                let bmi = try getImperialBmi.execute(
                    weight: weight,
                    feet: feet,
                    inches: inches
                )
                self.bmi = String(
                    bmi
                )
                self.getBmiCategory(
                    bmi: bmi
                )
            } catch {
                self.alert = alertHelper.errorToBmiErrorAlert(
                    error: error
                )
            }
        } else {
            self.alert = AlertItem.unableToComplete
        }
        
    }
    
    func unitsSwitched() {
        self.height = ""
        self.inches = ""
        self.weight = ""
    }
    
    private func getBmiCategory(
        bmi: Double
    ) {
        if let getBmiCategory {
            do {
                self.bmiCategory = try getBmiCategory.execute(
                    bmi: bmi
                )
            } catch {
                self.alert = alertHelper.errorToBmiErrorAlert(
                    error: error
                )
            }
        } else {
            self.alert = AlertItem.unableToComplete
        }
    }
    
}
