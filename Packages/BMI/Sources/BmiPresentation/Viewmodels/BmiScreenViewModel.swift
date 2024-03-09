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
import Alerts

@available(
    iOS 13.0,
    *
)
final class BmiScreenViewModel: ObservableObject {
    
    private let getBmiCategory: GetBmiCategory?
    private let getMetricBmi: GetMetricBmi?
    private let getImperialBmi: GetImperialBmi?
    private let alertHelper: AlertHelper?
    
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
        alertHelper: AlertHelper?
    ) {
        self.getBmiCategory = getBmiCategory
        self.getMetricBmi = getMetricBmi
        self.getImperialBmi = getImperialBmi
        self.alertHelper = alertHelper
    }
    
    func calculateMetricBmi() {
        if let getMetricBmi {
            do {
                let bmi = try getMetricBmi.execute(
                    height: Double(self.height) ?? -1,
                    weight: Double(self.weight) ?? -1
                )
                self.bmi = String(
                    bmi
                )
                self.getBmiCategory(
                    bmi: bmi
                )
            } catch {
                if let alertHelper {
                    self.alert = alertHelper.errorToAlert(
                        error: error
                    )
                }
            }
        } else {
            self.alert = BmiAlertItem.unableToComplete
        }
    }
    
    func calculateImperialBmi() {
        if let getImperialBmi {
            do {
                guard let inches = Int(self.inches) else {
                    self.alert = BmiAlertItem.invalidHeight
                    return
                }
                guard inches >= 0 && inches <= 12 else {
                    self.alert = BmiAlertItem.invalidHeight
                    return
                }
                let bmi = try getImperialBmi.execute(
                    weight: Double(self.weight) ?? -1,
                    feet: Int(self.height) ?? -1,
                    inches: Int(self.inches) ?? -1
                )
                self.bmi = String(
                    bmi
                )
                self.getBmiCategory(
                    bmi: bmi
                )
            } catch {
                if let alertHelper {
                    self.alert = alertHelper.errorToAlert(
                        error: error
                    )
                }
            }
        } else {
            self.alert = BmiAlertItem.unableToComplete
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
                if let alertHelper {
                    self.alert = alertHelper.errorToAlert(
                        error: error
                    )
                }
            }
        } else {
            self.alert = BmiAlertItem.unableToComplete
        }
    }
    
}
