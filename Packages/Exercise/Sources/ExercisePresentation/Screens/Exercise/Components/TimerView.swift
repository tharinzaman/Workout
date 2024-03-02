//
//  SwiftUIView.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct SwiftUIView: View {
    
    @ObservedObject var vm: ExerciseScreenViewModel
    
    var body: some View {
        Rectangle()
            .frame(
                width: 500,
                height: 100
            )
            .foregroundColor(
                Color(
                    .systemBackground
                )
            )
    }
}

