//
//  SwiftUIView.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import SwiftUI

@available(iOS 17.0.0, *)
struct UnitToggle: View {
    
    @ObservedObject var vm: BmiScreenViewModel
    
    var body: some View {
        HStack(
            spacing: 10
        ) {
            if vm.isMetric {
                SelectedButton(
                    title: "Metric"
                ) {
                    vm.isMetric = true
                    vm.unitsSwitched()
                }
                UnselectedButton(
                    title: "Imperial"
                ) {
                    vm.isMetric = false
                    vm.unitsSwitched()
                }
            } else {
                UnselectedButton(
                    title: "Metric"
                ) {
                    vm.isMetric = true
                    vm.unitsSwitched()
                }
                SelectedButton(
                    title: "Imperial"
                ) {
                    vm.isMetric = false
                    vm.unitsSwitched()
                }
            }
        }
    }
}

@available(iOS 17.0.0, *)
struct SelectedButton: View {
    
    private let title: String
    private let action: () -> ()
    
    init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(
                title
            )
        }
        .buttonStyle(
            .borderedProminent
        )
        .controlSize(
            .extraLarge
        )
        .tint(
            .green
        )
    }
}

@available(iOS 17.0.0, *)
struct UnselectedButton: View {
    
    private let title: String
    private let action: () -> ()
    
    init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(
                title
            )
            .foregroundStyle(
                Color(
                    .systemBackground
                )
            )
            .colorInvert()
        }
        .buttonStyle(
            .borderedProminent
        )
        .controlSize(
            .extraLarge
        )
        .tint(
            Color(
                .systemBackground
            )
        )
    }
}
